//
//  FriendsListViewController.m
//  MobileSchool
//
//  Created by Molly on 16/2/24.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "FriendsListViewController.h"

#import "GroupListViewController.h"
#import "NavigationViewController.h"

#import "UserModel.h"
#import "GetFriendListOperator.h"
#import "NetworkingManager.h"

#import "TokenIdTool.h"

@interface FriendsListViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) UISearchBar *mSearchBar;

@property (strong, nonatomic) NSArray *imgData;
@property (strong, nonatomic) NSArray *nameData;
@property (strong, nonatomic) NSArray *friendArr;

@end

@implementation FriendsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _imgData = [[NSArray alloc] init];
    _nameData = [[NSArray alloc] init];
    _imgData = @[@"myGroup",@"myGroup",@"myGroup",@"newFriend",@"newFriend",@"newFriend"];
    _nameData = @[@"小明",@"张三",@"李四",@"王五",@"赵六",@"郑七"];
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 110)];
    
    _mSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
    _mSearchBar.placeholder = @"搜索好友";
    _mSearchBar.backgroundColor = [UIColor clearColor];
    [headView addSubview:_mSearchBar];
    
    UIButton *headBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 44, kScreenWidth, 66)];
    [headBtn addTarget:self action:@selector(pressGroupBtn:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:headBtn];

    UIImageView *groupImgView = [[UIImageView alloc] initWithFrame:CGRectMake(16, 21, 25, 20)];
    [groupImgView setImage:[UIImage imageNamed:@"qunmemberaction"]];
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(57, 21, 200, 20)];
    lbl.text = @"我的群(0)";
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth - 28, 21, 20, 20)];
    [imgView setImage:[UIImage imageNamed:@"next"]];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, 1)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [headBtn addSubview:groupImgView];
    [headBtn addSubview:lbl];
    [headBtn addSubview:imgView];
    [headBtn addSubview:lineView];
    
    _tableView.tableHeaderView = headView;
    
    _tableView.separatorInset = UIEdgeInsetsZero;
    _tableView.tableFooterView = [[UIView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - uiTableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_nameData count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    UserModel *user = [_friendArr objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellStyleDefault;
    UIImage *img = [UIImage imageNamed:user.img];
    [cell.imageView setImage:img];
    cell.textLabel.text = user.name;
    
    return cell;
}
#pragma mark - public
- (void)pressGroupBtn:(id)sender{
    
    GroupListViewController *groupVC = [[GroupListViewController alloc] init];
    NavigationViewController *nav = [[NavigationViewController alloc] initWithRootViewController:groupVC];
    
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}
/**
 *  请求好友列表
 *  http://123.56.17.198:8180/ms/api/user_ser/friends?tokenid=081aeb639714e3f80161128bab5e8559
 */
//
- (void)requestFriendList{
    
    TokenIdTool *tool = [[TokenIdTool alloc] init];
    [tool requestTokenId];
    
    GetFriendListOperator *friendListOperator = [[GetFriendListOperator alloc] initWithParamsDic:@{@"tokenid":tool.tokenId}];
    NetworkingManager *manager = [NetworkingManager sharedInstance];
    
    [manager asyncTaskWithOperator:friendListOperator withSuccessCallBack:^(BaseModel *model) {
        
        _friendArr = [[NSArray alloc] init];
        _friendArr = friendListOperator.friendArr;
        
        [_tableView reloadData];
    } andFaildCallBack:^(id response) {
        
    }];
}

@end
