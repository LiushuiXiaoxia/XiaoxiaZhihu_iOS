//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ThemeItem : NSObject

@property(nonatomic, assign) int    themeId;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *thumbnail;
@property(nonatomic, copy) NSString *themeDescription;
@property(nonatomic, copy) NSString *color;


- (NSString *)description;
@end