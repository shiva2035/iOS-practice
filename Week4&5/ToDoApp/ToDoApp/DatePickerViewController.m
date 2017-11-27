//
//  DateViewController.m
//  ToDoApp
//
//  Created by Shiva Kumar K on 7/24/16.
//  Copyright © 2016 Accolite. All rights reserved.
//

#import "DatePickerViewController.h"
#import "Task.h"
#import "ViewController.h"

@interface DatePickerViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

-(IBAction)pickDate:(id)sender;

@end

@implementation DatePickerViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //Task *item = self.task;
    
    //[self.datePicker setDate:item.dateCreated animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    Task *task = self.task;
    self.task.dueDate = self.datePicker.date;
    NSLog(@"Date: %@", self.datePicker.date);
    //task.dueDate = self.datePicker.date;
}

-(IBAction)pickDate:(id)sender
{
    NSLog(@"Picked the Date");

    [self.navigationController popViewControllerAnimated:YES];
}

@end
