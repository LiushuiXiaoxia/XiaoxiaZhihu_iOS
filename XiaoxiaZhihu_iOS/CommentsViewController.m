//
//  CommentsViewController.m
//  XiaoxiaZhihu_iOS
//
//  Created by xiaqiulei on 16/2/29.
//  Copyright © 2016年 cn.mycommons. All rights reserved.
//

#import "CommentsViewController.h"
#import "GetLongCommentsRequest.h"
#import "GetShortCommentsRequest.h"
#import "GetLongCommentsResponse.h"
#import "GetShortCommentsResponse.h"
#import "GetStoryExtraResponse.h"
#import "InjectHelper.h"
#import "IZhihuApi.h"
#import "CommentsViewCell.h"
#import "MJRefreshNormalHeader.h"
#import "AppGlobal.h"

@interface CommentsViewController ()

@property(nonatomic, strong) IBOutlet UITableView *tableView;

@property(nonatomic, strong) id <IZhihuApi> zhihuApi;
@property(nonatomic, strong) GetLongCommentsResponse *getLongCommentsResponse;
@property(nonatomic, strong) NSMutableArray *data;
@property(nonatomic) BOOL isLoadedShortComments;

@end

@implementation CommentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    DDLogVerbose(@"newsId = %d", _newsId);

    self.zhihuApi = [InjectHelper getZhihuApi];
    self.isLoadedShortComments = NO;
    self.data = [[NSMutableArray alloc] init];
    [self.data addObject:@(_storyExtra.longComments)];
    [self.data addObject:@(_storyExtra.shortComments)];

    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 75;
    self.tableView.rowHeight = UITableViewAutomaticDimension;

    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.getLongCommentsResponse = nil;
        self.isLoadedShortComments = NO;
        [self getLongComments];
    }];

    [self getLongComments];
}

- (void)getLongComments {
    GetLongCommentsRequest *request = [GetLongCommentsRequest requestWithCommentId:_newsId];
    request.responseModelClass = [GetLongCommentsResponse class];
    request.completionHandler = ^(BaseZhihuRequest *task, id responseObj, NSError *error) {
        if (responseObj) {
            self.getLongCommentsResponse = responseObj;

            [self.data removeAllObjects];
            [self.data addObject:@(self.getLongCommentsResponse.comments.count)];
            [self.data addObjectsFromArray:self.getLongCommentsResponse.comments];
            [self.data addObject:@(_storyExtra.shortComments)];

            [self.tableView reloadData];
        }

        [self.tableView.mj_header endRefreshing];
    };

    [self.zhihuApi getLongComments:request];
}

- (void)getShortComments {
    GetShortCommentsRequest *request = [GetShortCommentsRequest requestWithCommentId:_newsId];
    request.responseModelClass = [GetShortCommentsResponse class];
    request.completionHandler = ^(BaseZhihuRequest *task, id responseObj, NSError *error) {
        GetShortCommentsResponse *response = responseObj;
        NSUInteger count = self.data.count;

        [self.data removeAllObjects];
        [self.data addObject:@(self.getLongCommentsResponse.comments.count)];
        [self.data addObjectsFromArray:self.getLongCommentsResponse.comments];
        [self.data addObject:@(response.comments.count)];
        [self.data addObjectsFromArray:response.comments];


        [self.tableView reloadData];

        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:count - 1 inSection:0];
        [self.tableView scrollToRowAtIndexPath:indexPath
                              atScrollPosition:UITableViewScrollPositionTop
                                      animated:YES];
    };

    [self.zhihuApi getShortComments:request];
}

# pragma mark UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSObject *item = self.data[(NSUInteger) indexPath.row];
    if ([item isKindOfClass:[NSNumber class]]) {
        return [self bindTitleCell:tableView row:indexPath.row item:item];
    } else {
        return [self bindCommentCell:tableView item:item];
    }
}

- (UITableViewCell *)bindTitleCell:(UITableView *)tableView row:(NSInteger)row item:(NSObject *)item {
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"Head"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSNumber *number = (NSNumber *) item;
    if (row == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"%d条长评论", number.intValue];
    } else {
        cell.textLabel.text = [NSString stringWithFormat:@"%d条短评论", number.intValue];
    }
    return cell;
}

- (UITableViewCell *)bindCommentCell:(UITableView *)tableView item:(NSObject *)item {
    CommentsViewCell *cell = nil;
    NSString *identifier = @"Cell";
    cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[CommentsViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    Comment *comment = (Comment *) item;
    [cell bind:comment];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSObject *item = self.data[(NSUInteger) indexPath.row];

    if ([item isKindOfClass:[NSNumber class]] && !self.isLoadedShortComments && indexPath.row != 0) {
        self.isLoadedShortComments = YES;

        [self getShortComments];
    }
}
@end