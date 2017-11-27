//
//  BNREmployee.h
//  BMITime
//
//  Created by Shiva Kumar K on 7/10/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "BNRPerson.h"
@class BNRAsset;

@interface BNREmployee : BNRPerson

@property (nonatomic) unsigned int employeeID;
@property (nonatomic) NSDate *hireDate;
@property (nonatomic, copy) NSSet *assets;
- (double) yearsOfEmployment;
- (void)addAsset:(BNRAsset *)a;
- (unsigned int)valueOfAssets;

@end
