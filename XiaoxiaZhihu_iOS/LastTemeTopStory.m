//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import "LastTemeTopStory.h"


@implementation LastTemeTopStory {

}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
            @"storyId" : @"id",
            @"gaPrefix" : @"ga_prefix",
    };
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.storyId=%i", self.storyId];
    [description appendFormat:@", self.type=%i", self.type];
    [description appendFormat:@", self.title=%@", self.title];
    [description appendFormat:@", self.gaPrefix=%@", self.gaPrefix];
    [description appendFormat:@", self.image=%@", self.image];
    [description appendString:@">"];
    return description;
}

@end