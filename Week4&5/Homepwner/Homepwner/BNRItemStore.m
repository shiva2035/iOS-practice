//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Shiva Kumar K on 7/14/16.
//  Copyright © 2016 Accolite. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore ()

//@property (nonatomic) NSMutableArray *privateItems;

@property (nonatomic) NSMutableArray *privateItemsBelow50;
@property (nonatomic) NSMutableArray *privateItemsAbove50;

@end

@implementation BNRItemStore

+ (instancetype)sharedStore
{
    static BNRItemStore *sharedStore = nil;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[BNRItemStore sharedStore]" userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        _privateItemsBelow50 = [[NSMutableArray alloc] init];
        _privateItemsAbove50 = [[NSMutableArray alloc] init];
        //_privateItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

//- (NSArray *)allItems
//{
//    return self.privateItems;
//}

- (NSArray *) allItemsUnder50
{
    return self.privateItemsBelow50;
}

- (NSArray *) allItemsOver50
{
    return self.privateItemsAbove50;
}

- (BNRItem *) createItem
{
    BNRItem *randomItem = [BNRItem randomItem];
    
    if (randomItem.valueInDollars >= 50)
    {
        [self.privateItemsAbove50 addObject:randomItem];
    }
    else {
        [self.privateItemsBelow50 addObject:randomItem];
    }
    
    return randomItem;
}

@end
