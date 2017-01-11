//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import "GetStartInfoRequest.h"
#import "GetAllThemesRequest.h"
#import "GetLastThemeRequest.h"
#import "GetNewsRequest.h"
#import "GetThemeRequest.h"
#import "GetStoryExtraRequest.h"
#import "GetShortCommentsRequest.h"
#import "GetLongCommentsRequest.h"


@implementation GetStartInfoRequest {

}
- (instancetype)initWithWidth:(int)width height:(int)height {
    self = [super init];
    if (self) {
        self.width  = width;
        self.height = height;
    }

    return self;
}

+ (instancetype)requestWithWidth:(int)width height:(int)height {
    return [[self alloc] initWithWidth:width height:height];
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString string];
    [description appendFormat:@"self.width=%i", self.width];
    [description appendFormat:@", self.height=%i", self.height];

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