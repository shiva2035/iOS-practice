//
//  ViewController.m
//  WeatherApp
//
//  Created by Shiva Kumar K on 8/15/16.
//  Copyright © 2016 Accolite. All rights reserved.
//

#import "ViewController.h"
#import "CitiesTableTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)searchCities:(id)sender {
    
    CitiesTableTableViewController *citiesViewController =
    [[CitiesTableTableViewController alloc] init];
    
    // Push it onto the top of the navigation controller's stack
    [[self navigationController] pushViewController:citiesViewController
                                           animated:YES];
    
    
}
@end
