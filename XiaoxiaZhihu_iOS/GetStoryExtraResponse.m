//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import "GetStoryExtraResponse.h"


@implementation GetStoryExtraResponse {

}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
            @"longComments": @"long_comments",
            @"shortComments": @"short_comments",
            @"normalComments": @"normal_comments",
            @"postReasons": @"post_reasons",
    };
}


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
    };
}


- (NSString *)description {
    NSMutableString *description = [NSMutableString string];
    [description appendFormat:@"self.longComments=%i", self.longComments];
    [description appendFormat:@", self.popularity=%i", self.popularity];
    [description appendFormat:@", self.shortComments=%i", self.shortComments];
    [description appendFormat:@", self.normalComments=%i", self.normalComments];
    [description appendFormat:@", self.postReasons=%i", self.postReasons];
    [description appendFormat:@", self.comments=%i", self.comments];

    NSMutableString *superDescription = [[super description] mutableCopy];
    NSUInteger      length            = [superDescription length];

    if (length > 0 && [superDescription characterAtIndex:length - 1] == '>') {
        [superDescription insertString:@", " atIndex:length - 1];
        [superDescription insertString:description atIndex:length + 1];
        return superDescription;
    } else {
        return [NSString stringWithFormat:@"<%@: %@>", NSStringFromClass([self class]), description];
    }
}

@end