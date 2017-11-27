//
//  main.m
//  Week2_NSArrays
//
//  Created by Shiva Kumar K on 7/1/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSArray Challenge
        NSDate *now = [NSDate date];
        NSDate *tomorrow = [now dateByAddingTimeInterval:24.0*60.0*60.0];
        NSDate *yesterday = [now dateByAddingTimeInterval:-24.0 * 60.0 * 60.0];
        NSArray *dateList = @[now, tomorrow, yesterday];
        //NSMutableArray Challenge & Fast-Enumerated for loop
        NSMutableArray *mutableArray = [NSMutableArray array];
        [mutableArray addObject:@"Shiva"];
        [mutableArray addObject:@"Kumar"];
        [mutableArray addObject:@"MacMasters"];
        for(NSString *str in mutableArray){
            NSLog(@"%@\n", str);
        }
        
        //Interesting Names:
        NSString *nameString = [NSString stringWithContentsOfFile:@"/usr/share/dict/propernames"
                                                         encoding:NSUTF8StringEncoding
                                                            error:NULL];
        
        NSArray *names = [nameString componentsSeparatedByString:@"\n"];
        
        NSString *wordString = [NSString stringWithContentsOfFile:@"/usr/share/dict/words"
                                                         encoding:NSUTF8StringEncoding
                                                            error:NULL];
        
        NSArray *words = [wordString componentsSeparatedByString:@"\n"];
        
        NSUInteger nameCount = [names count];
        
        for (int i = 0; i < nameCount; i++){
            NSString *n = [names[i] lowercaseString];
            for (NSString *w in words) {
                NSComparisonResult result = [n localizedCompare:w];
                if (result == NSOrderedSame) {
                    NSLog(@"word \"%@\" matches \"%@\"", names[i], w);
                }
                
            }
        }
        
        
    }
    return 0;
}
