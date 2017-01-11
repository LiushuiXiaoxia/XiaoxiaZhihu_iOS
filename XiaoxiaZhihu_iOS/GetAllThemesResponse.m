//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import "GetAllThemesResponse.h"
#import "ThemeItem.h"


@implementation GetAllThemesResponse {

}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
            @"others": [ThemeItem class]
    };
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString string];
    [description appendFormat:@"self.limit=%i", self.limit];
    [description appendFormat:@", self.others=%@", self.others];

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