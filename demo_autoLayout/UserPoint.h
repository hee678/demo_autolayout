//
//  UserPoint.h
//  TCFinance
//
//  Created by LittleKin on 15/12/3.
//  Copyright © 2015年 Tiancai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@class User;
@interface UserPoint : NSObject
// 内容
@property (nonatomic, copy) NSString *content;
// 时间
@property (nonatomic, assign) long long created_date;
// 观点id
@property (nonatomic, assign) NSInteger identifier;
// 是否可见，收费内容用
@property (nonatomic, assign) NSInteger visible;
// 标题
@property (nonatomic, copy) NSString *title;
// 观点图片数组
@property (nonatomic, strong) NSArray<NSString*> *pic_paths;
// 用户对象
@property (nonatomic, strong) User *user;
// 赞个数
@property (nonatomic, assign) NSInteger attitudes_count;
// 评论个数
@property (nonatomic, assign) NSInteger comments_count;
// 转发个数
@property (nonatomic, assign) NSInteger reposts_count;
// 赞按钮选中状态
@property (nonatomic, assign) BOOL attitude;

-(instancetype)initWithDict:(NSDictionary *)dict;
@end




