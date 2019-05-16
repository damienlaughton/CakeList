//
//  CakeViewModel.m
//  Cake List
//
//  Created by Damien Laughton on 16/05/2019.
//  Copyright © 2018 Stewart Hart. All rights reserved.
//

#import "CakeListViewModel.h"

@interface CakeListViewModel ()

@property (weak, nonatomic) id<CakeListViewDelegate> viewDelegate;

@end

@implementation CakeListViewModel

- (NSURL *)cakesURL;
{
    NSURL *cakesURL =
    [NSURL URLWithString:
     @"https://gist.githubusercontent.com/hart88/198f29ec5114a3ec3460/raw/8dd19a88f9b8d24c23d9960f3300d0c917a4f07c/cake.json"];
    
    return cakesURL;
}

// MARK: - ViewModel Contract Delegate

- (void)takeView:(id<CakeListViewDelegate>)viewDelegate;
{
     self.viewDelegate = viewDelegate;
}

- (void)dropView;
{
    self.viewDelegate = nil;
}

- (void)refreshRequest;
{
    [self fetchCakes];
}

// Get ALL the cake

- (void)fetchCakes;
{
    NSURL *url = [self cakesURL];
    
    __block NSArray *objects;
    
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
                                          dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                              NSError *jsonError;
                                              id responseData = [NSJSONSerialization
                                                                 JSONObjectWithData:data
                                                                 options:kNilOptions
                                                                 error:&jsonError];
                                              if (!jsonError){
                                                  objects = responseData;
                                                  
                                                  NSMutableArray <Cake *>*newCakes =
                                                  
                                                   [[NSMutableArray alloc] initWithCapacity:objects.count];
                                                  
                                                  for (NSDictionary *dictionary in objects) {
                                                      Cake *cake = [[Cake alloc] initWithDictionary:dictionary];
                                                      if (cake)
                                                      {
                                                          [newCakes addObject:cake];
                                                      }
                                                  }
                                                  
                                                  if ([self.viewDelegate respondsToSelector:@selector(updateTableWith:)]) {
                                                      dispatch_async(dispatch_get_main_queue(), ^{
                                                          [self.viewDelegate updateTableWith:newCakes];
                                                      });
                                                  }
                                                  
                                              } else {
                                              }
                                          }];
    
    
    [downloadTask resume];
}

@end
