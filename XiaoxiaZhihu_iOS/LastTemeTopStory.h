//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LastTemeTopStory : NSObject

@property(nonatomic, assign) int    storyId;
@property(nonatomic, assign) int    type;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *gaPrefix;
@property(nonatomic, copy) NSString *image;

- (NSString *)description;

@end