//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import "BaseZhihuResponse.h"


@implementation BaseZhihuResponse {

}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
            @"status": @"status",
            @"error_msg": @"errorMsg"
    };
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.status=%i", self.status];
    [description appendFormat:@", self.errorMsg=%@", self.errorMsg];
    [description appendString:@">"];
    return description;
}

@end