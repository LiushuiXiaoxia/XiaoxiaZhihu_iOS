//
// Created by xiaqiulei on 16/3/3.
// Copyright (c) 2016 cn.mycommons. All rights reserved.
//

#import "CommentsViewCell.h"
#import "Masonry.h"
#import "ImageLoadHelper.h"

@interface CommentsViewCell () {
    CGFloat _screenWidth;
    int     iconWidth;
    int     iconOffset;
    int     padding;
    int     titleHeight;
}

@property(nonatomic, strong) UIView      *container;
@property(nonatomic, strong) UIImageView *ivIcon;
@property(nonatomic, strong) UILabel     *labelTitle;
@property(nonatomic, strong) UILabel     *labelContent;
@property(nonatomic, strong) UILabel     *labelDate;

@end

@implementation CommentsViewCell
- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier];
    if (self) {
        _screenWidth = [[UIScreen mainScreen] bounds].size.width;
        iconWidth    = 44;
        padding      = 5;
        iconOffset   = 15;
        titleHeight  = 25;

        self.container = [UIView new];
        [self addSubview:self.container];
        [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(iconOffset);
            make.right.equalTo(self).with.offset(-padding);
            make.top.equalTo(self).with.offset(padding);
            make.bottom.equalTo(self).with.offset(-padding);
        }];

        self.ivIcon = [UIImageView new];
        [self.container addSubview:self.ivIcon];
        [self.ivIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.mas_equalTo(iconWidth);
            make.top.and.left.mas_equalTo(self.container);
        }];

        self.labelTitle = [UILabel new];
        [self.container addSubview:self.labelTitle];
        [self.labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.ivIcon.mas_right).with.offset(padding);
            make.right.equalTo(self.container.mas_right);
            make.top.equalTo(self.ivIcon);
            make.height.mas_equalTo(titleHeight);
        }];

        self.labelContent               = [UILabel new];
        self.labelContent.numberOfLines = 0;
        [self.container addSubview:self.labelContent];
        [self.labelContent mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.labelTitle);
            make.right.equalTo(self.labelTitle);
            make.top.equalTo(self.labelTitle.mas_bottom);
            make.height.mas_equalTo(titleHeight);
        }];

        self.labelDate = [UILabel new];
        [self.container addSubview:self.labelDate];
        [self.labelDate mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.labelTitle);
            make.right.equalTo(self.labelTitle);
            make.top.equalTo(self.labelContent.mas_bottom);
            make.bottom.equalTo(self.container);
            make.height.mas_equalTo(titleHeight);
        }];
    }
    return self;
}


- (void)bind:(Comment *)comment {
    [ImageLoadHelper loadWithImageUrl:comment.avatar imageView:_ivIcon];

    _labelTitle.text   = comment.author;
    _labelContent.text = comment.content;

    NSDate          *date      = [NSDate dateWithTimeIntervalSince1970:comment.time];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    _labelDate.text      = [formatter stringFromDate:date];

    CGSize boundSize = CGSizeMake(_screenWidth - iconOffset - iconWidth - padding * 2, CGFLOAT_MAX);
    CGSize size      = [comment.content sizeWithFont:_labelContent.font
                                   constrainedToSize:boundSize
                                       lineBreakMode:UILineBreakModeWordWrap];

    [self.labelContent mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(size.height + titleHeight);
    }];

    CGRect rect = self.frame;
    rect.size.height = titleHeight * 3 + size.height;
    self.frame       = rect;
}
@end