//
//  BNRQuizViewCotroller.h
//  Quiz
//
//  Created by Shiva Kumar K on 7/2/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNRQuizViewCotroller : UIViewController
@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@end
