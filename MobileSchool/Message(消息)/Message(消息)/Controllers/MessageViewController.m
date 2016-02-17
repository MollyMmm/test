//
//  MessageViewController.m
//  MobileSchool
//
//  Created by 李公博 on 16/1/25.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageTableViewCell.h"
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
//    cell.detailTextLabel.textColor = [UIColor grayColor];
    cell.timeLbl.text = timeStr;

//    UILabel* timeLbl = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth-78, 4, 70,21)];
//    timeLbl.font = [UIFont systemFontOfSize:12.f];
//    timeLbl.textColor = [UIColor grayColor];
//    
//    NSString* imgStr = [[_dataArr objectAtIndex:indexPath.row] objectAtIndex:0];
//    NSString* textStr = [[_dataArr objectAtIndex:indexPath.row] objectAtIndex:1];
//    NSString* detailTextStr = [[_dataArr objectAtIndex:indexPath.row] objectAtIndex:2];
//    NSString* timeStr = [[_dataArr objectAtIndex:indexPath.row] objectAtIndex:3];
//    [cell.imageView setImage:[UIImage imageNamed:imgStr]];
//    cell.textLabel.text = textStr;
//    cell.detailTextLabel.text = detailTextStr;
//    cell.detailTextLabel.textColor = [UIColor grayColor];
//    timeLbl.text = timeStr;
//    [cell addSubview:timeLbl];

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.f;
}
@end
