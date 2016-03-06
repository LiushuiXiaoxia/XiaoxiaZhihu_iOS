//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import "GetStoryExtraRequest.h"


@implementation GetStoryExtraRequest {

}
- (instancetype)initWithExtraId:(int)extraId {
    self = [super init];
    if (self) {
        self.extraId = extraId;
    }

    return self;
}

+ (instancetype)requestWithExtraId:(int)extraId {
    return [[self alloc] initWithExtraId:extraId];
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString string];
    [description appendFormat:@"self.extraId=%i", self.extraId];

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