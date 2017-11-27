//
//  BNRPerson.h
//  BMITime
//
//  Created by Shiva Kumar K on 7/1/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRPerson.h"

@interface BNRPerson : NSObject{

    float _heightInMeters;
    int _weightInKilos;
}
-(float)heightInMeters;
-(void)setHeightInMeters:(float)h;
-(int)weightInKilos;
-(void)setWeightInKilos:(int)w;
-(float)bodyMassIndex;

@end
