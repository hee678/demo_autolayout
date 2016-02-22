//
//  User.m
//  TCFinance
//
//  Created by LittleKin on 15/12/14.
//  Copyright © 2015年 Tiancai. All rights reserved.
//

#import "User.h"

@implementation User
- (NSString *)description
{
    return [NSString stringWithFormat:@"%@->>> identifier :%zd\nnickname :%@\npic_path :%@\nuser_type :%zd", self.class, self.identifier, self.nickname, self.pic_path, self.user_type];
}

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {
        self.identifier = [dict[@"identifier"] integerValue];
        // 用户昵称
        self.nickname = dict[@"nickname"];
        // 用户头像
        self.pic_path = dict[@"pic_path"];
        // 用户类型
        self.user_type = [dict[@"user_type"] integerValue];
    }
    return self;
}
@end
