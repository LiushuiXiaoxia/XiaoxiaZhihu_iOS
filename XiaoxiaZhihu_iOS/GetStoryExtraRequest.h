//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseZhihuRequest.h"


@interface GetStoryExtraRequest : BaseZhihuRequest

@property(nonatomic, assign) int extraId;

- (instancetype)initWithExtraId:(int)extraId;

- (NSString *)description;

+ (instancetype)requestWithExtraId:(int)extraId;

@end