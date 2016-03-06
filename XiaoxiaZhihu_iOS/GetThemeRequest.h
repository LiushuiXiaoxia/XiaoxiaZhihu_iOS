//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseZhihuRequest.h"


@interface GetThemeRequest : BaseZhihuRequest

@property int themeId;

- (instancetype)initWithThemeId:(int)themeId;

+ (instancetype)requestWithThemeId:(int)themeId;


- (NSString *)description;
@end