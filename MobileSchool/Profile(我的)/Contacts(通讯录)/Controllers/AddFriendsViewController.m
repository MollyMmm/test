//
//  AddFriendsViewController.m
//  MobileSchool
//
//  Created by Apple on 16/2/25.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "AddFriendsViewController.h"
#import "AddFriendsTableViewCell.h"
#import "AddTableViewCell.h"


@interface AddFriendsViewController ()<UITableViewDataSource,UITableViewDelegate,CancelAddFriendsDelegate,SureAddFriendsDelegate>

@property (nonatomic, strong)NSMutableArray *allArr;
@property (nonatomic, strong)UITableView *tableView;


@end

@implementation AddFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"添加";
    _allArr = [NSMutableArray arrayWithObjects:@"通知",@"作业",@"成绩",@"群日志",@"提到我的",@"我的日志",@"通讯录",@"提醒",@"好友圈", nil];
    
#pragma mark 自定义返回按钮
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;
    self.view.backgroundColor = [UIColor yellowColor];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight + 49)];
    _tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 50 * H;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _allArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuse = @"reuse";
    AddFriendsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[AddFriendsTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuse];
    }
    cell.headerImageView.image = [UIImage imageNamed:@"主页面功能图标"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.selected = NO;
    cell.sureDelegate = self;
    cell.cancelDelegate = self;
    cell.titleLabel.text = _allArr[indexPath.row];
    
    return cell;
    
}
- (void)cancelAddFriends:(NSString *)name {
    NSLog(@"取消添加%@",name);
#pragma mark 屏幕下方弹出提示框
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"保存或删除数据" message:@"删除数据将不可恢复" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:nil];
    UIAlertAction *archiveAction = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:deleteAction];
    [alertController addAction:archiveAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)sureAddFriends:(NSString *)name {
    
#pragma mark 弹出提示框
    NSString *message = [NSString stringWithFormat:@"你要添加%@为好友",name];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [_allArr removeObject:name];
        [_tableView reloadData];
    }];
    [alert addAction:sureAction];
     [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
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
