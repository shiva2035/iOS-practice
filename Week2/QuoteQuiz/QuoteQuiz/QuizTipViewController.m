//
//  QuizTipViewController.m
//  QuoteQuiz
//
//  Created by Shiva Kumar K on 7/2/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import "QuizTipViewController.h"


@interface QuizTipViewController ()

@end

@implementation QuizTipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tipView.text = self.tipText;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)doneAction:(id)sender
{
    [self.delegate quizTipDidFinish:self];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"TipModal"]) {
        QuizTipViewController * detailViewController = (QuizTipViewController *) segue.destinationViewController;
        detailViewController.delegate = self;
    }
}

@end
