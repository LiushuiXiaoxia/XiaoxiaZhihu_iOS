//
//  CommentsViewController.h
//  XiaoxiaZhihu_iOS
//
//  Created by xiaqiulei on 16/2/29.
//  Copyright © 2016年 cn.mycommons. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GetStoryExtraResponse;

@interface CommentsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property int newsId;

@property GetStoryExtraResponse *storyExtra;

@end
