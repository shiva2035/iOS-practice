//
//  RootViewController.m
//  LoginApp
//
//  Created by Shiva Kumar K on 8/31/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import "RootViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "ProfileViewController.h"

@interface RootViewController()

-(IBAction)fbLogin:(id)sender;
-(IBAction)googleLogin:(id)sender;
-(IBAction)customLogin:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *fbLoginButton;
@property (weak, nonatomic) IBOutlet UIButton *googleLoginButton;
@property (weak, nonatomic) IBOutlet UIButton *customLoginButton;
@property (weak, nonatomic) IBOutlet FBSDKLoginButton *facebookLoginButton;


@end

@implementation RootViewController

static NSString * const kClientID = @"238273969446-6uo1vgv72v9cq3e0jjmd6814se3vn1m5.apps.googleusercontent.com";
- (void) viewDidLoad
{
    
    [super viewDidLoad];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"background.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
}

-(void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL) application:(UIApplication *) application
             openURL:(NSURL *)url
   sourceApplication:(NSString *)sourceApplication
          annotation:(id)annotation
{

    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}

-(IBAction)fbLogin:(id)sender
{
    FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
    [loginManager logInWithReadPermissions:@[@"email"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error){
        if(error){
            NSLog(@"Error: %@", error);
        }else if(result.isCancelled){
            NSLog(@"Cancelled");
        }else{
            if([result.grantedPermissions containsObject:@"email"]){
                NSLog(@"%@", result);
                NSLog(@"Login Success");
                //[self fetchUserDetails];
            }
        }
        
    }];
}

-(IBAction)googleLogin:(id)sender
{
    GIDSignIn *loginManager = [GIDSignIn sharedInstance];
    loginManager.clientID = kClientID;
    loginManager.scopes = @[ @"profile", @"email"];
    loginManager.delegate = self;
    loginManager.uiDelegate = self;
    loginManager.shouldFetchBasicProfile = YES;
    [loginManager signIn];
}

-(IBAction)customLogin:(id)sender
{
    NSLog(@"Custom Login");
    if([self.emailTextField.text isEqualToString:@"shiva.kumar@gmail.com"]){
        
        NSDictionary *profileInfo = @{@"firstName": self.emailTextField.text,
                                      @"lastName": self.emailTextField.text,
                                      @"email": self.emailTextField.text,
                                      @"address": @"",
                                      @"gender": @"",
                                      @"service":@"google"};
        ProfileViewController *pvc = [[ProfileViewController alloc] init];
        pvc.profileInformation = profileInfo;
        
        [self.navigationController pushViewController:pvc animated:YES];
        NSLog(@"Login Success!!!");
    }else{
        NSLog(@"Login Failed!!!");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Logged in" message:@"Login Failed, Please provide the correct credentials or try again later." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    
}

/*-(void) logOut{

    [[GIDSignIn sharedInstance] signOut];
    
}
*/


- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error {
    if(error){
        NSLog(@"Error in signing in : %@",error);
        return;
    }
    
    NSString *userId = user.userID;
    NSString *idToken = user.authentication.idToken;
    NSString *fullName = user.profile.name;
    NSString *givenName = user.profile.givenName;
    NSString *familyName = user.profile.familyName;
    NSString *email = user.profile.email;
    
    NSDictionary *profileInfo = @{@"firstName": fullName,
                                  @"lastName": givenName,
                                  @"email": email,
                                  @"address": @"",
                                  @"gender": @"",
                                  @"service":@"google"};
    
    ProfileViewController *pvc = [[ProfileViewController alloc] init];
    pvc.profileInformation = profileInfo;
    
    [self.navigationController pushViewController:pvc animated:YES];
    
}

- (void)signIn:(GIDSignIn *)signIn didDisconnectWithUser:(GIDGoogleUser *)user withError:(NSError *)error {
    // Perform any operations when the user disconnects from app here.
}

- (void)signInWillDispatch:(GIDSignIn *)signIn error:(NSError *)error {
    NSLog(@"%@",error.description);
}

// Present a view that prompts the user to sign in with Google
- (void)signIn:(GIDSignIn *)signIn presentViewController:(UIViewController *)viewController {
    //present view controller
}

// Dismiss the "Sign in with Google" view
- (void)signIn:(GIDSignIn *)signIn dismissViewController:(UIViewController *)viewController {
    //dismiss view controller
}





@end
