//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ThemeItem : NSObject

@property int themeId;
@property NSString *name;
@property NSString *thumbnail;
@property NSString *themeDescription;
@property NSString *color;


- (NSString *)description;
@end