//
//  OtherThemeViewController.h
//  XiaoxiaZhihu_iOS
//
//  Created by xiaqiulei on 16/2/29.
//  Copyright © 2016年 cn.mycommons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtherThemeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property NSString *viewControllerTitle;
@property int      themeId;

@end