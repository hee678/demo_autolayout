//
//  TCHomeNewPointCell.h
//  TCFinance
//
//  Created by LittleKin on 15/11/6.
//  Copyright © 2015年 Tiancai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserPoint.h"


@interface TCHomeNewPointCell : UITableViewCell
// 新观点模型
@property (nonatomic, strong) UserPoint *point;
// 底部分割线
@property (weak, nonatomic) IBOutlet UIView *bottomLineView;
@end
