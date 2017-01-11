//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import "GetShortCommentsRequest.h"


@implementation GetShortCommentsRequest {

}
- (instancetype)initWithCommentId:(int)commentId {
    self = [super init];
    if (self) {
        self.commentId = commentId;
    }

    return self;
}

+ (instancetype)requestWithCommentId:(int)commentId {
    return [[self alloc] initWithCommentId:commentId];
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString string];
    [description appendFormat:@"self.commentId=%i", self.commentId];

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