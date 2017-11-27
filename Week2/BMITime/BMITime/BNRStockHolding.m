//
//  BNRStockHolding.m
//  BMITime
//
//  Created by Shiva Kumar K on 7/1/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import "BNRStockHolding.h"

@implementation BNRStockHolding

- (float) purchasePrice{
    return _purchaseSharePrice;
}

- (void)setPurchaseSharePrice:(float)sharePrice{
    _purchaseSharePrice = sharePrice;
}

- (float) currentPrice{
    return _currentSharePrice;
}

- (void) setCurrentSharePrice:(float)currentPrice{
    _currentSharePrice = currentPrice;
}

- (int) numOfShares{
    return _numOfShares;
}

- (void) setNumOfShares:(int) num{
    _numOfShares = num;
}

- (float) costInDollars{
    return _purchaseSharePrice * _numOfShares;
}

- (float) valueInDollars{
    return _currentSharePrice * _numOfShares;
}

@end
