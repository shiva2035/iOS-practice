//
//  SearchViewController.m
//  WeatherApp
//
//  Created by Shiva Kumar K on 8/15/16.
//  Copyright © 2016 Accolite. All rights reserved.
//

#import "SearchViewController.h"
#import "CitiesTableTableViewController.h"
#import "SharedResourceHolder.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)searchCities:(id)sender {
    
    NSLog(@"Search Key: %@",self.countryName.text);
    
    CitiesTableTableViewController *citiesViewController = [[CitiesTableTableViewController alloc] init];
    citiesViewController.country = self.countryName.text;
    
    [[self navigationController] pushViewController:citiesViewController animated:YES];
    
}
@end
