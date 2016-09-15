//
//  DetailViewController.h
//  Homepwner
//
//  Created by Dan Esrey on 2016/14/09.
//  Copyright © 2016 Dan Esrey. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Item;
@class ImageStore;

@interface DetailViewController : UIViewController

@property (nonatomic) Item *item;
@property (nonatomic) ImageStore *imageStore;

@end
