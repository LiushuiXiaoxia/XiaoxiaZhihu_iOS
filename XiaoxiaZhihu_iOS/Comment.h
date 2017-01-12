//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Comment : NSObject

@property(nonatomic) int            commentId;
@property(nonatomic, copy) NSString *author;
@property(nonatomic, copy) NSString *content;
@property(nonatomic) int            likes;
@property(nonatomic) int            time;
@property(nonatomic, copy) NSString *avatar;

- (NSString *)description;
@end