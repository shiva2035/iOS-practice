//
//  ViewController.h
//  QuoteQuiz
//
//  Created by Shiva Kumar K on 7/2/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuizTipViewController.h"
#import "Quiz.h"
@class Quiz;

@interface ViewController : UIViewController<QuizTipViewControllerDelegate>


@property (strong, nonatomic) IBOutlet UILabel *questionLabel;
@property (strong, nonatomic) IBOutlet UILabel *answer1Label;
@property (strong, nonatomic) IBOutlet UILabel *answer2Label;
@property (strong, nonatomic) IBOutlet UILabel *answer3Label;

@property (weak, nonatomic) IBOutlet UIButton *answer1Button;
@property (weak, nonatomic) IBOutlet UIButton *answer2Button;
@property (weak, nonatomic) IBOutlet UIButton *answer3Button;


@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@property (weak, nonatomic) IBOutlet UIButton * infoButton;

@property (nonatomic, assign) NSInteger quizIndex;
@property (nonatomic, strong) Quiz *quiz;

- (IBAction) ans1Action:(UIButton *)sender;
- (IBAction) ans2Action:(UIButton *)sender;
- (IBAction) ans3Action:(UIButton *)sender;
- (IBAction) startAgain:(UIButton *)sender;


@end

