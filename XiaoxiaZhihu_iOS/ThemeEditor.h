//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ThemeEditor : NSObject

@property NSString *url;
@property NSString *bio;
@property int themeEditorId;
@property NSString *avatar;
@property NSString *name;

- (NSString *)description;
@end