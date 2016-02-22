//
//  TCHomeNewPointCell.m
//  TCFinance
//
//  Created by LittleKin on 15/11/6.
//  Copyright © 2015年 Tiancai. All rights reserved.
//

#import "TCHomeNewPointCell.h"
#import "NSDate+Extension.h"

@interface TCHomeNewPointCell()
// 内容到头像的距离
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentToIconButtonTop;
// 内容图片到底部分割线的距离
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentImageToBottomLineContraint;
// 内容图片高度约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentImageViewHeight;
// 内容图片到标题的距离
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentImageToTitleContraint;
// 内容图片到头像的距离
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentImageToIconButtonContraint;

// 点赞按钮
@property (weak, nonatomic) IBOutlet UIButton *supportButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
// 内容图片
@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;
// 头像按钮
@property (weak, nonatomic) IBOutlet UIButton *iconButton;
// 昵称
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
// 时间
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
// 标题图标
@property (weak, nonatomic) IBOutlet UIImageView *titleIconImageView;
// 标题
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
// 内容
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
// 中间分割线
@property (weak, nonatomic) IBOutlet UIView *middleLineView;

@end

@implementation TCHomeNewPointCell

- (void)awakeFromNib {
    self.contentLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 24;
}

-(void)setPoint:(UserPoint *)point
{
    if(point != nil)
    {
        self.contentToIconButtonTop.priority = 700;
        self.contentImageToTitleContraint.priority = 700;
        self.contentImageToIconButtonContraint.priority = 600;
        self.contentImageToBottomLineContraint.constant = 12;
        self.contentImageViewHeight.constant = 80;
        self.titleIconImageView.hidden = NO;
        
        [self.iconButton setImage:[UIImage imageNamed:@"home_default_icon"] forState:UIControlStateNormal];
        self.nickNameLabel.text=point.user.nickname;
        self.titleLabel.text=point.title;
        self.contentLabel.text=point.content;
        [self setSupportCount:[NSString stringWithFormat:@"%zd",point.attitudes_count]];
        [self setCommentCount:[NSString stringWithFormat:@"%zd",point.comments_count]];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:(point.created_date/1000)];
        self.timeLabel.text = [NSDate dateWithDate:date];
        
        // 有图片就赋值
        if(point.pic_paths.count)
        {
            self.contentImageView.image = [UIImage imageNamed:point.pic_paths[0]];
        }else
        {
            self.contentImageViewHeight.constant = 0;
            self.contentImageToBottomLineContraint.constant = 0;
        }
        
        // 无标题就隐藏
        if([point.title stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0)
        {
            self.titleIconImageView.hidden = YES;
        }
        
        // 标题+图片
        if([point.title stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length != 0 && point.pic_paths.count && [point.content stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0)
        {
            self.contentImageToTitleContraint.priority = 900;
        }
        
        // 内容+图片
        if([point.title stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0 && [point.content stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length != 0 && point.pic_paths.count)
        {
            self.contentToIconButtonTop.priority = 900;
        }
    
        // 只有内容
        if([point.content stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length != 0 && [point.title stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0 && point.pic_paths.count ==0)
        {
            self.contentToIconButtonTop.priority = 900;
        }
        
        // 只有图片
        if(point.pic_paths.count && [point.content stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0 && [point.title stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0)
        {
            self.contentImageToIconButtonContraint.priority = 900;
        }
    }
}

-(void)setSupportCount:(NSString *)titleCount
{
    if([titleCount isEqualToString:@"0"])
    {
        [self.supportButton setTitle:@"赞" forState:UIControlStateNormal];
    }
    else
        [self.supportButton setTitle:titleCount forState:UIControlStateNormal];
}

-(void)setCommentCount:(NSString *)commentCount
{
    if([commentCount isEqualToString:@"0"])
    {
        [self.commentButton setTitle:@"评论" forState:UIControlStateNormal];
    }
    else
        [self.commentButton setTitle:commentCount forState:UIControlStateNormal];
}
@end
