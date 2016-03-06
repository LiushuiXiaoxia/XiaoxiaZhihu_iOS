//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseZhihuRequest.h"


@interface GetStartInfoRequest : BaseZhihuRequest

@property int width;

@property int height;

- (instancetype)initWithWidth:(int)width height:(int)height;

- (NSString *)description;

+ (instancetype)requestWithWidth:(int)width height:(int)height;


@end