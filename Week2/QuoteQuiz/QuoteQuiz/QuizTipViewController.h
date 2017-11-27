//
//  QuizTipViewController.h
//  QuoteQuiz
//
//  Created by Shiva Kumar K on 7/2/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QuizTipViewControllerDelegate;

@interface QuizTipViewController : UIViewController
@property (nonatomic, assign) id <QuizTipViewControllerDelegate> delegate;
//@property (weak, nonatomic) IBOutlet UITextView * tipView;
@property (nonatomic, copy) NSString * tipText;
- (IBAction)doneAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *tipView;


@end

@protocol QuizTipViewControllerDelegate
- (void)quizTipDidFinish:(QuizTipViewController *)controller;
@end