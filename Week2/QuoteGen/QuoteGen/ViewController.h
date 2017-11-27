//
//  ViewController.h
//  QuoteGen
//
//  Created by Shiva Kumar K on 7/2/16.
//  Copyright © 2016 Shiva Kumar K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISegmentedControl *quoteOpt;

@property (nonatomic, strong) NSArray *myQuotes;
@property (nonatomic, strong) NSMutableArray *movieQuotes;

@end

