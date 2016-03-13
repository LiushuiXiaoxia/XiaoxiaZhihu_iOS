//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import "ZhihuApiImpl.h"
#import "AFNetworking.h"
#import "GetStartInfoRequest.h"
#import "YYModel.h"
#import "GetNewsRequest.h"
#import "GetThemeRequest.h"
#import "GetStoryExtraRequest.h"
#import "GetShortCommentsRequest.h"
#import "GetLongCommentsRequest.h"
#import "GetAllThemesRequest.h"
#import "GetLastThemeRequest.h"

@implementation ZhihuApiImpl {
    AFHTTPSessionManager *_manager;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        _manager = [AFHTTPSessionManager manager];
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [_manager.requestSerializer setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
        [_manager.requestSerializer setValue:@"no-cache" forHTTPHeaderField:@"Cache-Control"];
        [_manager.requestSerializer setValue:@"zhihu" forHTTPHeaderField:@"User-Agent"];
        _manager.responseSerializer = [[AFJSONResponseSerializer alloc] init];
    }

    return self;
}

- (void)doHttpGet:(NSString *)url
          success:(void (^)(NSURLSessionDataTask *, id))success
          failure:(void (^)(NSURLSessionDataTask *, NSError *))failure {

    [_manager GET:url
       parameters:nil
         progress:nil
          success:success
          failure:failure];
}

- (void (^)(NSURLSessionDataTask *, NSError *))getFailCallback:(BaseZhihuRequest *)request {
    void (^failure)(NSURLSessionDataTask *, NSError *) = ^(NSURLSessionDataTask *task, NSError *error) {
        DDLogError(@"ZhihuApiImpl.getStartInfoResponse.error = %@", error);
        if (request.completionHandler) {
            request.completionHandler(request, nil, error);
        }
    };
    return failure;
}

- (void (^)(NSURLSessionDataTask *, id))getSuccessCallback:(BaseZhihuRequest *)request {
    void (^success)(NSURLSessionDataTask *, id) = ^(NSURLSessionDataTask *task, id responseObject) {
        DDLogInfo(@"ZhihuApiImpl.getStartInfoResponse.responseObject = %@", responseObject);

        if (request.completionHandler) {
            id zhihuResponse = [request.responseModelClass yy_modelWithDictionary:responseObject];
            DDLogInfo(@"zhihuResponse = %@", zhihuResponse);
            request.completionHandler(request, zhihuResponse, nil);
        }
    };
    return success;
}

- (void)getStartInfoResponse:(GetStartInfoRequest *)request {
    NSString *url = @"http://news-at.zhihu.com/api/4/start-image/%d*%d";
    url = [NSString stringWithFormat:url, request.width, request.height];

    DDLogInfo(@"url = %@", url);

    void (^success)(NSURLSessionDataTask *, id) = [self getSuccessCallback:request];
    void (^failure)(NSURLSessionDataTask *, NSError *) = [self getFailCallback:request];
    [self doHttpGet:url success:success failure:failure];
}


- (void)getAllThemesResponse:(GetAllThemesRequest *)request {
    NSString *url = @"http://news-at.zhihu.com/api/4/themes";

    DDLogInfo(@"url = %@", url);

    void (^success)(NSURLSessionDataTask *, id) = [self getSuccessCallback:request];
    void (^failure)(NSURLSessionDataTask *, NSError *) = [self getFailCallback:request];
    [self doHttpGet:url success:success failure:failure];
}

- (void)getLastThemeResponse:(GetLastThemeRequest *)request {
    NSString *url = @"http://news-at.zhihu.com/api/4/news/latest";

    DDLogInfo(@"url = %@", url);

    void (^success)(NSURLSessionDataTask *, id) = [self getSuccessCallback:request];
    void (^failure)(NSURLSessionDataTask *, NSError *) = [self getFailCallback:request];
    [self doHttpGet:url success:success failure:failure];
}

- (void)getNewsResponse:(GetNewsRequest *)request {
    NSString *url = @"http://news-at.zhihu.com/api/4/news/%d";
    url = [NSString stringWithFormat:url, request.newsId];

    DDLogInfo(@"url = %@", url);

    void (^success)(NSURLSessionDataTask *, id) = [self getSuccessCallback:request];
    void (^failure)(NSURLSessionDataTask *, NSError *) = [self getFailCallback:request];
    [self doHttpGet:url success:success failure:failure];
}

- (void)getThemeResponse:(GetThemeRequest *)request {
    NSString *url = @"http://news-at.zhihu.com/api/4/theme/%d";
    url = [NSString stringWithFormat:url, request.themeId];

    DDLogInfo(@"url = %@", url);

    void (^success)(NSURLSessionDataTask *, id) = [self getSuccessCallback:request];
    void (^failure)(NSURLSessionDataTask *, NSError *) = [self getFailCallback:request];
    [self doHttpGet:url success:success failure:failure];
}

- (void)getStoryExtraResponse:(GetStoryExtraRequest *)request {
    NSString *url = @"http://news-at.zhihu.com/api/4/story-extra/%d";
    url = [NSString stringWithFormat:url, request.extraId];

    DDLogInfo(@"url = %@", url);

    void (^success)(NSURLSessionDataTask *, id) = [self getSuccessCallback:request];
    void (^failure)(NSURLSessionDataTask *, NSError *) = [self getFailCallback:request];
    [self doHttpGet:url success:success failure:failure];
}

- (void)getShortComments:(GetShortCommentsRequest *)request {
    NSString *url = @"http://news-at.zhihu.com/api/4/story/%d/short-comments";
    url = [NSString stringWithFormat:url, request.commentId];

    DDLogInfo(@"url = %@", url);

    void (^success)(NSURLSessionDataTask *, id) = [self getSuccessCallback:request];
    void (^failure)(NSURLSessionDataTask *, NSError *) = [self getFailCallback:request];
    [self doHttpGet:url success:success failure:failure];
}

- (void)getLongComments:(GetLongCommentsRequest *)request {
    NSString *url = @"http://news-at.zhihu.com/api/4/story/%d/long-comments";
    url = [NSString stringWithFormat:url, request.commentId];

    DDLogInfo(@"url = %@", url);

    void (^success)(NSURLSessionDataTask *, id) = [self getSuccessCallback:request];
    void (^failure)(NSURLSessionDataTask *, NSError *) = [self getFailCallback:request];
    [self doHttpGet:url success:success failure:failure];
}

@end