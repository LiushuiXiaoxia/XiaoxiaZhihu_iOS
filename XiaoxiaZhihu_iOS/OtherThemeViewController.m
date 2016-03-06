//
//  OtherThemeViewController.m
//  XiaoxiaZhihu_iOS
//
//  Created by xiaqiulei on 16/2/29.
//  Copyright © 2016年 cn.mycommons. All rights reserved.
//

#import "OtherThemeViewController.h"
#import "GetThemeRequest.h"
#import "GetThemeResponse.h"
#import "InjectHelper.h"
#import "IZhihuApi.h"
#import "ImageLoadHelper.h"
#import "UIImageView+WebCache.h"
#import "DetailViewController.h"
#import "MJRefreshNormalHeader.h"

@interface OtherThemeViewController () {
    __weak IBOutlet UITableView *_tableView;
}

@property(nonatomic, strong) UIImageView *headerView;
@property(nonatomic, strong) GetThemeResponse *getThemeResponse;

@end

@implementation OtherThemeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.navigationController.navigationBar.hidden = NO;
    self.title = _viewControllerTitle;
    self.view.backgroundColor = [UIColor greenColor];

    self.headerView = [[UIImageView alloc] init];
    self.headerView.frame = CGRectMake(0, 0, _tableView.frame.size.width, 200);
    self.headerView.contentMode = UIViewContentModeScaleAspectFill;
    _tableView.tableHeaderView = self.headerView;
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getTheme];
    }];

    _tableView.delegate = self;
    _tableView.dataSource = self;

    [self getTheme];
}

- (void)getTheme {
    GetThemeRequest *request = [GetThemeRequest requestWithThemeId:_themeId];
    request.responseModelClass = [GetThemeResponse class];
    request.completionHandler = ^(BaseZhihuRequest *task, id responseObj, NSError *error) {
        [_tableView.mj_header endRefreshing];

        self.getThemeResponse = responseObj;

        [ImageLoadHelper loadWithImageUrl:self.getThemeResponse.image imageView:self.headerView];
        [_tableView reloadData];
    };

    [[InjectHelper getZhihuApi] getThemeResponse:request];
}

# pragma mark UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.getThemeResponse) {
        return self.getThemeResponse.stories.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    LastThemeStory *item = self.getThemeResponse.stories[(NSUInteger) indexPath.row];

    cell.textLabel.text = item.title;
    if (item.images.count > 0) {
        [ImageLoadHelper loadWithImageUrl:item.images[0] tableViewCell:cell];
    } else {
        cell.imageView.image = nil;
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *viewController = [[DetailViewController alloc] init];
    viewController.newsId = self.getThemeResponse.stories[(NSUInteger) indexPath.row].storyId;
    [self.navigationController pushViewController:viewController animated:YES];
}
@end