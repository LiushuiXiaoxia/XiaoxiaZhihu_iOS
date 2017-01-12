//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BaseZhihuRequest : NSObject

@property(nonatomic, copy, nonnull) void (^ completionHandler)(
        BaseZhihuRequest *_Nonnull task,
        id _Nullable responseObj,
        NSError *_Nullable error);

@property(nonatomic, retain, nonnull) Class responseModelClass;

- (NSString *_Nullable)description;

@end