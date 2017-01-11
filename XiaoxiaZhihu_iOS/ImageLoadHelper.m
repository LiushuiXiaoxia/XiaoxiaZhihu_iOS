//
// Created by xiaqiulei on 16/2/28.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import "ImageLoadHelper.h"
#import <SDWebImage/SDWebImageManager.h>

@implementation ImageLoadHelper {

}

+ (void)loadWithImageUrl:(NSString *)imageUrl imageView:(UIImageView *)imageView {
    SDWebImageManager *manager = [SDWebImageManager sharedManager];

    void (^completedBlock)(UIImage *, NSError *, SDImageCacheType, BOOL, NSURL *) =
    ^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {

        [[NSOperationQueue mainQueue] addOperationWithBlock:^{

        }];
        AppLogW(@"imageURL = %@", imageURL);
        imageView.image = image;
    };

    [manager downloadImageWithURL:[NSURL URLWithString:imageUrl]
                          options:0
                         progress:nil
                        completed:completedBlock];
}

+ (void)loadWithImageUrl:(NSString *)imageUrl tableViewCell:(UITableViewCell *)cell {
    SDWebImageManager *manager = [SDWebImageManager sharedManager];

    void (^completedBlock)(UIImage *, NSError *, SDImageCacheType, BOOL, NSURL *) =
    ^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        AppLogW(@"imageURL = %@", imageURL);
        cell.imageView.image = image;
        [cell setNeedsLayout];
    };

    [manager downloadImageWithURL:[NSURL URLWithString:imageUrl]
                          options:0
                         progress:nil
                        completed:completedBlock];
}

@end