//
//  main.m
//  BMITime
//
//  Created by Shiva Kumar K on 7/1/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"
#import "BNRForeignStockHolding.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //BNRPerson - Example
        BNRPerson *mikey = [[BNRPerson alloc] init];
        [mikey setWeightInKilos:96];
        [mikey setHeightInMeters:1.8];
        float height = [mikey heightInMeters];
        int weight = [mikey weightInKilos];
        NSLog(@"mikey is %.2f meters tall and weighs %d kilograms", height, weight);
        float bmi = [mikey bodyMassIndex];
        NSLog(@"mikey has a BMI of %f", bmi);
        
        //BNRStockHolding
        NSMutableArray *bnrArray = [[NSMutableArray alloc] init];
        BNRStockHolding *holding1 = [[BNRStockHolding alloc] init];
        [holding1 setPurchaseSharePrice:2.30];
        [holding1 setCurrentSharePrice:4.50];
        [holding1 setNumOfShares:40];
        
        BNRStockHolding *holding2 = [[BNRStockHolding alloc] init];
        [holding2 setPurchaseSharePrice:12.19];
        [holding2 setCurrentSharePrice:10.56];
        [holding2 setNumOfShares:90];
        
        BNRStockHolding *holding3 = [[BNRStockHolding alloc] init];
        [holding3 setPurchaseSharePrice:45.10];
        [holding3 setCurrentSharePrice:49.51];
        [holding3 setNumOfShares:210];
        
        [bnrArray addObject:holding1];
        [bnrArray addObject:holding2];
        [bnrArray addObject:holding3];
        for(BNRStockHolding *bnrHold in bnrArray){
            NSLog(@"Cost in USD: %f : \t Value: %f", [bnrHold costInDollars], [bnrHold valueInDollars]);
        }
        
        BNRPerson *person = [[BNREmployee alloc] init];
        person.weightInKilos = 96;
        person.heightInMeters = 1.8;
        NSLog(@"Person has a weight of %d", person.weightInKilos);
        NSLog(@"Person has a height of %f", person.heightInMeters);
        float bodyMassIndex = [person bodyMassIndex];
        NSLog(@"Person has BMI of %f", bodyMassIndex);
        
        
        BNREmployee *emp = [[BNREmployee alloc] init];
        emp.weightInKilos = 96;
        emp.heightInMeters = 1.8;
        emp.employeeID = 12;
        emp.hireDate  = [NSDate dateWithNaturalLanguageString:@"Aug 2nd, 2010"];
        float heightOfEmp = emp.heightInMeters;
        int weightOfEmp = emp.weightInKilos;
        NSLog(@"Employee is %.2f meters tall and weighs %d kilos", heightOfEmp, weightOfEmp);
        NSLog(@"Employee %u is hired on %@", emp.employeeID, emp.hireDate);
        float bodyMassInd = [emp bodyMassIndex];
        double years = [emp yearsOfEmployment];
        NSLog(@"BMI of %.2f, has worked with us for %.2f years", bodyMassInd, years);
        
        //BNRForeignStockHolding - Challenge
        BNRForeignStockHolding *fStock = [[BNRForeignStockHolding alloc] init];
        [fStock setPurchaseSharePrice:2.30];
        [fStock setCurrentSharePrice:4.50];
        [fStock setNumOfShares:40];
        [fStock setConversionRate:0.94];
         NSLog(@"%.2f is the conversion rate for the given stockhold details", fStock.conversionRate);
        
        
    }
    return 0;
}
