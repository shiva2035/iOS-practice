//
//  DetailViewController.m
//  ToDoApp
//
//  Created by Shiva Kumar K on 7/24/16.
//  Copyright © 2016 Accolite. All rights reserved.
//

#import "DetailViewController.h"
#import "DatePickerViewController.h"
#import "Task.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *labelField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionField;
@property (weak, nonatomic) IBOutlet UILabel *createdDateLabel;

- (IBAction)changeCreatedDate:(id)sender;
- (IBAction)changeDueDate:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *dueDateLabel;


@end

@implementation DetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    Task *task = self.task;
    
    self.labelField.text = task.name;
    self.descriptionField.text = task.desc;
    static NSDateFormatter *dateFormatter = nil;
    
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    
    self.createdDateLabel.text = [dateFormatter stringFromDate:task.dateCreated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
    
    Task *task = self.task;
    task.name = self.labelField.text;
    task.desc = self.descriptionField.text;
}

- (void)setItem:(Task *)task
{
    _task = task;
    self.navigationItem.title = _task.name;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (IBAction)changeCreatedDate:(id)sender
{
    DatePickerViewController *dvc = [[DatePickerViewController alloc] init];
    dvc.task = self.task;
    
    [self.navigationController pushViewController:dvc animated:YES];
}

- (IBAction)changeDueDate:(id)sender
{
    DatePickerViewController *dvc = [[DatePickerViewController alloc] init];
    dvc.task = self.task;
    
    [self.navigationController pushViewController:dvc animated:YES];
}
@end
