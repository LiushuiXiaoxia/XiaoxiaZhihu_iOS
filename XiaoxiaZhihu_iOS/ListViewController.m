//
//  ListViewController.m
//  XiaoxiaZhihu_iOS
//
//  Created by xiaqiulei on 16/2/28.
//  Copyright © 2016年 cn.mycommons. All rights reserved.
//

#import <MJRefresh/MJRefreshNormalHeader.h>
#import "ListViewController.h"
#import "BaseZhihuRequest.h"
#import "IZhihuApi.h"
#import "GetAllThemesRequest.h"
#import "GetAllThemesResponse.h"
#import "InjectHelper.h"
#import "ThemeItem.h"
#import "HotnewsViewController.h"
#import "OtherThemeViewController.h"

static NSString *const HOT_NEW_TITLE = @"今日热闻";

@interface ListViewController () {
    __weak IBOutlet UITableView *_tableView;
}

@property(nonatomic, strong) GetAllThemesResponse *getAllThemesResponse;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // set up
    self.title                                     = @"主题列表";
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.hidesBackButton            = YES;

    _tableView.mj_header       = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self fetchAllTheme];
    }];
    _tableView.tableFooterView = [[UIView alloc] init];

    // fetch data
    [self fetchAllTheme];
}

- (void)fetchAllTheme {
    GetAllThemesRequest *request = [[GetAllThemesRequest alloc] init];
    request.responseModelClass = [GetAllThemesResponse class];
    request.completionHandler  = ^(BaseZhihuRequest *task, id responseObj, NSError *error) {
        if (!error) {
            [self updateUI:responseObj];
        }
        [_tableView.mj_header endRefreshing];
    };
    [[InjectHelper getZhihuApi] getAllThemesResponse:request];
}

- (void)updateUI:(GetAllThemesResponse *)response {
    self.getAllThemesResponse = response;
    _tableView.delegate       = self;
    _tableView.dataSource     = self;

    [_tableView reloadData];
}

# pragma mark UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.getAllThemesResponse.others.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    if (indexPath.row == 0) {
        cell.textLabel.text = HOT_NEW_TITLE;
    } else {
        ThemeItem *item = [self getItem:(NSUInteger) (indexPath.row - 1)];
        cell.textLabel.text = item.name;
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AppLogI(@"indexPath = %@", indexPath);

    if (indexPath.row == 0) {
        HotnewsViewController *controller = [[HotnewsViewController alloc] init];
        controller.viewControllerTitle = HOT_NEW_TITLE;
        [self.navigationController pushViewController:controller animated:YES];
    } else {
        ThemeItem *item = [self getItem:(NSUInteger) (indexPath.row - 1)];

        OtherThemeViewController *controller = [[OtherThemeViewController alloc] init];
        controller.viewControllerTitle = item.name;
        controller.themeId             = item.themeId;
        [self.navigationController pushViewController:controller animated:YES];
    }
}

- (ThemeItem *)getItem:(NSUInteger)index {
    if (index < [self tableView:_tableView numberOfRowsInSection:0]) {
        ThemeItem *item = self.getAllThemesResponse.others[index];
        return item;
    }
    return nil;
}
@end