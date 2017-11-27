//
//  main.m
//  Stringz_Files
//
//  Created by Shiva Kumar K on 7/10/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableString *str = [[NSMutableString alloc] init];
        for(int i=0; i<10; i++){
            [str appendString:@"Shiva is Cool!\n"];
        }

        NSError *error;
        BOOL success = [str writeToFile:@"/tmp/cool.txt"
                             atomically:YES
                               encoding:NSUTF8StringEncoding
                                  error:&error];
        
        if (success) {
            NSLog(@"Done Writing the contents to file: /tmp/cool.txt");
        } else {
            NSLog(@"writing /tmp/cool.txt failed: %@", [error localizedDescription]);
        }
        
        NSString *str1 = [[NSString alloc] initWithContentsOfFile:@"/etc/resolv.conf"
                                                         encoding:NSASCIIStringEncoding
                                                            error:&error];
        if(!str){
            NSLog(@"Reading File failed: %@", [error localizedDescription]);
        }else{
            NSLog(@"Resolv.conf looks like this: %@", str1);
        }
        NSURL *url = [NSURL URLWithString:@"http://www.google.com/images/logos/ps_logo2.png"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSError *err1 = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:NULL
                                                         error:&err1];
        if(!data){
            NSLog(@"Fetch Failed: %@", [error localizedDescription]);
            return 1;
        }
        NSLog(@"The file is %lu bytes", (unsigned long) [data length]);
        BOOL written = [data writeToFile:@"/tmp/google.png"
                                 options:NSDataWritingAtomic
                                   error:&err1];
        if(!written){
            NSLog(@"Written Failed: %@", [error localizedDescription]);
            return 1;
        }
        NSLog(@"Success!");
        
    }
    return 0;
}
