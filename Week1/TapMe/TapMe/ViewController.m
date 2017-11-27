//
//  ViewController.m
//  TapMe
//
//  Created by Shiva Kumar K on 6/28/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    nameLabel.hidden=YES;
    emailLabel.hidden = YES;
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed {
    nameLabel.hidden=NO;
    emailLabel.hidden = NO;
    nameLabel.text = [NSString stringWithFormat:@"Your email id is %@", nameTextField.text];
    emailLabel.text = [NSString stringWithFormat:@"Hello, %@\n", emailTextField.text];
    
}

@end
