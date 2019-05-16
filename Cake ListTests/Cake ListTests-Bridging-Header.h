//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import "Cake.h"
#import "CakeListViewModel.h"
#import "Contracts.h"

@interface CakeListViewModel(PrivateMethods)

- (void)fetchCakes;
@property (weak, nonatomic) id<CakeListViewDelegate> viewDelegate;

@end
