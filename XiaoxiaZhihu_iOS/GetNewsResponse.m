//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import "GetNewsResponse.h"


@implementation GetNewsResponse {

}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
            @"newsId" : @"id",
            @"imageSource" : @"image_source",
            @"shareUrl" : @"share_url",
            @"gaPrefix" : @"ga_prefix",
    };
}


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
            @"css" : [NSString class],
            @"js" : [NSString class]
    };
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString string];
    [description appendFormat:@"self.newsId=%i", self.newsId];
    [description appendFormat:@", self.type=%i", self.type];
    [description appendFormat:@", self.title=%@", self.title];
    [description appendFormat:@", self.image=%@", self.image];
    [description appendFormat:@", self.imageSource=%@", self.imageSource];
    [description appendFormat:@", self.body=%@", self.body];
    [description appendFormat:@", self.shareUrl=%@", self.shareUrl];
    [description appendFormat:@", self.css=%@", self.css];
    [description appendFormat:@", self.js=%@", self.js];
    [description appendFormat:@", self.gaPrefix=%@", self.gaPrefix];

    NSMutableString *superDescription = [[super description] mutableCopy];
    NSUInteger length = [superDescription length];

    if (length > 0 && [superDescription characterAtIndex:length - 1] == '>') {
        [superDescription insertString:@", " atIndex:length - 1];
        [superDescription insertString:description atIndex:length + 1];
        return superDescription;
    }
    else {
        return [NSString stringWithFormat:@"<%@: %@>", NSStringFromClass([self class]), description];
    }
}

@end