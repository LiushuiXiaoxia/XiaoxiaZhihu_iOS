//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import "Comment.h"


@implementation Comment {

}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
            @"commentId" : @"id",
    };
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.commentId=%i", self.commentId];
    [description appendFormat:@", self.author=%@", self.author];
    [description appendFormat:@", self.content=%@", self.content];
    [description appendFormat:@", self.likes=%i", self.likes];
    [description appendFormat:@", self.time=%i", self.time];
    [description appendFormat:@", self.avatar=%@", self.avatar];
    [description appendString:@">"];
    return description;
}

@end