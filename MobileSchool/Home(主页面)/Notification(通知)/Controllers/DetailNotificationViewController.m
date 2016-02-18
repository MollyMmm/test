//
//  DetailNotificationViewController.m
//  MobileSchool
//
//  Created by Apple on 16/2/3.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "DetailNotificationViewController.h"
#import "NotReadTableViewCell.h"

@interface DetailNotificationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *notReadTableView;

@property (nonatomic, strong) UIImageView *peopleImageView;
@property (nonatomic, strong) UILabel *peopleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *fromLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *whoCanSeeLabel;
@property (nonatomic, strong) UIButton *haveReadedButton;
@property (nonatomic, strong) UIButton *notReadButton;

@end

@implementation DetailNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
#pragma mark
    self.title = @"通知详情";
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;
#pragma mark 头视图
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 180 * H)];
    [self.view addSubview:backView];
    backView.backgroundColor = [UIColor whiteColor];
    
    _peopleImageView = [[UIImageView alloc] init];
    [backView addSubview:_peopleImageView];
    _peopleLabel = [[UILabel alloc] init];
    [backView addSubview:_peopleLabel];
    _timeLabel = [[UILabel alloc] init];
    [backView addSubview:_timeLabel];
    _fromLabel = [[UILabel alloc] init];
    [backView addSubview:_fromLabel];
    _contentLabel = [[UILabel alloc] init];
    [backView addSubview:_contentLabel];
    _whoCanSeeLabel = [[UILabel alloc] init];
    [backView addSubview:_whoCanSeeLabel];
    _whoCanSeeLabel.text = @"◎全员可见";
    _whoCanSeeLabel.textColor = [UIColor grayColor];
    [backView addSubview:_whoCanSeeLabel];
    
    
    _peopleImageView.frame = CGRectMake(10 * W, 10 * H, 50 * W, 50 * H);
    _peopleImageView.layer.cornerRadius = 25 * H;
    _peopleImageView.image = [UIImage imageNamed:@"头像"];
    _peopleImageView.backgroundColor = [UIColor orangeColor];
    _peopleImageView.layer.masksToBounds = YES;
    _peopleLabel.frame = CGRectMake(70 * W, 10 * H, 200 * W, 30 * H);
    _peopleLabel.text = @"尹直富";
    _fromLabel.frame = CGRectMake(70 * W, 30 * H, 200 * W, 30 * H);
    _fromLabel.text = @"发表于开心乐园";
    _fromLabel.textColor = [UIColor redColor];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_fromLabel.text];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 3)];
    _fromLabel.font = [UIFont systemFontOfSize:15 * H];
    _fromLabel.attributedText = attributedString;
    _contentLabel.frame = CGRectMake(10 * W, 80 * H, kScreenWidth - 20 * W, 100 * H);
    _contentLabel.text = @"反对是非得失个地方不符合德国的方法";
    _whoCanSeeLabel.frame = CGRectMake(10 * W, 150 * H, kScreenWidth, 40 * H);
    
    UILabel *commentLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth * 2 / 4, 200 * H, 1 * W, 20 * H)];
    [backView addSubview:commentLineLabel];
    _timeLabel.frame = CGRectMake(kScreenWidth * 3 / 4, 10 * H, 200 * W, 30 * H);
    _timeLabel.text = @"昨天20:01";
    _timeLabel.font = [UIFont systemFontOfSize:15 * H];
    _timeLabel.textColor = [UIColor grayColor];
    

#pragma mark
    _notReadTableView = [[UITableView alloc] init];
    [self.view addSubview:_notReadTableView];
    _notReadTableView.delegate = self;
    _notReadTableView.dataSource = self;
    _notReadTableView.rowHeight = 60 * H;
    _notReadTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _notReadTableView.tableHeaderView = backView;
    _notReadTableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 49);
    
    if (_wide) {
        [_notReadTableView setContentOffset:CGPointMake(0, 180 * H) animated:YES];
    }
    
    UIButton *copyButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [copyButton setTitle:@"复制内容" forState:UIControlStateNormal];
    [self.view addSubview:copyButton];
    copyButton.frame = CGRectMake(0, kScreenHeight - 49, kScreenWidth, 49);
    copyButton.backgroundColor = [UIColor grayColor];
    [copyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"测试";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50 * H;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    
    _haveReadedButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_haveReadedButton setTitle:@"已读2" forState:UIControlStateNormal];
    [_haveReadedButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    if (_YESORNO) {
        [_haveReadedButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [_haveReadedButton addTarget:self action:@selector(haveReadedAction) forControlEvents:UIControlEventTouchUpInside];
    _haveReadedButton.frame = CGRectMake(0, 0 * H, kScreenWidth / 4, 40 * H);
    [headerView addSubview:_haveReadedButton];
    
    _notReadButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_notReadButton setTitle:@"未读2" forState:UIControlStateNormal];
    [_notReadButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    if (_YESORNO) {
        [_notReadButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    [_notReadButton addTarget:self action:@selector(notReadAction) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:_notReadButton];
    _notReadButton.frame = CGRectMake(kScreenWidth / 4, 0 * H, kScreenWidth / 4, 40 * H);
    
    UILabel *passLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth / 4, 10 * H, 1 * W, 20 * H)];
    [headerView addSubview:passLineLabel];
    passLineLabel.backgroundColor = [UIColor grayColor];
    
    UILabel *grayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40 * H, kScreenWidth, 10 * H)];
    grayLabel.backgroundColor = [UIColor grayColor];
    [headerView addSubview:grayLabel];
    
    headerView.backgroundColor = [UIColor whiteColor];

    return headerView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuse = @"reuse";
    NotReadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[NotReadTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuse];
    };
    if (!_YESORNO) {
        cell.nameLabel.text = @"未读";
    }
    if (_YESORNO) {
        cell.nameLabel.text = @"已读";
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
- (void)haveReadedAction {
    NSLog(@"已读");
    [_notReadButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_haveReadedButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    _YESORNO = YES;
    [_notReadTableView reloadData];
    
}
- (void)notReadAction {
    NSLog(@"未读");
    [_notReadButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_haveReadedButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _YESORNO = NO;
    [_notReadTableView reloadData];
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
