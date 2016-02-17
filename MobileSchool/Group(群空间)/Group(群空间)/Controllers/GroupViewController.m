//
//  GroupViewController.m
//  MobileSchool
//
//  Created by 李公博 on 16/1/27.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "GroupViewController.h"

@interface GroupViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic) NSArray* tableData;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@end

@implementation GroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (!_tableData) {
        _tableData = [[NSArray alloc]init];
    }
    //_tableData = @[@[@"我的订单",@""],@[@"我的账号",@"我的收藏",@"地址管理"],@[@"我的活动",@"意见反馈",@"系统设置"]];
    if (_tableData.count != 0) {
        [_image removeFromSuperview];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
