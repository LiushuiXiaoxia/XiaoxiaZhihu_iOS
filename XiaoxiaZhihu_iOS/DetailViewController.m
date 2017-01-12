//
//  DetailViewController.m
//  XiaoxiaZhihu_iOS
//
//  Created by xiaqiulei on 16/2/29.
//  Copyright © 2016年 cn.mycommons. All rights reserved.
//

#import "DetailViewController.h"
#import "IZhihuApi.h"
#import "InjectHelper.h"
#import "GetNewsRequest.h"
#import "GetStoryExtraRequest.h"
#import "GetStoryExtraResponse.h"
#import "GetNewsResponse.h"
#import "CommentsViewController.h"
#import "MBProgressHUD.h"

@interface DetailViewController ()

@property(nonatomic, strong) IBOutlet UIWebView *webView;
@property(nonatomic, strong) UIBarButtonItem    *commmentsButton;
@property(nonatomic, strong) UIBarButtonItem    *popularityButton;

@property(nonatomic, strong) id <IZhihuApi>        zhihuApi;
@property(nonatomic, strong) GetNewsResponse       *getNewsResponse;
@property(nonatomic, strong) GetStoryExtraResponse *getStoryExtraResponse;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setup];
    [self getStoryExtra];
    [self getNews];
}

- (void)setup {
    self.zhihuApi = [InjectHelper getZhihuApi];
}


- (void)getStoryExtra {
    GetStoryExtraRequest *request = [GetStoryExtraRequest requestWithExtraId:_newsId];
    request.responseModelClass = [GetStoryExtraResponse class];
    request.completionHandler  = ^(BaseZhihuRequest *task, id responseObj, NSError *error) {
        self.getStoryExtraResponse = responseObj;

        [self addNavigationButtons];
    };

    [self.zhihuApi getStoryExtraResponse:request];
}

- (void)addNavigationButtons {
    NSString *string = [NSString stringWithFormat:@"评论(%d)", self.getStoryExtraResponse.comments];
    self.commmentsButton = [[UIBarButtonItem alloc] initWithTitle:string
                                                            style:UIBarButtonItemStyleDone
                                                           target:self
                                                           action:@selector(gotoComments)];

    string = [NSString stringWithFormat:@"赞(%d)", self.getStoryExtraResponse.popularity];
    self.popularityButton = [[UIBarButtonItem alloc] initWithTitle:string
                                                             style:UIBarButtonItemStyleDone
                                                            target:self
                                                            action:@selector(likeNews)];

    NSArray *buttons = @[self.commmentsButton, self.popularityButton];
    [self.navigationItem setRightBarButtonItems:buttons animated:NO];
}

- (void)likeNews {
    // 只显示文字
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode                      = MBProgressHUDModeText;
    hud.labelText                 = @"需要登录才能点赞";
    hud.margin                    = 30.f;
    hud.yOffset                   = 20.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

- (void)getNews {
    GetNewsRequest *request = [GetNewsRequest requestWithNewsId:_newsId];
    request.responseModelClass = [GetNewsResponse class];
    request.completionHandler  = ^(BaseZhihuRequest *task, id responseObj, NSError *error) {
        self.getNewsResponse = responseObj;

        [self.webView loadHTMLString:self.getNewsResponse.body baseURL:nil];
    };

    [self.zhihuApi getNewsResponse:request];
}

- (void)gotoComments {
    CommentsViewController *viewController = [[CommentsViewController alloc] init];
    viewController.newsId     = _newsId;
    viewController.storyExtra = self.getStoryExtraResponse;
    [self.navigationController pushViewController:viewController animated:YES];
}
@end