//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BaseZhihuResponse : NSObject

@property int status;

@property NSString *errorMsg;

- (NSString *)description;

@end