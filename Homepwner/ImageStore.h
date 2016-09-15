//
//  ImageStore.h
//  Homepwner
//
//  Created by Dan Esrey on 2016/15/09.
//  Copyright © 2016 Dan Esrey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageStore : NSObject

- (void)setImage:(UIImage *)image forKey:(NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;
- (void)deleteImageForKey:(NSString *)key;

@end
