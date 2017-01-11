//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import "GetThemeRequest.h"


@implementation GetThemeRequest {

}
- (instancetype)initWithThemeId:(int)themeId {
    self = [super init];
    if (self) {
        self.themeId = themeId;
    }

    return self;
}

+ (instancetype)requestWithThemeId:(int)themeId {
    return [[self alloc] initWithThemeId:themeId];
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString string];
    [description appendFormat:@"self.themeId=%i", self.themeId];

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