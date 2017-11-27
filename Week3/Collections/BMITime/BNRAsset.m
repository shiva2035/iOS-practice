//
//  BNRAsset.m
//  BMITime
//
//  Created by Shiva Kumar K on 7/10/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import "BNRAsset.h"
#import "BNREmployee.h"


@implementation BNRAsset


- (NSString *)description
{
    if (self.holder) {
        return [NSString stringWithFormat:@"<%@: $%d, assigned to %@>",self.label, self.resaleValue, self.holder];
    } else {
        return [NSString stringWithFormat:@"<%@: $%d unassigned>",self.label,self.resaleValue];
    }
}

- (void)dealloc
{
    NSLog(@"deallocating %@",self);
}

@end
