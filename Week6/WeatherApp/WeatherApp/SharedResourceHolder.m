//
//  SharedResourceHolder.m
//  WeatherApp
//
//  Created by Shiva Kumar K on 8/25/16.
//  Copyright © 2016 Accolite. All rights reserved.
//

#import "SharedResourceHolder.h"

@interface SharedResourceHolder ()

@property (nonatomic) NSString *city;
@property (nonatomic) NSString *country;

@end

@implementation SharedResourceHolder

+ (instancetype)getSharedObjectInstance
{
    static SharedResourceHolder *sharedHolder;
    
    if (!sharedHolder) {
        sharedHolder = [[self alloc] init];
    }
    
    return sharedHolder;
}


-(void)setSelectedCountry:(NSString *)selectedCountry
{
    _selectedCountry = self.country;
}
-(void) setSelectedCity:(NSString *)selectedCity
{
    _selectedCity = self.city;
}

-(NSString *) getSelectedCountry
{
    return self.country;
}

-(NSString *) getSelectedCity
{
    return self.city;
}

@end
