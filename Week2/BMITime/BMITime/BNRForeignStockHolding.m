//
//  BNRForeignStockHolding.m
//  BMITime
//
//  Created by Shiva Kumar K on 7/2/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import "BNRForeignStockHolding.h"

@implementation BNRForeignStockHolding

-(float) costInDollars{
    return _purchaseSharePrice * 63;
}
-(float) valueInDollars{
    return _currentSharePrice * 63;//Assume 1 USD = 63 INR
}

@end
