//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseZhihuResponse.h"


@interface GetStoryExtraResponse : BaseZhihuResponse

@property int longComments;
@property int popularity;
@property int shortComments;
@property int normalComments;
@property int postReasons;
@property int comments;

- (NSString *)description;

@end