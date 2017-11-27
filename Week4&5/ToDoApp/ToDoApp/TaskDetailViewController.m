//
//  DetailViewController.m
//  ToDoApp
//
//  Created by Shiva Kumar K on 7/24/16.
//  Copyright © 2016 Accolite. All rights reserved.
//

#import "TaskDetailViewController.h"
#import "DatePickerViewController.h"
#import "Task.h"
#import "TaskStore.h"
#import "TaskListViewController.h"
#import <CoreData/CoreData.h>


@interface TaskDetailViewController ()


@property (weak, nonatomic) IBOutlet UITextField *labelField;
@property(weak, nonatomic) IBOutlet UISwitch *mySwitch;
@property (weak, nonatomic) IBOutlet UITextField *descriptionField;

@property (weak, nonatomic) IBOutlet UITextField *duedateField;
@property (weak, nonatomic) IBOutlet UILabel *dueDateLabel;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)stateChanged:(UISwitch *)switchState;
- (IBAction)changeDueDate:(id)sender;
- (IBAction)saveIn:(id)sender;
- (IBAction)cancelIn:(id)sender;
-(IBAction)pickDate:(id)sender;

@end

@implementation TaskDetailViewController


- (NSManagedObjectContext *)managedObjectContext {
    
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    Task *task = self.task;
    
    self.labelField.text = task.name;
    self.descriptionField.text = task.desc;
    
    //format date and display.
    NSDateFormatter *datef = [[NSDateFormatter alloc] init];
    datef.dateStyle = NSDateFormatterMediumStyle;
    datef.timeStyle = NSDateFormatterNoStyle;
    NSString *date = [datef stringFromDate:self.task.dueDate];
    self.dueDateLabel.text = date;

}

- (void) viewDidLoad:(BOOL) animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    UINavigationItem *navItem = self.navigationItem;
    navItem.title = @"ToDo App - Details";
    
    [self.mySwitch addTarget:self
                      action:@selector(stateChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    //format date and display.
    NSDateFormatter *datef = [[NSDateFormatter alloc] init];
    NSString *date = [datef stringFromDate:self.task.dueDate];
    self.dueDateLabel.text = date;

    
}

- (void)stateChanged:(UISwitch *)switchState
{
    if ([switchState isOn]) {
        NSLog(@"On");
        self.task.completed = true;
    } else {
        NSLog(@"Off");
        self.task.completed = false;
    }
}

-(IBAction)pickDate:(id)sender
{
    NSLog(@"Picked the Date: %@", _datePicker.date);
     NSLog(@"Date: %@", self.datePicker.date);
    //[self.navigationController popViewControllerAnimated:YES];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
    
    Task *task = self.task;
    task.name = self.labelField.text;
    task.desc = self.descriptionField.text;

}

- (IBAction)saveIn:(id)sender
{
    Task *task = [[Task alloc] init];
    task.name = self.labelField.text;
    task.desc = self.descriptionField.text;
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MMM-dd-yyyy HH:mm"];
    NSDate *now = [[NSDate alloc] init];
    //NSString *dateString = [format stringFromDate:now];
    //task.dueDate = now;
    task.completed = false;
    
    NSLog(@"----- %@, %@, %@, %@", task.name, task.desc, task.dueDate, task.completed);
    NSLog(@"Save loaded");
    
    Task *newTask = [[TaskStore sharedTaskStore] createTask:task];
    NSLog(@"%@",newTask.description);
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)cancelIn:(id)sender
{
    //TaskListViewController *tvc = [[TaskListViewController alloc] init];
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"Cancel Loaded");
    
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

@end
