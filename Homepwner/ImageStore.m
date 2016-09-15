//
//  ImageStore.m
//  Homepwner
//
//  Created by Dan Esrey on 2016/15/09.
//  Copyright © 2016 Dan Esrey. All rights reserved.
//

#import "ImageStore.h"
#import <UIKit/UIKit.h>

@interface ImageStore ()
@property (nonatomic) NSCache *cache;
@end

@implementation ImageStore

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cache = [NSCache new];
    }
    return self;
}
// MARK: - Image Management
- (void)setImage:(UIImage *)image forKey:(NSString *)key {
    [self.cache setObject:image forKey:key];
}
- (UIImage *)imageForKey:(NSString *)key {
    return [self.cache objectForKey:key];
}
- (void)deleteImageForKey:(NSString *)key {
    [self.cache removeObjectForKey:key];
}


@end
