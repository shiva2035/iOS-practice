//
//  WeatherDetailViewController.h
//  WeatherApp
//
//  Created by Shiva Kumar K on 8/25/16.
//  Copyright © 2016 Accolite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherDetailViewController : UIViewController

@property (strong, nonatomic) NSString *city;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;

- (void)fetchFeed;

@end
