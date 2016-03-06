//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseZhihuRequest.h"


@interface GetLongCommentsRequest : BaseZhihuRequest

@property int commentId;

- (instancetype)initWithCommentId:(int)commentId;

+ (instancetype)requestWithCommentId:(int)commentId;

- (NSString *)description;
@end