//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseZhihuResponse.h"


@interface GetAllThemesResponse : BaseZhihuResponse

@property(nonatomic, assign) int limit;

@property(nonatomic, retain) NSArray *others;

- (NSString *)description; // ThemeItem[] *others

@end