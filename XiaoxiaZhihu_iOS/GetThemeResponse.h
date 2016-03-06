//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseZhihuResponse.h"

#import "LastThemeStory.h"
#import "ThemeEditor.h"


@interface GetThemeResponse : BaseZhihuResponse

@property NSArray<LastThemeStory *> *stories;
@property NSString *themeDescription;
@property NSString *background;
@property int color;
@property NSString *name;
@property NSString *image;
@property NSArray<ThemeEditor *> *editors;
@property NSString *imageSrouce;

- (NSString *)description;
@end