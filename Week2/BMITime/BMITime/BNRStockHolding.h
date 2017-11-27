//
//  BNRStockHolding.h
//  BMITime
//
//  Created by Shiva Kumar K on 7/1/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRStockHolding : NSObject{
    float _purchaseSharePrice;
    float _currentSharePrice;
    int _numOfShares;
}
- (float) costInDollars; //purchaseSharePrice * numOfShares;
- (float) valueInDollars; //currentSharePrice * numOfShares;
- (void) setCurrentSharePrice:(float)currentPrice;
- (void) setPurchaseSharePrice:(float)sharePrice;
- (void) setNumOfShares:(int)num;

@end
