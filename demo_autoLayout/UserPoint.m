//
//  UserPoint.m
//  TCFinance
//
//  Created by LittleKin on 15/12/3.
//  Copyright © 2015年 Tiancai. All rights reserved.
//

#import "UserPoint.h"

@implementation UserPoint

- (NSString *)description
{
    return  [NSString stringWithFormat:@"%@->>>\ncontent:%@\nidentifier:%zd\nvisible:%zd\ntitle:%@\npic_paths:%@\nuser :%@\nattitudes_count :%zd\ncomments_count :%zd\nreposts_count :%zd\nattitude :%zd\ncreated_date :%lld\n",self.class,self.content,self.identifier,self.visible,self.title,self.pic_paths,self.user,self.attitudes_count,self.comments_count,self.reposts_count,self.attitude,self.created_date];
}

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {
        // 内容
        self.content = dict[@"content"];
        // 时间
        self.created_date = [dict[@"created_date"] integerValue];
        // 观点id
        self.identifier = [dict[@"identifier"] integerValue];
        // 是否可见，收费内容用
        self.visible = [dict[@"visible"] integerValue];
        // 标题
        self.title = dict[@"title"];
        // 观点图片数组
        self.pic_paths = dict[@"pic_paths"];
        // 用户对象
        self.user = [[User alloc] initWithDict:dict[@"user"]];
        // 赞个数
        self.attitudes_count = [dict[@"attitudes_count"] integerValue];
        // 评论个数
        self.comments_count = [dict[@"comments_count"] integerValue];
        // 转发个数
        self.reposts_count = [dict[@"reposts_count"] integerValue];
        // 赞按钮选中状态
        self.attitude = dict[@"content"];
    }
    return self;
}
@end


