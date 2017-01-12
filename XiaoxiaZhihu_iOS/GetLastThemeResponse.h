//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseZhihuResponse.h"
#import "LastThemeStory.h"
#import "LastTemeTopStory.h"


@interface GetLastThemeResponse : BaseZhihuResponse

@property(nonatomic, copy) NSString *date;

@property(nonatomic, retain) NSArray<LastThemeStory *> *stories; // LastThemeStory[]

@property(nonatomic, retain) NSArray<LastTemeTopStory *> *topStories; // LastTemeTopStory[]

- (NSString *)description;

@end