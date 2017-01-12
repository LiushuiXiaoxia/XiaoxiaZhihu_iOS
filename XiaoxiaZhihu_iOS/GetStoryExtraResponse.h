//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseZhihuResponse.h"


@interface GetStoryExtraResponse : BaseZhihuResponse

@property(nonatomic, assign) int longComments;
@property(nonatomic, assign) int popularity;
@property(nonatomic, assign) int shortComments;
@property(nonatomic, assign) int normalComments;
@property(nonatomic, assign) int postReasons;
@property(nonatomic, assign) int comments;

- (NSString *)description;

@end