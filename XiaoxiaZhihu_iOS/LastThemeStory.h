//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LastThemeStory : NSObject

@property int storyId;
@property int type;
@property NSString *title;
@property NSString *gaPrefix;
@property NSArray *images;

- (NSString *)description;

@end