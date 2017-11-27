//
//  main.m
//  Week2_NSString
//
//  Created by Shiva Kumar K on 6/30/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdio.h>
#import <readline/readline.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *string1 = @"Hello MacMasters!";
        NSString *string2 = @"masters";
        NSRange range = [string1 rangeOfString:string2
                                       options:NSCaseInsensitiveSearch];
        if(range.location == NSNotFound){
                NSLog(@"Not Found");
        }else{
            printf("%ld\n", range.location);
        }
        
        const char *input = readline(NULL);
        NSString *result = [NSString stringWithUTF8String:input];
        NSLog(@"%@\n", [result capitalizedString]);
        
        
    }
    return 0;
}
