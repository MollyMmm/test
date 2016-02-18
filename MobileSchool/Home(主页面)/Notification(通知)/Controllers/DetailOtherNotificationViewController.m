//
//  DetailOtherNotificationViewController.m
//  MobileSchool
//
//  Created by Apple on 16/2/18.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "DetailOtherNotificationViewController.h"
#import "GroupInformationViewController.h"
#import "DetailInformationViewController.h"

@interface DetailOtherNotificationViewController ()

@property (nonatomic, strong) UIImageView *peopleImageView;
@property (nonatomic, strong) UILabel *peopleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *fromLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *whoCanSeeLabel;

@end

@implementation DetailOtherNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    _peopleImageView = [[UIImageView alloc] init];
    [self.view addSubview:_peopleImageView];
    _peopleImageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OtherPeopleDetailAction)];
    
    [_peopleImageView addGestureRecognizer:ges];
    
    _peopleLabel = [[UILabel alloc] init];
    [self.view addSubview:_peopleLabel];
    _timeLabel = [[UILabel alloc] init];
    [self.view addSubview:_timeLabel];
    _fromLabel = [[UILabel alloc] init];
    [self.view addSubview:_fromLabel];
    _fromLabel.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ToGroupAction)];
    [_fromLabel addGestureRecognizer:tap];
    _contentLabel = [[UILabel alloc] init];
    [self.view addSubview:_contentLabel];
    _whoCanSeeLabel = [[UILabel alloc] init];
    [self.view addSubview:_whoCanSeeLabel];
    _whoCanSeeLabel.text = @"◎全员可见";
    _whoCanSeeLabel.textColor = [UIColor grayColor];
    [self.view addSubview:_whoCanSeeLabel];
    
    _peopleImageView.frame = CGRectMake(10 * W, 10 * H + 64, 50 * W, 50 * H);
    _peopleImageView.layer.cornerRadius = 25 * H;
    _peopleImageView.image = [UIImage imageNamed:@"用户头像"];
    _peopleImageView.backgroundColor = [UIColor orangeColor];
    _peopleImageView.layer.masksToBounds = YES;
    _peopleLabel.frame = CGRectMake(70 * W, 10 * H + 64, 200 * W, 30 * H);
    _peopleLabel.text = @"某某某";
    _fromLabel.frame = CGRectMake(70 * W, 30 * H + 64, 200 * W, 30 * H);
    _fromLabel.text = @"发表于让梦起飞";
    _fromLabel.textColor = [UIColor redColor];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_fromLabel.text];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 3)];
    _fromLabel.font = [UIFont systemFontOfSize:15 * H];
    _fromLabel.attributedText = attributedString;
    _contentLabel.frame = CGRectMake(10 * W, 60 * H + 64, kScreenWidth - 20 * W, 100 * H);
    _contentLabel.text = @"测试：别人发表的通知";
    _whoCanSeeLabel.frame = CGRectMake(10 * W, 150 * H + 64, kScreenWidth, 40 * H);
    UILabel *commentLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth * 2 / 4, 200 * H + 64, 1 * W, 20 * H)];
    [self.view addSubview:commentLineLabel];
    _timeLabel.frame = CGRectMake(kScreenWidth * 3 / 4, 10 * H + 64, 200 * W, 30 * H);
    _timeLabel.text = @"昨天20:01";
    _timeLabel.font = [UIFont systemFontOfSize:15 * H];
    _timeLabel.textColor = [UIColor grayColor];
    
    UILabel *grayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 190 * H + 64, kScreenWidth, 10 * H)];
    grayLabel.backgroundColor = [UIColor grayColor];
    [self.view addSubview:grayLabel];
    
    UIButton *copyButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [copyButton setTitle:@"复制内容" forState:UIControlStateNormal];
    [self.view addSubview:copyButton];
    copyButton.frame = CGRectMake( kScreenWidth / 2, kScreenHeight - 49, kScreenWidth / 2, 49);
    copyButton.backgroundColor = [UIColor grayColor];
    [copyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton *answerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [answerButton setTitle:@"私密回复" forState:UIControlStateNormal];
    [self.view addSubview:answerButton];
    answerButton.frame = CGRectMake(0, kScreenHeight - 49,  kScreenWidth / 2, 49);
    answerButton.backgroundColor = [UIColor grayColor];
    [answerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];


}
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)ToGroupAction {
    GroupInformationViewController *group = [[GroupInformationViewController alloc] init];
    [self.navigationController pushViewController:group animated:YES];
}
- (void)OtherPeopleDetailAction {
    DetailInformationViewController *detail = [[DetailInformationViewController alloc] init];
    [self.navigationController pushViewController:detail animated:YES];
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
