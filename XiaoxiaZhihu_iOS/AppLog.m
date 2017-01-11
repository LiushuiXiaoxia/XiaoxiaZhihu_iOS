//
// Created by xiaqiulei on 2017/1/10.
// Copyright (c) 2017 cn.mycommons. All rights reserved.
//


@implementation AppLog {

}
+ (void)logi:(NSString *)format, ... {
    if (format) {
        va_list args;
        va_start(args, format);
        NSString   *s1      = [[NSString alloc] initWithFormat:format arguments:args];
        const char *cString = [s1 cStringUsingEncoding:NSUTF8StringEncoding];
        NSString   *s2      = [NSString stringWithCString:cString encoding:NSNonLossyASCIIStringEncoding];
        if (s2) {
            DDLogInfo(@"%@", s2);
        } else {
            DDLogInfo(@"%@", s1);
        }
        va_end(args);
    }
}

+ (void)logw:(NSString *)format, ... {
    if (format) {
        va_list args;
        va_start(args, format);
        NSString   *s1      = [[NSString alloc] initWithFormat:format arguments:args];
        const char *cString = [s1 cStringUsingEncoding:NSUTF8StringEncoding];
        NSString   *s2      = [NSString stringWithCString:cString encoding:NSNonLossyASCIIStringEncoding];
        if (s2) {
            DDLogWarn(@"%@", s2);
        } else {
            DDLogWarn(@"%@", s1);
        }
        va_end(args);
    }
}

+ (void)loge:(NSString *)format, ... {
    if (format) {
        va_list args;
        va_start(args, format);
        NSString   *s1      = [[NSString alloc] initWithFormat:format arguments:args];
        const char *cString = [s1 cStringUsingEncoding:NSUTF8StringEncoding];
        NSString   *s2      = [NSString stringWithCString:cString encoding:NSNonLossyASCIIStringEncoding];
        if (s2) {
            DDLogError(@"%@", s2);
        } else {
            DDLogError(@"%@", s1);
        }
        va_end(args);
    }
}

@end