//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import "GetThemeResponse.h"

@implementation GetThemeResponse {

}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
            @"themeDescription": @"description",
            @"imageSrouce": @"image_srouce",
    };
}


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
            @"stories": [LastThemeStory class],
            @"editors": [ThemeEditor class],
    };
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString string];
    [description appendFormat:@"self.stories=%@", self.stories];
    [description appendFormat:@", self.themeDescription=%@", self.themeDescription];
    [description appendFormat:@", self.background=%@", self.background];
    [description appendFormat:@", self.color=%i", self.color];
    [description appendFormat:@", self.name=%@", self.name];
    [description appendFormat:@", self.image=%@", self.image];
    [description appendFormat:@", self.editors=%@", self.editors];
    [description appendFormat:@", self.imageSrouce=%@", self.imageSrouce];

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