//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseZhihuResponse.h"


@interface GetStartInfoResponse : BaseZhihuResponse

@property NSString *text;

@property NSString *img;

- (NSString *)description;

@end