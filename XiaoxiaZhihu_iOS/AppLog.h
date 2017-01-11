//
// Created by xiaqiulei on 2017/1/10.
// Copyright (c) 2017 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppLog : NSObject

+ (void)logi:(NSString *)format, ...;

+ (void)logw:(NSString *)format, ...;

+ (void)loge:(NSString *)format, ...;
@end

#define AppLogI(fmt, ...) [AppLog logi:fmt, ## __VA_ARGS__]
#define AppLogW(fmt, ...) [AppLog logw:fmt, ## __VA_ARGS__]
#define AppLogE(fmt, ...) [AppLog loge:fmt, ## __VA_ARGS__]