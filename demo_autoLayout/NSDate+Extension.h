//
//  NSDate+Extension.h
//  TCFinance
//
//  Created by LittleKin on 15/10/28.
//  Copyright © 2015年 LittleKin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

/**
 *  转换时间格式方式一
 *
 *  @param createDate 传入的日期（NSDate格式日期）
 *
 *  @return 时间标签
 */
+ (NSString *)dateWithDate:(NSDate *)inputDate;

/**
 *  转换时间格式方式二
 *
 *  @param inputDate 传入的日期（NSString格式日期）
 *
 *  @return 时间标签
 */
+ (NSString *)dateWithString:(NSString *)inputString;

/**
 *  判断某个时间是否为今年
 */
- (BOOL)isThisYear;

/**
 *  判断某个时间是否为昨天
 */
- (BOOL)isYesterday;

/**
 *  判断某个时间是否为今天
 */
- (BOOL)isToday;

@end
