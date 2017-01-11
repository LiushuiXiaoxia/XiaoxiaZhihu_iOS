//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import "ThemeEditor.h"


@implementation ThemeEditor {

}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
            @"themeEditorId": @"id",
    };
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.url=%@", self.url];
    [description appendFormat:@", self.bio=%@", self.bio];
    [description appendFormat:@", self.themeEditorId=%i", self.themeEditorId];
    [description appendFormat:@", self.avatar=%@", self.avatar];
    [description appendFormat:@", self.name=%@", self.name];
    [description appendString:@">"];
    return description;
}

@end