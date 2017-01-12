//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseZhihuResponse.h"


@interface GetStartInfoResponse : BaseZhihuResponse

@property(nonatomic, copy) NSString *text;

@property(nonatomic, copy) NSString *img;

- (NSString *)description;

@end