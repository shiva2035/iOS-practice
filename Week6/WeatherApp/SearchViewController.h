//
//  SearchViewController.h
//  WeatherApp
//
//  Created by Shiva Kumar K on 8/15/16.
//  Copyright © 2016 Accolite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *countryName;
- (IBAction)searchCities:(id)sender;

@end
