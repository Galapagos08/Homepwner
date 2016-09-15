//
//  Item.h
//  Homepwner
//
//  Created by Dan Esrey on 2016/13/09.
//  Copyright © 2016 Dan Esrey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (copy, nonatomic) NSString *itemKey;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic) NSDate *dateCreated;

-(instancetype)initWithName:(NSString *)name
               serialNumber:(NSString *)serialNumber
             valueInDollars:(int)valueInDollars NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithRandomValues;

@end
