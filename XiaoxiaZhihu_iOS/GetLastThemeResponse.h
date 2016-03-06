//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseZhihuResponse.h"
#import "LastThemeStory.h"
#import "LastTemeTopStory.h"


@interface GetLastThemeResponse : BaseZhihuResponse

@property NSString *date;

@property NSArray<LastThemeStory *> *stories; // LastThemeStory[]

@property NSArray<LastTemeTopStory *> *topStories; // LastTemeTopStory[]

- (NSString *)description;
@end