//
//  Cake.m
//  Cake List
//
//  Created by Damien Laughton on 16/05/2019.
//  Copyright © 2018 Stewart Hart. All rights reserved.
//

#import "Cake.h"

@interface Cake (Private)

    @property (strong, nonatomic) UIImage *cakeImage;

@end

@implementation Cake

@synthesize cakeImage = _cakeImage;

- (void)setCakeImagePath:(NSString *)cakeImagePath;
{
    _cakeImagePath = cakeImagePath;

    [self fetchCakeImageForRemotePath:_cakeImagePath];

    if (self.cakeImage == nil) {
        [self fetchCakeImageForLocalPath:_cakeImagePath];
    }
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
{
    if (self == [super init])
    {
        self.cakeName = dictionary[@"title"];
        self.cakeDescription = dictionary[@"desc"];
        self.cakeImagePath = dictionary[@"image"];
    }
    
    return self;
}

- (void)fetchCakeImageForRemotePath:(NSString *)path;
{
    NSURL *URL = [NSURL URLWithString:path];
    NSData *data = [NSData dataWithContentsOfURL:URL];
    _cakeImage = [UIImage imageWithData:data];
}

- (void)fetchCakeImageForLocalPath:(NSString *)path;
{
    NSURL *URL = [NSURL fileURLWithPath:path];
    NSData *data = [NSData dataWithContentsOfURL:URL];
    _cakeImage = [UIImage imageWithData:data];
}

@end
