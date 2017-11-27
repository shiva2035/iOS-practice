//
//  ViewController.m
//  QuoteQuiz
//
//  Created by Shiva Kumar K on 7/2/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (assign, nonatomic) NSInteger answer;

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.quizIndex = 999;
    self.quiz = [[Quiz alloc] initWithQuiz:@"quotes"];
    
    self.questionLabel.backgroundColor = [UIColor colorWithRed:51/255.0 green:133/255.0 blue:238/255.0 alpha:1.0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)nextQuizItem
{
    if (self.quizIndex == 999) {
        self.quizIndex = 0;
        self.statusLabel.text = @"";
    } else if ((self.quiz.quizCount-1) > self.quizIndex) {
        self.quizIndex++;
    } else {
        self.quizIndex = 0;
        self.statusLabel.text = @"";
    }
    
    if (self.quiz.quizCount >= self.quizIndex + 1) {
        [self.quiz nextQuestion:self.quizIndex];
        self.questionLabel.text = self.quiz.quote;
        self.answer1Label.text = self.quiz.ans1;
        self.answer2Label.text = self.quiz.ans2;
        self.answer3Label.text = self.quiz.ans3;
    } else {
        self.quizIndex = 0;
        [self quizDone];
    }
    
    // reset fields for next question
    self.answer1Label.backgroundColor = [UIColor colorWithRed:51/255.0 green:133/255.0 blue:238/255.0 alpha:1.0];
    self.answer2Label.backgroundColor = [UIColor colorWithRed:51/255.0 green:133/255.0 blue:238/255.0 alpha:1.0];
    self.answer3Label.backgroundColor = [UIColor colorWithRed:51/255.0 green:133/255.0 blue:238/255.0 alpha:1.0];
    
    self.answer1Button.hidden = NO;
    self.answer2Button.hidden = NO;
    self.answer3Button.hidden = NO;
    
    if (self.quiz.tipCount < 3) {
        self.infoButton.hidden = NO;
    } else {
        self.infoButton.hidden = YES;
    }
}

- (void)checkAnswer
{
    if ([self.quiz checkQuestion:self.quizIndex forAnswer:_answer]) {
        if (self.answer == 1) {
            self.answer1Label.backgroundColor = [UIColor greenColor];
        } else if (self.answer == 2) {
            self.answer2Label.backgroundColor = [UIColor greenColor];
        } else if (self.answer == 3) {
            self.answer3Label.backgroundColor = [UIColor greenColor];
        }
    } else {
        if (self.answer == 1) {
            self.answer1Label.backgroundColor = [UIColor redColor];
        } else if (self.answer == 2) {
            self.answer2Label.backgroundColor = [UIColor redColor];
        } else if (self.answer == 3) {
            self.answer3Label.backgroundColor = [UIColor redColor];
        }
    }
    
    self.statusLabel.text = [NSString stringWithFormat:@"Correct: %ld Incorrect: %ld",(long)self.quiz.correctCount, (long)self.quiz.incorrectCount];
    
    self.answer1Button.hidden = YES;
    self.answer2Button.hidden = YES;
    self.answer3Button.hidden = YES;
    
    self.startButton.hidden = NO;
    
    [self.startButton setTitle:@"Next" forState:UIControlStateNormal];
}

- (void)quizDone
{
    if (self.quiz.correctCount) {
        self.statusLabel.text = [NSString stringWithFormat:@"Quiz Done - Score %ld%%", self.quiz.quizCount / self.quiz.correctCount];
    } else {
        self.statusLabel.text = @"Quiz Done - Score: 0%";
    }
    [self.startButton setTitle:@"Try Again" forState:UIControlStateNormal];
    self.quizIndex = 999;
}



- (IBAction)ans1Action:(UIButton *)sender {
    self.answer = 1;
    [self checkAnswer];
}

- (IBAction)ans2Action:(UIButton *)sender {
    self.answer = 2;
    [self checkAnswer];
}

- (IBAction)ans3Action:(UIButton *)sender {
    self.answer = 3;
    [self checkAnswer];
}

- (IBAction)startAgain:(UIButton *)sender {
    [self nextQuizItem];

}

- (void)quizTipDidFinish:(QuizTipViewController *) controller {
    [self dismissViewControllerAnimated:YES completion:^{}];
}

@end
