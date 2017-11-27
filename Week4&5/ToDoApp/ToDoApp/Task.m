//
//  Task.m
//  ToDoApp
//
//  Created by Shiva Kumar K on 7/24/16.
//  Copyright © 2016 Accolite. All rights reserved.
//

#import "Task.h"

@implementation Task

- (instancetype)initWithTaskName:(NSString *)name
                  description:(NSString *)description
                   {
    self = [super init];
    
    if (self) {
        _name = name;
        _desc = name;
    }
    
    return self;
}

- (instancetype)initWithTaskName:(NSString *)name
{
    return [self initWithTaskName:name
                   description:name];
}

- (instancetype)init
{
    return [self initWithTaskName:@""];
}

- (NSString *)description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"Name:%@ (Description:%@)",
                                   self.name, self.desc];
    
    return descriptionString;
}


@end
