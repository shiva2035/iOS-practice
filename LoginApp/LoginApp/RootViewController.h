//
//  RootViewController.h
//  LoginApp
//
//  Created by Shiva Kumar K on 8/31/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleSignIn/GoogleSignIn.h>

@interface RootViewController : UIViewController<GIDSignInDelegate, GIDSignInUIDelegate>


@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end
