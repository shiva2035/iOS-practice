//
//  Person.m
//  MobilityPractices_ObjectsClasses
//
//  Created by Shiva Kumar K on 6/28/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import "Person.h"

@implementation Person
    
- (void)enterInfo {
    char cstring[40];
    NSLog(@"What is the first name?");
    scanf("%s", cstring);
    firstName = [NSString stringWithCString:cstring encoding:1];
    
}

- (void)printInfo {
    NSLog(@"First name: %@", firstName);
}

@end
