//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import "BaseZhihuRequest.h"


@implementation BaseZhihuRequest {

}
- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.completionHandler=%p", self.completionHandler];
    [description appendFormat:@", self.responseModelClass=%@", self.responseModelClass];
    [description appendString:@">"];
    return description;
}

@end