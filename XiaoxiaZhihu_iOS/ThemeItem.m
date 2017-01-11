//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import "ThemeItem.h"


@implementation ThemeItem {

}
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
            @"themeId": @"id",
            @"themeDescription": @"description",
    };
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.themeId=%i", self.themeId];
    [description appendFormat:@", self.name=%@", self.name];
    [description appendFormat:@", self.thumbnail=%@", self.thumbnail];
    [description appendFormat:@", self.themeDescription=%@", self.themeDescription];
    [description appendFormat:@", self.color=%@", self.color];
    [description appendString:@">"];
    return description;
}

@end