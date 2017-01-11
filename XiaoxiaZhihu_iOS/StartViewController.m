//
//  StartViewController.m
//  XiaoxiaZhihu_iOS
//
//  Created by xiaqiulei on 16/2/28.
//  Copyright © 2016年 cn.mycommons. All rights reserved.
//

#import "StartViewController.h"
#import "InjectHelper.h"
#import "IZhihuApi.h"
#import "GetStartInfoRequest.h"
#import "GetStartInfoResponse.h"
#import "ImageLoadHelper.h"
#import "ListViewController.h"

static const int                            IMAGE_WIDTH  = 1080;
static const int                            IMAGE_HEIGHT = 1776;

@interface StartViewController () {
    __weak IBOutlet UILabel     *_authorLabel;
    __weak IBOutlet UIImageView *_adImageView;
}
@property(nonatomic, strong) id <IZhihuApi> zhihuApi;

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setup];
    [self fetchStartInfo];
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(gotoNext) userInfo:nil repeats:NO];
}

- (void)setup {
    self.navigationController.navigationBar.hidden = YES;

    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue    = @1.0F;
    scaleAnimation.toValue      = @1.1F;
    scaleAnimation.autoreverses = NO;
    scaleAnimation.fillMode     = kCAFillModeForwards;
    scaleAnimation.duration     = 3;
    [_adImageView.layer addAnimation:scaleAnimation forKey:@"transform.scale"];
}

- (void)fetchStartInfo {
    GetStartInfoRequest *request = [GetStartInfoRequest requestWithWidth:IMAGE_WIDTH height:IMAGE_HEIGHT];
    request.responseModelClass = [GetStartInfoResponse class];
    request.completionHandler  = ^(BaseZhihuRequest *task, id responseObj, NSError *error) {
        if (!error) {
            GetStartInfoResponse *response = responseObj;

            _authorLabel.text = response.text;
            [ImageLoadHelper loadWithImageUrl:response.img imageView:_adImageView];
        }
    };

    self.zhihuApi = [InjectHelper getZhihuApi];
    [self.zhihuApi getStartInfoResponse:request];
}

- (void)gotoNext {
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        ListViewController *listViewController = [[ListViewController alloc] init];
        [self.navigationController pushViewController:listViewController animated:NO];
    }];
}
@end