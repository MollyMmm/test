//
//  MessageViewController.m
//  MobileSchool
//
//  Created by 李公博 on 16/1/25.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageTableViewCell.h"

#import "AddChatViewController.h"
#import "ChatViewController.h"
#import "NavigationViewController.h"
@interface MessageViewController ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray* dataArr;
@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    _dataArr = @[@[@"myFan",@"提醒",@"大栗子已经同意您的邀请",@"01-30 16:50"],@[@"myGroup",@"我们都是一家人",@"22",@"01-30 16:49"],@[@"myFan",@"大栗子",@"[哈哈]",@""],@[@"myGroup",@"大栗子",@"嘻嘻",@"01-30 12:00"]];
    
    UISearchBar* mSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
    [mSearchBar setPlaceholder:@"搜索"];
    [mSearchBar setBackgroundColor:[UIColor clearColor]];
    mSearchBar.delegate = self;
    UIView* searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
    [searchView addSubview:mSearchBar];
    _tableView.tableHeaderView = searchView;
    
    [_tableView setSeparatorInset:UIEdgeInsetsZero];
    _tableView.tableFooterView = [[UIView alloc] init];
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"qunhome_createChat_hl"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(pressAddChatBtn:)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataArr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* cellIdentifier = @"cell";

//    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
//    }
    MessageTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MessageTableViewCell" owner:nil options:nil] lastObject];
    }

    NSString* imgStr = [[_dataArr objectAtIndex:indexPath.row] objectAtIndex:0];
    NSString* textStr = [[_dataArr objectAtIndex:indexPath.row] objectAtIndex:1];
    NSString* detailTextStr = [[_dataArr objectAtIndex:indexPath.row] objectAtIndex:2];
    NSString* timeStr = [[_dataArr objectAtIndex:indexPath.row] objectAtIndex:3];
    [cell.imgView setImage:[UIImage imageNamed:imgStr]];
    cell.textLbl.text = textStr;
    cell.detailTextLbl.text = detailTextStr;
    cell.timeLbl.text = timeStr;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    ChatViewController *chatController = [[ChatViewController alloc] init];
    NavigationViewController *nav = [[NavigationViewController alloc] initWithRootViewController:chatController];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}
#pragma mark - public
- (void)pressAddChatBtn:(id)sender{
    
    AddChatViewController *addVC = [[AddChatViewController alloc] init];
    NavigationViewController *nav = [[NavigationViewController alloc] initWithRootViewController:addVC];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}
@end
