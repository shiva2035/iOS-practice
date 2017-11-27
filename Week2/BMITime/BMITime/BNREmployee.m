//
//  BNREmployee.m
//  BMITime
//
//  Created by Shiva Kumar K on 7/2/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import "BNREmployee.h"
#import "BNRAsset.h"

@implementation BNREmployee

- (void)setAssets:(NSArray *)a
{
    _assets = [a mutableCopy];
}

- (NSArray *)assets
{
    return [_assets copy];
}

- (void)addAsset:(BNRAsset *)a{
    // Is assets nil?
    if (!_assets) {
        // Create the array
        _assets = [[NSMutableArray alloc] init];
    }
    [_assets addObject:a];
}

- (unsigned int)valueOfAssets
{
    // Sum up the resale value of the assets
    unsigned int sum = 0;
    for (BNRAsset *a in _assets) {
        sum += [a resaleValue];
    }
    return sum;
}

- (double)yearsOfEmployment
{
    // Do I have a non-nil hireDate?
    if (self.hireDate) {
        // NSTimeInterval is the same as double
        NSDate *now = [NSDate date];
        NSTimeInterval secs = [now timeIntervalSinceDate:self.hireDate];
        return secs / 31557600.0;  // Seconds per year
    } else {
        return 0;
    }
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<Employee %u>", self.employeeID];
    return [NSString stringWithFormat:@"<Employee %u: $%u in assets>",
            self.employeeID, self.valueOfAssets];
}

- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}

-(float) bodyMassIndex{
    
    float normalBMI = [super bodyMassIndex];
    return normalBMI * 0.9;
}

@end
