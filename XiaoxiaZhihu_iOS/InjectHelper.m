//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import "InjectHelper.h"
#import "IZhihuApi.h"
#import "ZhihuApiImpl.h"


@implementation InjectHelper {

}

+ (id <IZhihuApi>)getZhihuApi {
    return [[ZhihuApiImpl alloc] init];
}

@end