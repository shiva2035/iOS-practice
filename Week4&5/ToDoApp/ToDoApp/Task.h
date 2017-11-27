//
//  Task.h
//  ToDoApp
//
//  Created by Shiva Kumar K on 7/24/16.
//  Copyright © 2016 Accolite. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

- (instancetype)initWithTaskName:(NSString *)name
                  description:(NSString *)description;

- (instancetype)initWithTaskName:(NSString *)name;


@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic) BOOL completed;
@property (nonatomic, strong) NSDate *dueDate;

@end
