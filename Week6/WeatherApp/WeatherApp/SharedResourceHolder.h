//
//  SharedResourceHolder.h
//  WeatherApp
//
//  Created by Shiva Kumar K on 8/25/16.
//  Copyright © 2016 Accolite. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SharedResourceHolder : NSObject

+ (instancetype)getSharedObjectInstance;

@property (nonatomic) NSString *selectedCountry;
@property (nonatomic) NSString *selectedCity;

-(void) setSelectedCity:(NSString *)selectedCity;
-(void) setSelectedCountry:(NSString *)selectedCountry;

-(NSString*) getSelectedCountry;
-(NSString*) getSelectedCity;

//+(instancetype)sharedCitiesList;
//-(void)setCities:(NSArray *)cities;
//-(NSArray*)getCities;
//-(NSString*)getCountry;


@end
