//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GetStartInfoRequest;
@class GetAllThemesRequest;
@class GetLastThemeRequest;
@class GetNewsRequest;
@class GetThemeRequest;
@class GetStoryExtraRequest;
@class GetShortCommentsRequest;
@class GetLongCommentsRequest;

@protocol IZhihuApi <NSObject>

// 1.启动界面图像获取
- (void)getStartInfoResponse:(GetStartInfoRequest *)request;

// 9.主题日报列表查看
- (void)getAllThemesResponse:(GetAllThemesRequest *)request;

// 3.最新消息
- (void)getLastThemeResponse:(GetLastThemeRequest *)request;

// 4.消息内容获取与离线下载
- (void)getNewsResponse:(GetNewsRequest *)request;

// 10. 主题日报内容查看
- (void)getThemeResponse:(GetThemeRequest *)request;

// 6.新闻额外信息
- (void)getStoryExtraResponse:(GetStoryExtraRequest *)request;

// 8.新闻对应短评论查看
- (void)getShortComments:(GetShortCommentsRequest *)request;

// 7.新闻对应长评论查看
- (void)getLongComments:(GetLongCommentsRequest *)request;

@end