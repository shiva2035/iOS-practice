//
//  TaskItemTableViewCell.h
//  ToDoApp
//
//  Created by Shiva Kumar K on 8/24/16.
//  Copyright © 2016 Accolite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *duedateLabel;

@end
