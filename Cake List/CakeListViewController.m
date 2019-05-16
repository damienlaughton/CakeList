//
//  CakeListViewController.m
//  Cake List
//
//  Created by Stewart Hart on 19/05/2015.
//  Copyright (c) 2015 Stewart Hart. All rights reserved.
//

#import "CakeListViewController.h"

#import "CakeCell.h"
#import "Cake.h"

@interface CakeListViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) CakeListViewModel *cakeViewModel;

@property (strong, nonatomic) UIRefreshControl *refreshControl;

@property (strong, nonatomic) UILabel *backgroundLabel;

@property (strong, nonatomic) NSArray <Cake *>*cakes;

@end

@implementation CakeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
    [self configureViewModal];
}

- (void)dealloc;
{
    [self.cakeViewModel dropView];
    self.cakeViewModel = nil;
}

- (void)configureViewModal;
{
    self.cakeViewModel = [[CakeListViewModel alloc] init];
    [self.cakeViewModel takeView:self];
    [self.cakeViewModel refreshRequest];
}

- (void)configureView;
{
    [self configureRefreshControl];
    [self configureBackgroundLabel];
    [self showBackgroundLabel];
}

- (void)configureRefreshControl;
{
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(refreshPulled:) forControlEvents:UIControlEventValueChanged];

    if (@available(iOS 10.0, *)) {
        self.tableView.refreshControl = self.refreshControl;
    } else {
        [self.tableView addSubview:self.refreshControl];
    }
}

- (void)configureBackgroundLabel;
{
    self.backgroundLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, self.tableView.bounds.size.height)];
    self.backgroundLabel.text             = @"Fetching Cakes ...";
    self.backgroundLabel.textColor        = [UIColor blackColor];
    self.backgroundLabel.textAlignment    = NSTextAlignmentCenter;
}

- (void)showBackgroundLabel;
{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundView = self.backgroundLabel;
}

- (void)hideBackgroundLabel;
{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.backgroundView = nil;
}

// MARK: - Table View Delegates and Helpers

- (Cake *)cakeAtIndexPath:(NSIndexPath *)indexPath;
{
    Cake *cake = self.cakes[indexPath.row];

    return cake;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRowsInSection = self.cakes.count;
    
    return numberOfRowsInSection;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CakeCell *cell = (CakeCell*)[tableView dequeueReusableCellWithIdentifier:@"CakeCell"];
    
    Cake *cake = [self cakeAtIndexPath:indexPath];
    
    [cell configureWithCake:cake];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)refreshPulled:(id)sender;
{
    [self.cakeViewModel refreshRequest];
}

// CakeViewModelDelegate Method(s)

- (void)updateTableWith:(NSMutableArray <Cake *>*)cakes;
{
    self.cakes = cakes;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.refreshControl endRefreshing];
        
        [self hideBackgroundLabel];

        [self.tableView reloadData];
    });
}

@end
