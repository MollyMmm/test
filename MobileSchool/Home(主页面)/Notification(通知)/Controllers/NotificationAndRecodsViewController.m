//
//  NotificationAndRecodsViewController.m
//  MobileSchool
//
//  Created by Apple on 16/1/28.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "NotificationAndRecodsViewController.h"
#import "SendInfomationViewController.h"
#import "NotificationTableViewCell.h"
#import "OtherPeopleNotificationTableViewCell.h"
#import "DetailNotificationViewController.h"
#import "DetailInformationViewController.h"
#import "GroupInformationViewController.h"
#import "DetailOtherNotificationViewController.h"


@interface NotificationAndRecodsViewController ()<UITableViewDataSource,UITableViewDelegate,notificationDelegate,OtherPeopleDetailInformationDelegate,ToGroupDelegate,MyselfToGroupDelegate>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation NotificationAndRecodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
#pragma mark
    self.title = @"通知";
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"书写"] style:UIBarButtonItemStylePlain target:self action:@selector(sendAction)];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.hidesBottomBarWhenPushed = YES;
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight + 49)];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
- (void)readOrNot:(int)sender {
    DetailNotificationViewController *detail = [[DetailNotificationViewController alloc] init];
    detail.YESORNO = sender;
    detail.wide = YES;

    [self.navigationController pushViewController:detail animated:YES];
}
- (void)pushToDetail:(NSString *)name {
    DetailInformationViewController *detail = [[DetailInformationViewController alloc] init];
    [self.navigationController pushViewController:detail animated:YES];
}
- (void)pushToGroup:(NSString *)group {
    GroupInformationViewController *toGroup = [[GroupInformationViewController alloc] init];
    [self.navigationController pushViewController:toGroup animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 200 *  H;
    } else {
        return 250 * H;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        OtherPeopleNotificationTableViewCell *cell = [OtherPeopleNotificationTableViewCell otherPeopleNotificationTableViewCell:tableView];
        cell.delegate = self;
        cell.groupDelegate = self;
        return cell;
    } else {
    NotificationTableViewCell *cell = [NotificationTableViewCell notificationTableViewCell:tableView];
    cell.Delegate = self;
        cell.MyselfDelegate = self;
    return cell;
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        DetailOtherNotificationViewController *detail = [[DetailOtherNotificationViewController alloc] init];
        [self.navigationController pushViewController:detail animated:YES];
    } else {
    DetailNotificationViewController *detail = [[DetailNotificationViewController alloc] init];
    detail.YESORNO = NO;
    [self.navigationController pushViewController:detail animated:YES];
    }
}
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)sendAction {
    SendInfomationViewController *send = [[SendInfomationViewController alloc] init];
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
