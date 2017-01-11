//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import "LastThemeStory.h"


@implementation LastThemeStory {

}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
            @"storyId": @"id",
            @"gaPrefix": @"ga_prefix",
    };
}


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
            @"images": [NSString class],
    };
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.storyId=%i", self.storyId];
    [description appendFormat:@", self.type=%i", self.type];
    [description appendFormat:@", self.title=%@", self.title];
    [description appendFormat:@", self.gaPrefix=%@", self.gaPrefix];
    [description appendFormat:@", self.images=%@", self.images];
    [description appendString:@">"];
    return description;
}

@end