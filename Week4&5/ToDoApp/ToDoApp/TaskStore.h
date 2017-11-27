//
//  TaskStore.h
//  ToDoApp
//
//  Created by Shiva Kumar K on 7/24/16.
//  Copyright © 2016 Accolite. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Task;

@interface TaskStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

+ (instancetype) sharedTaskStore;
- (Task *)createTask:(Task *)task;
- (void)removeTask:(Task *)task;


@end
