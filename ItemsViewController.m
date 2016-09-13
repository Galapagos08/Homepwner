//
//  ItemsViewController.m
//  Homepwner
//
//  Created by Dan Esrey on 2016/13/09.
//  Copyright © 2016 Dan Esrey. All rights reserved.
//

#import "ItemsViewController.h"
#import "ItemStore.h"
#import "Item.h"

@interface ItemsViewController ()

@end

@implementation ItemsViewController

// MARK: - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
  
    // Get the height of the status bar
    CGFloat statusBarHeight =
    [UIApplication sharedApplication].statusBarFrame.size.height;
   
    UIEdgeInsets insets = UIEdgeInsetsMake(statusBarHeight, 0, 0, 0);
    self.tableView.contentInset = insets;
    self.tableView.scrollIndicatorInsets = insets;
}


// MARK: - Table View Data Source and Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemStore.allItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    // Get a new or recycled cell
    UITableViewCell *cell =
    [self.tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                         forIndexPath:indexPath];

    // Set the text on the cell with the description of the item
    // that is at the nth index of items, where n = row this cell
    // will appear in on the tableview
    Item *item = self.itemStore.allItems[indexPath.row];
    
    // Configure the cell with the item's properties
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%d", item.valueInDollars];
    return cell;
}


@end
