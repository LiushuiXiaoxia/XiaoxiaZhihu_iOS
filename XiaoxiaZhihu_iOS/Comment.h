//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Comment : NSObject

@property int      commentId;
@property NSString *author;
@property NSString *content;
@property int      likes;
@property int      time;
@property NSString *avatar;

- (NSString *)description;
@end