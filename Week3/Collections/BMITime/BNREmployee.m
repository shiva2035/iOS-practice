//
//  BNREmployee.m
//  BMITime
//
//  Created by Shiva Kumar K on 7/10/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import "BNREmployee.h"
#import "BNRAsset.h"

@interface BNREmployee ()
{
    NSMutableSet *_assets;
}

@property  (nonatomic) unsigned int officeAlarmCode;

@end

@implementation BNREmployee

- (void)setAssets:(NSArray *)a
{
    _assets = [a mutableCopy];
}

- (NSMutableSet *)assets
{
    return [_assets copy];
}

- (void)addAsset:(BNRAsset *)a
{
    if (!_assets)
    {
        _assets = [[NSMutableSet alloc] init];
    }
    [_assets addObject:a];
    a.holder = self;
}

- (void)removeAsset:(BNRAsset *)a
{
    if (_assets)
    {
        [_assets removeObject:a];
    }
}

- (unsigned int)valueOfAssets
{
    unsigned int sum = 0;
    for (BNRAsset *a in _assets) {
        sum += [a resaleValue];
    }
    return sum;
}

- (double)yearsOfEmployment
{
    if (self.hireDate){
        NSDate *now = [NSDate date];
        NSTimeInterval secs = [now timeIntervalSinceDate:self.hireDate];
        return secs/ 31557600.0;
    } else {
        return 0;
    
    }
}

- (float)bodyMassIndex
{
    float normalBMI = [super bodyMassIndex];
    return normalBMI * 0.9;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<Employee %u: $%u in assets>", self.employeeID, self.valueOfAssets];
}

- (void)dealloc
{
    NSLog(@"deallocating %@",self);
}
@end
