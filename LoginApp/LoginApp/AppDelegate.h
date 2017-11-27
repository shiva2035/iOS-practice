//
//  AppDelegate.h
//  LoginApp
//
//  Created by Shiva Kumar K on 8/30/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleSignIn/GoogleSignIn.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, GIDSignInDelegate, GIDSignInUIDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

