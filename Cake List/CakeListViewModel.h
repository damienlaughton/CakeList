//
//  CakeListViewModel.h
//  Cake List
//
//  Created by Damien Laughton on 16/05/2019.
//  Copyright © 2018 Stewart Hart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cake.h"
#import "Contracts.h"

@interface CakeListViewModel : NSObject <CakeListViewModalDelegate>

- (NSURL *)cakesURL;

@end
