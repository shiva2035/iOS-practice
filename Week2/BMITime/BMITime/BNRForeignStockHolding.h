//
//  BNRForeignStockHolding.h
//  BMITime
//
//  Created by Shiva Kumar K on 7/2/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRStockHolding.h"

@interface BNRForeignStockHolding : BNRStockHolding

@property (nonatomic) float conversionRate;

@end
