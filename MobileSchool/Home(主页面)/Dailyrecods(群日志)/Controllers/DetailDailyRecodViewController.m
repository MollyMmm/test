//
//  DetailDailyRecodViewController.m
//  MobileSchool
//
//  Created by Apple on 16/2/2.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "DetailDailyRecodViewController.h"
#import "RelayTableViewCell.h"
#import "CommentTableViewCell.h"
#import "ReadTableViewCell.h"
#import "SupportTableViewCell.h"
#import "HeaderDailyRecodView.h"

@interface DetailDailyRecodViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *contentArr;

@property (nonatomic, strong) UIButton *passButton;
@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UIButton *readButton;
@property (nonatomic, strong) UIButton *supportButton;


@end

@implementation DetailDailyRecodViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _contentArr = [NSMutableArray arrayWithObjects:@"", nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"日志详情";
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;

    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 250 * H;
    
    HeaderDailyRecodView *headerView = [[HeaderDailyRecodView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 180 * H)];
    _tableView.tableHeaderView = headerView;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if (_wide) {
        [_tableView setContentOffset:CGPointMake(0, 180 * H) animated:YES];
    }
    
    self.tabBarController.tabBar.hidden = YES;
#pragma mark 功能
    UIView *functionView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 49, kScreenWidth, 49)];
    [self.view addSubview:functionView];
    functionView.backgroundColor = [UIColor grayColor];
    
    UIImageView *relayImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20 * W, 10 * H, 30 * W, 30 * H)];
    relayImageView.image = [UIImage imageNamed:@"转发"];
    [functionView addSubview:relayImageView];
    
    UIImageView *commentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth / 5 + 20 * W, 10 * H, 30 * W, 30 * H)];
    commentImageView.image = [UIImage imageNamed:@"评论"];
    [functionView addSubview:commentImageView];
    
    UIImageView *collectImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth * 2 / 5 + 20 * W, 10 * H, 30 * W, 30 * H)];
    collectImageView.image = [UIImage imageNamed:@"未收藏"];
    [functionView addSubview:collectImageView];
    
    UIImageView *supportImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth * 3 / 5 + 20 * W, 10 * H, 30 * W, 30 * H)];
    supportImageView.image = [UIImage imageNamed:@"未赞"];
    [functionView addSubview:supportImageView];

    UIImageView *moreImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth * 4 / 5 + 20 * W, 10 * H, 30 * W, 30 * H)];
    moreImageView.image = [UIImage imageNamed:@"更多"];
    [functionView addSubview:moreImageView];


}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_numberButton == 1) {
        return 80 * H;
    } else if (_numberButton == 2) {
        return 120 * H;
    } else if (_numberButton == 3) {
        return kScreenHeight;
    } else {
        return kScreenHeight;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_numberButton == 3 || _numberButton == 4) {
        return 1;
    }
    
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50 * H;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor whiteColor];
    headerView.userInteractionEnabled = YES;
    
    _passButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_passButton setTitle:@"转发1" forState:UIControlStateNormal];
    if (_numberButton == 1) {
        [_passButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    } else {
        [_passButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    [_passButton addTarget:self action:@selector(passAction) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:_passButton];
    
    _commentButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_commentButton setTitle:@"评论2" forState:UIControlStateNormal];
    if (_numberButton == 2) {
        [_commentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    } else {
        [_commentButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    [_commentButton addTarget:self action:@selector(commentAction) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:_commentButton];
    
    _supportButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_supportButton setTitle:@"赞3" forState:UIControlStateNormal];
    if (_numberButton == 4) {
        [_supportButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    } else {
        [_supportButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    [_supportButton addTarget:self action:@selector(supportAction) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:_supportButton];
    
    _readButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_readButton setTitle:@"阅读2" forState:UIControlStateNormal];
    if (_numberButton == 3) {
        [_readButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    } else {
        [_readButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    [_readButton addTarget:self action:@selector(readAction) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:_readButton];
    
    _passButton.frame = CGRectMake(0, 0 * H, kScreenWidth / 4, 40 * H);
    UILabel *passLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth / 4, 10 * H, 1 * W, 20 * H)];
    [headerView addSubview:passLineLabel];
    passLineLabel.backgroundColor = [UIColor grayColor];
    _commentButton.frame = CGRectMake(kScreenWidth / 4, 0 * H, kScreenWidth / 4, 40 * H);
    UILabel *commentLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth * 2 / 4, 10 * H, 1 * W, 20 * H)];
    [headerView addSubview:commentLineLabel];
    commentLineLabel.backgroundColor = [UIColor grayColor];
    _supportButton.frame = CGRectMake(kScreenWidth * 3 / 4, 0 * H, kScreenWidth / 4, 40 * H);
    UILabel *supportLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth * 3 / 4, 10 * H, 1 * W, 20 * H)];
    [headerView addSubview:supportLineLabel];
    supportLineLabel.backgroundColor = [UIColor grayColor];
    _readButton.frame = CGRectMake(kScreenWidth / 2, 0 * H, kScreenWidth / 4, 40 * H);
    
    
    UILabel *grayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40 * H, kScreenWidth, 10 * H)];
    grayLabel.backgroundColor = [UIColor grayColor];
    [headerView addSubview:grayLabel];
    
    
    return headerView;

}
- (void)passAction {
    
    [_commentButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_supportButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_readButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_passButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _numberButton = 1;
    [_tableView reloadData];
    
}
- (void)commentAction {
    
    [_commentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_supportButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_passButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_readButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _numberButton = 2;
    [_tableView reloadData];
}
- (void)supportAction {
    
    [_supportButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_commentButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_passButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_readButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _numberButton = 4;
    
    [_tableView reloadData];
    
}
- (void)readAction {
    [_commentButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_passButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_supportButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_readButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _numberButton = 3;
    [_tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_numberButton == 1) {
        RelayTableViewCell *cell = [RelayTableViewCell tableViewCell:tableView];
        return cell;

    } else if (_numberButton == 2) {
        CommentTableViewCell *cell = [CommentTableViewCell commentTableViewCell:tableView];
        return cell;
    } else if (_numberButton == 3) {
        ReadTableViewCell *cell = [ReadTableViewCell tableViewCell:tableView];
        return cell;
    } else {
        SupportTableViewCell *cell = [SupportTableViewCell tableViewCell:tableView];
        return cell;

    }
   
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
