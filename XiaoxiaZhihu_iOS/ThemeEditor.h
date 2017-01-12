//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ThemeEditor : NSObject

@property(nonatomic, copy) NSString *url;
@property(nonatomic, copy) NSString *bio;
@property(nonatomic, assign) int    themeEditorId;
@property(nonatomic, copy) NSString *avatar;
@property(nonatomic, copy) NSString *name;

- (NSString *)description;
@end