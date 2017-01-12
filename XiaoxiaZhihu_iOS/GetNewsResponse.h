//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseZhihuResponse.h"


@interface GetNewsResponse : BaseZhihuResponse

@property(nonatomic, assign) int    newsId;
@property(nonatomic, assign) int    type;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *image;
@property(nonatomic, copy) NSString *imageSource;
@property(nonatomic, copy) NSString *body;
@property(nonatomic, copy) NSString *shareUrl;
@property(nonatomic, copy) NSArray  *css;
@property(nonatomic, copy) NSArray  *js;
@property(nonatomic, copy) NSString *gaPrefix;

- (NSString *)description;

@end