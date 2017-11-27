//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Shiva Kumar K on 7/14/16.
//  Copyright © 2016 Accolite. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItem.h"
#import "BNRItemStore.h"

@implementation BNRItemsViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
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
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    UITableViewCell *footer = [[UITableViewCell alloc] init];
    footer.textLabel.text = @"No more items!";
    
    self.tableView.tableFooterView = footer;
    
    self.tableView.rowHeight = 60;
    
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [[[BNRItemStore sharedStore] allItemsAbove50] count];
    }
    else {
        return [[[BNRItemStore sharedStore] allItemsBelow50] count];
    }
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section ==0){
        return @"Items Worth More than $50";
    }else{
        return @"Items Worth Lessthan $50";
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
    //                                               reuseIdentifier:@"UITableViewcell"];
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    //NSArray *items = [[BNRItemStore sharedStore] allItems];
    //BNRItem *item = items[indexPath.row];
    //cell.textLabel.text = [item description];
    NSLog(@"%ld %ld", (long)indexPath.section, (long)indexPath.row);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSArray *items;
    BNRItem *item;
    
    if (indexPath.section == 0) {
        items = [[BNRItemStore sharedStore] allItemsAbove50];
    }
    else {
        items = [[BNRItemStore sharedStore] allItemsBelow50];
    }
    
    item = items[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:20.0];
    cell.textLabel.text = [item description];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

@end
