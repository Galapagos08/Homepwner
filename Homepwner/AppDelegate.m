//
//  AppDelegate.m
//  Homepwner
//
//  Created by Dan Esrey on 2016/13/09.
//  Copyright © 2016 Dan Esrey. All rights reserved.
//

#import "AppDelegate.h"
#import "ItemStore.h"
#import "ItemsViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Create an ItemStore
    ItemStore *itemStore = [ItemStore new];
    // Access the ItemsViewController
    UINavigationController *navController = (UINavigationController *)self.window.rootViewController;
    ItemsViewController *ivc = (ItemsViewController *)navController.topViewController;
    ivc.itemStore = itemStore;
    return YES;
}


@end
