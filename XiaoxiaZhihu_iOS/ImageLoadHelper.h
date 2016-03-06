//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageLoadHelper : NSObject

+ (void)loadWithImageUrl:(NSString *)imageUrl imageView:(UIImageView *)imageView;

+ (void)loadWithImageUrl:(NSString *)imageUrl tableViewCell:(UITableViewCell *)cell;

@end