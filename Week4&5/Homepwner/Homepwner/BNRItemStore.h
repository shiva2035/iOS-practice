//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Shiva Kumar K on 7/14/16.
//  Copyright © 2016 Accolite. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

@property (nonatomic, readonly) NSArray *allItemsAbove50;
@property (nonatomic, readonly) NSArray *allItemsBelow50;

+ (instancetype)sharedStore;
- (BNRItem *)createItem;

@end
