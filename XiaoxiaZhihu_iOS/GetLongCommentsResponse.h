//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseZhihuResponse.h"
#import "Comment.h"


@interface GetLongCommentsResponse : BaseZhihuResponse

@property(nonatomic, retain) NSArray<Comment *> *comments;

- (NSString *)description;

@end