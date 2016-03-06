//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BaseZhihuRequest : NSObject

@property(copy) void (^_Nullable completionHandler)(BaseZhihuRequest *_Nonnull task, _Nullable id responseObj, NSError *_Nullable error);

@property(nonatomic, assign) Class _Nonnull responseModelClass;

- (NSString *_Nullable)description;

@end