//
//  ProfileViewController.m
//  LoginApp
//
//  Created by Shiva Kumar K on 9/12/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@property (nonatomic) NSString *authservice;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.firstNameTextField.text = [self.profileInformation objectForKey:@"firstName"];
    self.lastNameTextField.text = [self.profileInformation objectForKey:@"lastName"];
    self.emailTextField.text = [self.profileInformation objectForKey:@"email"];
    self.addressTextField.text = [self.profileInformation objectForKey:@"address"];
    self.genderTextField.text = [self.profileInformation objectForKey:@"gender"];
    self.authservice = [self.profileInformation objectForKey:@"service"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
