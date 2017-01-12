//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseZhihuResponse.h"

#import "LastThemeStory.h"
#import "ThemeEditor.h"


@interface GetThemeResponse : BaseZhihuResponse

@property(nonatomic, retain) NSArray<LastThemeStory *> *stories;
@property(nonatomic, copy) NSString                    *themeDescription;
@property(nonatomic, copy) NSString                    *background;
@property(nonatomic, assign) int                       color;
@property(nonatomic, copy) NSString                    *name;
@property(nonatomic, copy) NSString                    *image;
@property(nonatomic, retain) NSArray<ThemeEditor *>    *editors;
@property(nonatomic, copy) NSString                    *imageSrouce;

- (NSString *)description;

@end