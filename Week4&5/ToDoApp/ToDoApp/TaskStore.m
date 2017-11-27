//
//  TaskStore.h
//  ToDoApp
//
//  Created by Shiva Kumar K on 7/24/16.
//  Copyright © 2016 Accolite. All rights reserved.
//

#import "TaskStore.h"
#import "Task.h"


@interface TaskStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation TaskStore

+ (instancetype)sharedTaskStore
{
    static TaskStore *sharedStore = nil;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[BNRItemStore sharedStore]" userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSArray *)allItems
{
    return self.privateItems;
}

- (Task *)createTask:(Task *) task
{
    
    [self.privateItems addObject:task];
    NSLog(@"Task Added Successfully!");
    return task;
}

- (void)removeTask:(Task *)item
{
    [self.privateItems removeObjectIdenticalTo:item];
}



@end
