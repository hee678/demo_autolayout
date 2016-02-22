//
//  ViewController.m
//  demo_autoLayout
//
//  Created by LittleKin on 16/1/27.
//  Copyright © 2016年 LittleKin. All rights reserved.
//

#import "ViewController.h"
#import "TCHomeNewPointCell.h"

#define kTCHomeNewPointCell @"TCHomeNewPointCell"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *pointsList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"最新观点";
    [self initWithData];
    [self registerTableViewCell];
}

- (void)initWithData
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"newpoints" ofType:@"plist"]];

    NSMutableArray *pointsList = [NSMutableArray array];
    for(int i=0 ;i<array.count;i++)
    {
        UserPoint *point = [[UserPoint alloc] initWithDict:array[i]];
        [pointsList addObject:point];
    }
    self.pointsList = pointsList;
}

- (void)registerTableViewCell
{
    UINib *nib = [UINib nibWithNibName:kTCHomeNewPointCell bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:kTCHomeNewPointCell];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.pointsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TCHomeNewPointCell *cell = [tableView dequeueReusableCellWithIdentifier:kTCHomeNewPointCell];
    cell.point = self.pointsList[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TCHomeNewPointCell *cell = [tableView dequeueReusableCellWithIdentifier:kTCHomeNewPointCell];
    cell.point = self.pointsList[indexPath.row];
    [cell layoutIfNeeded];
    return CGRectGetMaxY(cell.bottomLineView.frame);
}
@end
