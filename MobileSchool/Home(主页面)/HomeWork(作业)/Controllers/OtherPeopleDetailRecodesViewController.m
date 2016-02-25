//
//  OtherPeopleDetailRecodesViewController.m
//  MobileSchool
//
//  Created by Apple on 16/2/24.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "OtherPeopleDetailRecodesViewController.h"
#import "DetailInformationViewController.h"
#import "GroupInformationViewController.h"

@interface OtherPeopleDetailRecodesViewController ()

@property (nonatomic, strong) UIImageView *peopleImageView;
@property (nonatomic, strong) UILabel *peopleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *fromLabel;

@property (nonatomic, strong) UILabel *homeWorkTimeLabel;
@property (nonatomic, strong) UILabel *subjectLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UILabel *passButton;

@property (nonatomic, strong) UIButton *signButton;


@property (nonatomic, strong) UILabel *whoCanSeeLabel;

@end

@implementation OtherPeopleDetailRecodesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    _peopleImageView = [[UIImageView alloc] init];
    [self.view addSubview:_peopleImageView];
    _peopleLabel = [[UILabel alloc] init];
    [self.view addSubview:_peopleLabel];
    _timeLabel = [[UILabel alloc] init];
    [self.view addSubview:_timeLabel];
    _fromLabel = [[UILabel alloc] init];
    [self.view addSubview:_fromLabel];
    _homeWorkTimeLabel = [[UILabel alloc] init];
    [self.view addSubview:_homeWorkTimeLabel];
    _subjectLabel = [[UILabel alloc] init];
    [self.view addSubview:_subjectLabel];
    _contentLabel = [[UILabel alloc] init];
    [self.view addSubview:_contentLabel];
    _whoCanSeeLabel = [[UILabel alloc] init];
    [self.view addSubview:_whoCanSeeLabel];
    _whoCanSeeLabel.text = @"◎全员可见";
    _whoCanSeeLabel.textColor = [UIColor grayColor];
    [self.view addSubview:_whoCanSeeLabel];
    
    _passButton = [[UILabel alloc] init];
    _passButton.text = @"不用线上提交";
    _passButton.font = [UIFont systemFontOfSize:17 * H];
    _passButton.textColor = [UIColor grayColor];
    [self.view addSubview:_passButton];
    
    _signButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_signButton setTitle:@"☑️未签收" forState:UIControlStateNormal];
    _signButton.tintColor = [UIColor redColor];
    [self.view addSubview:_signButton];
    [_signButton addTarget:self action:@selector(signAction) forControlEvents:UIControlEventTouchUpInside];

    _peopleImageView.frame = CGRectMake(10 * W, 10 * H + 64, 50 * W, 50 * H);
    _peopleImageView.layer.cornerRadius = 25 * H;
    _peopleImageView.image = [UIImage imageNamed:@"头像"];
    _peopleImageView.backgroundColor = [UIColor yellowColor ];
    _peopleImageView.layer.masksToBounds = YES;
    _peopleImageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapImage = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TODetailInformation)];
    [_peopleImageView addGestureRecognizer:tapImage];
    
    
    _peopleLabel.frame = CGRectMake(70 * W, 10 * H + 64, 200 * W, 30 * H);
    _peopleLabel.text = @"某某某";
    _fromLabel.frame = CGRectMake(70 * W, 30 * H + 64, 200 * W, 30 * H);
    _fromLabel.text = @"发表于天天向上";
    
    _signButton.frame = CGRectMake(kScreenWidth * 3 / 4, 190 * H + 64, 100 * W, 40 * H);
    
    _fromLabel.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ToGroupAction)];
    [_fromLabel addGestureRecognizer:tap];
    
    
    _fromLabel.textColor = [UIColor redColor];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_fromLabel.text];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 3)];
    _fromLabel.font = [UIFont systemFontOfSize:15 * H];
    _fromLabel.attributedText = attributedString;
    _homeWorkTimeLabel.frame = CGRectMake(10 * W, 70 * H + 64, 250 * W, 40 * H);
    _homeWorkTimeLabel.text = @"交作业时间：2016-02-04 08:00";
    _subjectLabel.frame = CGRectMake(kScreenWidth * 3 / 4, 70 * H + 64, 100 * W, 40 * H);
    _subjectLabel.text = @"乌龙";
    _contentLabel.frame = CGRectMake(10 * W, 70 * H + 64, kScreenWidth - 20 * W, 100 * H);
    _contentLabel.text = @"写一搜故事";
    _whoCanSeeLabel.frame = CGRectMake(10 * W, 150 * H + 64, kScreenWidth, 40 * H);
    _timeLabel.frame = CGRectMake(kScreenWidth * 3 / 4, 10 * H + 64, 200 * W, 30 * H);
    _timeLabel.text = @"昨天20:01";
    _timeLabel.font = [UIFont systemFontOfSize:15 * H];
    _timeLabel.textColor = [UIColor grayColor];
    
    _passButton.frame = CGRectMake(10 * W, 190 * H + 64, kScreenWidth / 3, 40 * H);
    
    UILabel *grayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 230 * H + 64, kScreenWidth, 10 * H)];
    grayLabel.backgroundColor = [UIColor grayColor];
    [self.view addSubview:grayLabel];
}
- (void)ToGroupAction {
    GroupInformationViewController *group = [[GroupInformationViewController alloc] init];
    [self.navigationController pushViewController:group animated:YES];
}
- (void)TODetailInformation {
    DetailInformationViewController *detail = [[DetailInformationViewController alloc] init];
    [self.navigationController pushViewController:detail animated:YES];
}
- (void)signAction  {
    [_signButton setTitle:@"☑️已签收" forState:UIControlStateNormal];
    _signButton.tintColor = [UIColor grayColor];
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
