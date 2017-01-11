//
//  HotnewsViewController.m
//  XiaoxiaZhihu_iOS
//
//  Created by xiaqiulei on 16/2/29.
//  Copyright © 2016年 cn.mycommons. All rights reserved.
//

#import "HotnewsViewController.h"
#import "InjectHelper.h"
#import "IZhihuApi.h"
#import "GetLastThemeRequest.h"
#import "GetLastThemeResponse.h"
#import "ImageLoadHelper.h"
#import "DetailViewController.h"
#import <MJRefresh/MJRefreshNormalHeader.h>

@interface HotnewsViewController ()

@property(nonatomic, strong) IBOutlet UITableView *tableView;
@property(nonatomic, strong) UIScrollView         *scrollView;
@property(nonatomic, strong) UIPageControl        *pageControl;

@property(nonatomic, strong) GetLastThemeResponse *lastThemeResponse;

@property CGFloat screenWidth;

@end

@implementation HotnewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.screenWidth = [UIScreen mainScreen].bounds.size.width;

    self.navigationController.navigationBar.hidden = NO;
    self.title                                     = self.viewControllerTitle;
    self.view.backgroundColor                      = [UIColor redColor];

    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, _screenWidth, 210);

    self.scrollView                                = [[UIScrollView alloc] init];
    self.scrollView.frame                          = CGRectMake(0, 0, _screenWidth, 200);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled                  = YES;
    self.scrollView.delegate                       = self;

    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getLastTheme];
    }];

    [headerView addSubview:self.scrollView];
    self.tableView.tableHeaderView = headerView;
    self.tableView.tableFooterView = [[UIView alloc] init];

    self.tableView.delegate   = self;
    self.tableView.dataSource = self;

    [self getLastTheme];
}

- (void)getLastTheme {
    GetLastThemeRequest *request = [[GetLastThemeRequest alloc] init];
    request.responseModelClass = [GetLastThemeResponse class];
    request.completionHandler  = ^(BaseZhihuRequest *task, id responseObj, NSError *error) {
        self.lastThemeResponse = responseObj;

        [self updateHeaderView];
        [self.tableView reloadData];

        [_tableView.mj_header endRefreshing];
    };
    [[InjectHelper getZhihuApi] getLastThemeResponse:request];
}

- (void)updateHeaderView {
    // UIScrollView
    CGRect     rect  = self.scrollView.frame;
    NSUInteger count = self.lastThemeResponse.topStories.count;
    self.scrollView.contentSize = CGSizeMake(rect.size.width * count, 0);
    for (int i = 0; i < count; i++) {
        CGRect      imageRect  = CGRectMake(rect.size.width * i, 0, rect.size.width, rect.size.height);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageRect];
        imageView.contentMode  = UIViewContentModeScaleAspectFill;
        [self.scrollView addSubview:imageView];

        // load image
        LastTemeTopStory *topStory = self.lastThemeResponse.topStories[(NSUInteger) i];
        [ImageLoadHelper loadWithImageUrl:topStory.image imageView:imageView];

        // click
        imageView.tag = i;
        [imageView setUserInteractionEnabled:YES];
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick:)]];
    }

    // UIPageControl
    CGRect pageControlRect = CGRectMake(10, rect.size.height - 30, 100, 20);
    self.pageControl               = [[UIPageControl alloc] initWithFrame:pageControlRect];
    self.pageControl.numberOfPages = count;
    self.pageControl.currentPage   = 0;
    [self.tableView.tableHeaderView addSubview:self.pageControl];
}

- (void)imageClick:(UITapGestureRecognizer *)recognizer {
    LastTemeTopStory *story = self.lastThemeResponse.topStories[(NSUInteger) recognizer.view.tag];
    [self gotoDetail:story.storyId];
}

- (void)gotoDetail:(int)storyId {
    DetailViewController *viewController = [[DetailViewController alloc] init];
    viewController.newsId = storyId;
    [self.navigationController pushViewController:viewController animated:YES];
}

# pragma mark UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.lastThemeResponse) {
        return self.lastThemeResponse.stories.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    LastThemeStory *item = self.lastThemeResponse.stories[(NSUInteger) indexPath.row];

    cell.textLabel.text = item.title;
    if (item.images.count > 0) {
        [ImageLoadHelper loadWithImageUrl:item.images[0] tableViewCell:cell];
    } else {
        cell.imageView.image = nil;
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int storyId = self.lastThemeResponse.stories[(NSUInteger) indexPath.row].storyId;
    [self gotoDetail:storyId];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat scrollviewW = scrollView.frame.size.width;
    CGFloat x           = scrollView.contentOffset.x;
    int     page        = (int) ((x + scrollviewW / 2) / scrollviewW);
    self.pageControl.currentPage = page;
}
@end