//
//  main.m
//  Constants
//
//  Created by Shiva Kumar K on 7/10/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        NSLog(@"\u03c0 is %f", M_PI);
        NSLog(@"%d is the Larger", MAX(10,20));
        NSLocale *here = [NSLocale currentLocale];
        NSString *currency = [here objectForKey:NSLocaleCurrencyCode];
        NSLog(@"Local Currency is %@", currency);
    
    }
    return 0;
}
