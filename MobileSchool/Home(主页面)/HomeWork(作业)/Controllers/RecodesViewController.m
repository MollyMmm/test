//
//  RecodesViewController.m
//  MobileSchool
//
//  Created by Apple on 16/2/3.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "RecodesViewController.h"
#import "RecodesTableViewCell.h"
#import "HomeworkViewController.h"
#import "DetailRecodesViewController.h"
#import "GroupInformationViewController.h"
#import "OtherPeopleSendWorkTableViewCell.h"
#import "DetailOtherNotificationViewController.h"

@interface RecodesViewController ()<UITableViewDataSource,UITableViewDelegate,recodesDelegate,ToGroupDelegate,OtherToGroupDelegate,OtherPeopleDetailInformationDelegate>
@property (nonatomic, strong) UITableView *tableView;


@end

@implementation RecodesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
#pragma mark
    self.title = @"作业";
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"书写"] style:UIBarButtonItemStylePlain target:self action:@selector(sendAction)];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.hidesBottomBarWhenPushed = YES;
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 250 * H;

}
- (void)getNumber:(int)number {
    DetailRecodesViewController *detail = [[DetailRecodesViewController alloc] init];
    detail.numberButton = number;
    detail.wide = YES;
    [self.navigationController pushViewController:detail animated:YES];
}
- (void)pushToGroup:(NSString *)group {
    GroupInformationViewController *Group = [[GroupInformationViewController alloc] init];
    [self.navigationController pushViewController:Group animated:YES];
}
- (void)pushToDetail:(NSString *)name {
    DetailOtherNotificationViewController *detail = [[DetailOtherNotificationViewController alloc] init];
    [self.navigationController pushViewController:detail animated:YES];
}
- (void)pushToOtherGroup:(NSString *)Group {
    GroupInformationViewController *group = [[GroupInformationViewController alloc] init];
    [self.navigationController pushViewController:group animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        OtherPeopleSendWorkTableViewCell *cell = [OtherPeopleSendWorkTableViewCell tableViewCell:tableView];
        cell.delegate = self;
        cell.groupDelegate = self;
        return cell;
    } else {
    RecodesTableViewCell *cell = [RecodesTableViewCell RecodesTableViewCell:tableView];
    cell.delegate = self;
    cell.groupDelegate = self;
    return cell;
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailRecodesViewController *detail = [[DetailRecodesViewController alloc] init];
    detail.numberButton = 2;
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)sendAction {
    HomeworkViewController *send = [[HomeworkViewController alloc] init];
    [self.navigationController pushViewController:send animated:YES];
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
