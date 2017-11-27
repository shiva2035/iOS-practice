//
//  main.m
//  MobilityPractices_Week1
//
//  Created by Shiva Kumar K on 6/27/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#include <math.h>
#import <readline/readline.h>
#import <stdio.h>
#import <Foundation/Foundation.h>

float findThirdAngle(float angle1, float angle2){
    return (180 - (angle1+angle2));
}
int square(int number){
    return number * number;
}

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        //HelloWorld
        NSLog(@"Hello Folks, This is my first program!");
        
        //Sum of two floats
        float number1 = 2.35, number2 = 2.35;
        double sum = number1 + number2;
        printf("Sum of two float numbers(%f,%f) is:%g\n", number1, number2, sum);
        
        //Observing out put of if/else/else-if
        int i = 20, j = 25;
        int k = ( i > j ) ? 10 : 5;
        if ( 5 < j - k ) {
            printf("The first expression is true.");
        } else if ( j > i ) {
            printf("The second expression is true.");
        } else {
            printf("Neither expression is true.");
        }
        
        //Finding third Angle in triangle when two angles are known. [FUNCTIONS]
        float angleA= 30.0;
        float angleB = 60.0;
        float angleC = findThirdAngle(angleA, angleB);
        printf("Third angle in triangle is :%f\n", angleC);
        
        //Square of given number
        int number = 5;
        printf("Square of %d is: %d\n", number , square(number));
        
        //sine of 1 radian
        double output = sin(1);
        printf("sin(1) is:%.3g", output);
        
        //Count Down
        printf("Enter the number to start count down from:");
        int input;
        scanf("%d",&input);
        for(int i = input; i>=0; i--){
            printf ("%d\t", i);
        }
        
        //Count down - Found One
        for (int i=99; i>=0;i--){
            printf("%d\n", i);
            if(i%5 ==0){
                printf("Found one");
            }
        }
        
        //Usage of sizeof()
        printf("Size of Float is: %zu bytes",sizeof(float));
 
        //DOB
        NSDate *date=[[NSDate alloc] init];
        double cur_time= [date timeIntervalSinceDate:date];
        NSLog(@"Current Time:%l",cur_time);
        NSDateComponents *components=[[NSDateComponents alloc] init];
        [components setYear:1993];
        [components setMonth:1];
        [components setDay:29];
        [components setHour:0];
        [components setMinute:0];
        [components setSecond:0];
        NSCalendar *calendar=[[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDate *dob= [calendar dateFromComponents:components];
        NSLog(@"DOB is :%@\n",dob);
        
        //Finding my host name
        NSHost *host =[NSHost currentHost];
        NSString *name=[host localizedName];
        NSLog(@"HOST_NAME: %@\n",name);
        
        
        
    }
    return 0;
}

