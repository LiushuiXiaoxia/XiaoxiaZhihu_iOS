//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseZhihuRequest.h"


@interface GetShortCommentsRequest : BaseZhihuRequest

@property(nonatomic, assign) int commentId;

- (instancetype)initWithCommentId:(int)commentId;

- (NSString *)description;

+ (instancetype)requestWithCommentId:(int)commentId;

@end