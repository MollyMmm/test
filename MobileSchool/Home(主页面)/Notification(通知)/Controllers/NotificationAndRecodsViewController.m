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
#import "DetailNotificationViewController.h"


@interface NotificationAndRecodsViewController ()<UITableViewDataSource,UITableViewDelegate,notificationDelegate>
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
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 250 * H;
    
    
}
- (void)readOrNot:(int)sender {
    DetailNotificationViewController *detail = [[DetailNotificationViewController alloc] init];
    detail.YESORNO = sender;
    detail.wide = YES;

    [self.navigationController pushViewController:detail animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuse = @"reuse";
    NotificationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[NotificationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.Delegate = self;
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailNotificationViewController *detail = [[DetailNotificationViewController alloc] init];
    detail.YESORNO = NO;
    [self.navigationController pushViewController:detail animated:YES];
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
