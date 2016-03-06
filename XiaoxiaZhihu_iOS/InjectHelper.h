//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IZhihuApi;


@interface InjectHelper : NSObject

+ (id <IZhihuApi>)getZhihuApi;

@end