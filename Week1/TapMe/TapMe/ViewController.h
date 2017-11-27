//
//  ViewController.h
//  TapMe
//
//  Created by Shiva Kumar K on 6/28/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    IBOutlet UITextField *nameTextField;
    IBOutlet UITextField *emailTextField;
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *emailLabel;
    
}
- (IBAction)buttonPressed;

@end
