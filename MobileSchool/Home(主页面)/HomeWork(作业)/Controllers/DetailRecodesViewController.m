//
//  DetailRecodesViewController.m
//  MobileSchool
//
//  Created by Apple on 16/2/3.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "DetailRecodesViewController.h"
#import "NotReadTableViewCell.h"
#import "HeaderView.h"
#import "GroupInformationViewController.h"


@interface DetailRecodesViewController ()<UITableViewDelegate,UITableViewDataSource,ToGroupDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *passButton;
@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UIButton *readButton;
@property (nonatomic, strong) UIButton *supportButton;


@end

@implementation DetailRecodesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
#pragma mark
    self.title = @"作业详情";
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 60 * H;
    HeaderView *headerView = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 190 * H)];
    headerView.toGroupDelegate = self;
    _tableView.tableHeaderView = headerView;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    if (_wide) {
        [_tableView setContentOffset:CGPointMake(0, 190 * H) animated:YES];
    }

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50 * H;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor whiteColor];
    headerView.userInteractionEnabled = YES;
    
    _passButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_passButton setTitle:@"已签收1" forState:UIControlStateNormal];
    if (_numberButton == 1) {
            [_passButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    } else {
    [_passButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    [_passButton addTarget:self action:@selector(passAction) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:_passButton];
    
    _commentButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_commentButton setTitle:@"未签收2" forState:UIControlStateNormal];
    if (_numberButton == 2) {
            [_commentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    } else {
    [_commentButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    [_commentButton addTarget:self action:@selector(commentAction) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:_commentButton];
    
    _supportButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_supportButton setTitle:@"已提交2" forState:UIControlStateNormal];
    if (_numberButton == 4) {
        [_supportButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    } else {
    [_supportButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    [_supportButton addTarget:self action:@selector(supportAction) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:_supportButton];
    
    _readButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_readButton setTitle:@"未提交2" forState:UIControlStateNormal];
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
    static NSString *reuse = @"reuse";
    NotReadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[NotReadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.nameLabel.text = [NSString stringWithFormat:@"测试%d",_numberButton];
    return cell;
    
}
- (void)pushToGroup:(NSString *)groupName {
    GroupInformationViewController *group = [[GroupInformationViewController alloc] init];
    [self.navigationController pushViewController:group animated:YES];
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
