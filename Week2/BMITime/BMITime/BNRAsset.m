//
//  BNRAsset.m
//  BMITime
//
//  Created by Shiva Kumar K on 7/2/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import "BNRAsset.h"

@implementation BNRAsset

- (NSString *) description{
    return [NSString stringWithFormat:@"<%@: $%u>", self.label, self.resaleValue];
}

- (void) dealloc{
    NSLog(@"De-allocating %@", self);
}

@end
