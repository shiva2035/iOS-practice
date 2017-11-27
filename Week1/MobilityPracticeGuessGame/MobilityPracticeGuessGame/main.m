//
//  main.m
//  MobilityPracticeGuessGame
//
//  Created by Shiva Kumar K on 6/27/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int answer=0, guess=0, turn=0;
        
        answer=arc4random()%100+1;
        
        NSLog(@"Random number is:%i",answer);
        
        while(answer!=guess){
            
            turn++;
            NSLog(@"Enter your guess within 100, turn:%i\n",turn);
            scanf("%i",&guess);
            
            if(guess == answer){
                NSLog(@"Correct Answer");
            }else if(guess>answer){
                NSLog(@"Guess is Higher");
            }else{
                NSLog(@"Guess is Lower");
            }
        }
        
        NSLog(@"It took %i turns to find the Answer\n",turn);
    }
    return 0;
}
