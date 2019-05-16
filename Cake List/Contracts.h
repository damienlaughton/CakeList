//
//  Contracts.h
//  Cake List
//
//  Created by Damien Laughton on 16/05/2019.
//  Copyright © 2019 Stewart Hart. All rights reserved.
//

#ifndef Contracts_h
#define Contracts_h

// This is the guarantee that the view will implement these methods
@protocol CakeListViewDelegate <NSObject>

- (void)updateTableWith:(NSArray <Cake *>*)cakes;

@end

// This is the guarantee that the view model will implement these methods
@protocol CakeListViewModalDelegate <NSObject>

- (void)takeView:(id<CakeListViewDelegate>)viewDelegate;

- (void)refreshRequest;

- (void)dropView;

@end

#endif /* Contracts_h */
