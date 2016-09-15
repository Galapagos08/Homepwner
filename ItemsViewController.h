//
//  ItemsViewController.h
//  Homepwner
//
//  Created by Dan Esrey on 2016/13/09.
//  Copyright © 2016 Dan Esrey. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ItemStore;
@class ImageStore;

@interface ItemsViewController : UITableViewController

@property (nonatomic) ItemStore *itemStore;
@property (nonatomic) ImageStore *imageStore;

@end
