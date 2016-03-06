//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseZhihuRequest.h"


@interface GetNewsRequest : BaseZhihuRequest

@property int newsId;

- (instancetype)initWithNewsId:(int)newsId;

+ (instancetype)requestWithNewsId:(int)newsId;

- (NSString *)description;

@end