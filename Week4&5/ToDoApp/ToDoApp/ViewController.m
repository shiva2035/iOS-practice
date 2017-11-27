//
//  ViewController.m
//  ToDoApp
//
//  Created by Shiva Kumar K on 7/24/16.
//  Copyright © 2016 Accolite. All rights reserved.
//

#import "ViewController.h"
#import "Task.h"
#import "TaskStore.h"
#import "TaskDetailViewController.h"
#import "TaskItemTableViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet UIView *headerView;

@end


@implementation ViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"ToDo App";
        
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                             target:self
                                                                             action:@selector(addNewTask:)];
        
        navItem.rightBarButtonItem = bbi;
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    UINib *nib = [UINib nibWithNibName:@"TaskItemTableViewCell" bundle:nil];//load nib
    [self.tableView registerNib:nib forCellReuseIdentifier:@"myCell"];
    
    
    UIView *header = self.headerView;
    [self.tableView setTableHeaderView:header];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[TaskStore sharedTaskStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    TaskItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if(!cell){
        [tableView registerNib:[UINib nibWithNibName:@"TaskItemTableViewCell" bundle:nil] forCellReuseIdentifier:@"myCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    }
    
    
    NSArray *items = [[TaskStore sharedTaskStore] allItems];
    Task *item = items[indexPath.row];
    
    cell.nameLabel.text = [item name];
    cell.descLabel.text = [item desc];
    cell.duedateLabel.text = @"AUG-30-2016";
    
    return cell;
}

- (IBAction)addNewTask:(id)sender
{
    TaskDetailViewController *myNewVC = [[TaskDetailViewController alloc] init];
    [self.navigationController pushViewController:myNewVC animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSArray *items = [[TaskStore sharedTaskStore] allItems];
        Task *task = items[indexPath.row];
        [[TaskStore sharedTaskStore] removeTask:task];
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

/*- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[TaskStore sharedTaskStore] moveTaskAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TaskDetailViewController *detailViewController = [[TaskDetailViewController alloc] init];
    NSArray *tasks = [[TaskStore sharedTaskStore] allItems];
    Task *task = tasks[indexPath.row];
    
    detailViewController.task = task;
    
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}


@end
