//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import "GetLastThemeResponse.h"

@implementation GetLastThemeResponse {

}
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
            @"topStories" : @"top_stories",
    };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
            @"stories" : [LastThemeStory class],
            @"topStories" : [LastTemeTopStory class]
    };
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString string];
    [description appendFormat:@"self.date=%@", self.date];
    [description appendFormat:@", self.stories=%@", self.stories];
    [description appendFormat:@", self.topStories=%@", self.topStories];

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