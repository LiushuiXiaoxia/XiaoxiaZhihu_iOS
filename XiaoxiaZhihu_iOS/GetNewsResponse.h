//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseZhihuResponse.h"


@interface GetNewsResponse : BaseZhihuResponse

@property int newsId;
@property int type;
@property NSString *title;
@property NSString *image;
@property NSString *imageSource;
@property NSString *body;
@property NSString *shareUrl;
@property NSArray *css;
@property NSArray *js;
@property NSString *gaPrefix;

- (NSString *)description;

@end