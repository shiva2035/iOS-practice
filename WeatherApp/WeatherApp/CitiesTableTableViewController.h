//
//  CitiesTableTableViewController.h
//  WeatherApp
//
//  Created by Shiva Kumar K on 8/15/16.
//  Copyright © 2016 Accolite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CitiesTableTableViewController : UITableViewController

@property (strong, nonatomic) NSString *country;
- (void)fetchFeed;

@end
