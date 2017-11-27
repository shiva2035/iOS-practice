//
//  main.m
//  MobilityPractices_ObjectsClasses
//
//  Created by Shiva Kumar K on 6/28/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *people = [[NSMutableArray alloc] init];
        
        Person *person1 = [[Person alloc] init];
        [person1 enterInfo];
        [person1 printInfo];
        [people addObject:person1];
        Person *person2 = [[Person alloc] init];
        [person2 enterInfo];
        [person2 printInfo];
        [people addObject:person2];
        NSLog(@"Number of People in array %li\n they are:", [people count]);
        for(Person *p in people){
            [p printInfo];
        }
    }
    return 0;
}
