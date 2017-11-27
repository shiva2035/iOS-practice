//
//  Person.h
//  MobilityPractices_ObjectsClasses
//
//  Created by Shiva Kumar K on 6/28/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
    NSString *firstName;
    NSString *lastName;
    int age;
}
- (void)enterInfo;
- (void)printInfo;
@end
