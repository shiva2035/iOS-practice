//
//  main.m
//  RandomItems
//
//  Created by Shiva Kumar K on 7/2/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

void iterateOnArray(NSMutableArray *items){
    
    for (int i = 0; i < [items count]; i++) {
        NSString *item = [items objectAtIndex:i];
        NSLog(@"%@", item);
    }
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
        NSMutableArray *items = [[NSMutableArray alloc] init];
        [items addObject:@"One"];
        [items addObject:@"Two"];
        [items addObject:@"Three"];
        [items insertObject:@"Zero" atIndex:0];
        iterateOnArray(items);
        
        BNRItem *item = [[BNRItem alloc] init];
        item.itemName=@"Red Sofa";
        item.serialNumber=@"A1B2C";
        item.valueInDollars = 100;
        NSLog(@"%@", item);
        BNRItem *item2 = [[BNRItem alloc] initWithItemName:@"RedSofa_2"
                                            valueInDollars:100
                                              serialNumber:@"A1B2C"];
        NSLog(@"%@", item2);

        for (int i = 0; i < 10; i++) {
            BNRItem *item = [BNRItem randomItem];
            [items addObject:item];
        }
        
        for (BNRItem *item in items) {
            NSLog(@"%@", item);
        }
        
       // Destroy the mutable array object
        BNRContainer *bnrContainer =[[BNRContainer alloc] init];
        items = nil;
       
    }
    return 0;
    
    
    
}



