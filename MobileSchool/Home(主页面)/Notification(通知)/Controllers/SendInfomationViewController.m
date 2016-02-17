//
//  SendInfomationViewController.m
//  MobileSchool
//
//  Created by Apple on 16/1/28.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "SendInfomationViewController.h"
#import "ReceivePeopleViewController.h"



@interface SendInfomationViewController ()<UITextViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
@property (nonatomic, strong)UILabel *sendMessageLabel;
@property (nonatomic, strong)UITextView *placeholdView;
@property (nonatomic, strong)UIPickerView *timePickerView;
@property (nonatomic, strong)NSMutableArray *timeArr;
@property (nonatomic, strong)UIView *backView;
@property (nonatomic, strong)UIView *secondBackView;

@end

@implementation SendInfomationViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _timeArr = [NSMutableArray arrayWithObjects:@"不发送短息",@"半小时后",@"1小时后",@"2小时后",@"3小时后",@"4小时后",@"5小时后",@"6小时后",@"7小时后",@"8小时后",@"9小时后",@"10小时后",@"11小时后",@"12小时后",@"13小时后",@"14小时后",@"15小时后",@"16小时后",@"17小时后",@"18小时后",@"19小时后",@"20小时后",@"21小时后",@"22小时后",@"23小时后" ,nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"发通知";
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(sendAction)];
    item.tintColor = [UIColor grayColor];
    self.navigationItem.rightBarButtonItem = item;
    self.view.backgroundColor = [UIColor grayColor];
#pragma mark
    UIView *holdView = [[UIView alloc] initWithFrame:CGRectMake(10 * W, 70 * H, kScreenWidth - 20 * W, kScreenHeight  - 64 - 15 * H)];
    holdView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:holdView];
    
#pragma mark
    UILabel *sendPeopleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * W, 0, 100 * W, 50 * H)];
    sendPeopleLabel.text = @"发表到:";
    sendPeopleLabel.textColor = [UIColor blueColor];
    UIButton *sendButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [sendButton setImage:[UIImage imageNamed:@"iconfont-tianjia-2"] forState:UIControlStateNormal];
    [sendButton addTarget:self action:@selector(sendPeopleAction) forControlEvents:UIControlEventTouchUpInside];
    sendButton.frame = CGRectMake(300 * W, 0, 50 * W, 50 * H);
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 45 * H, kScreenWidth - 20 * W, 1 * H)];
    lineLabel.backgroundColor = [UIColor grayColor];
    [holdView addSubview:lineLabel];
    [holdView addSubview:sendButton];
    [holdView addSubview:sendPeopleLabel];
#pragma mark
    
    _sendMessageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * W, 55 * H, kScreenWidth, 40 * H)];
    _sendMessageLabel.text = @"补发短信通知 : 不发送通知                        >";
    [holdView addSubview:_sendMessageLabel];
    _sendMessageLabel.textColor = [UIColor grayColor];;
    UILabel *messagelineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 95 * H, kScreenWidth - 20 * W, 1 * H)];
    messagelineLabel.backgroundColor = [UIColor grayColor];
    [holdView addSubview:messagelineLabel];
    UITapGestureRecognizer *timeChange = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeTimeAction)];
    timeChange.numberOfTapsRequired = 1;
    [_sendMessageLabel addGestureRecognizer:timeChange];
    _sendMessageLabel.userInteractionEnabled = YES;
    
#pragma mark
    _placeholdView = [[UITextView alloc] initWithFrame:CGRectMake(10 * W, 110 * H, holdView.frame.size.width - 20 * W, 200 * H)];
    [holdView addSubview:_placeholdView];
    _placeholdView.text = @"说点什么吧。。。。。。";
    _placeholdView.font = [UIFont systemFontOfSize:15 * H];
    _placeholdView.textColor = [UIColor grayColor];
    _placeholdView.editable = NO;
    
    UITextView *messageView = [[UITextView alloc] initWithFrame:CGRectMake(10 * W, 110 * H, holdView.frame.size.width - 20 * W, 200 * H)];
    [holdView addSubview:messageView];
    messageView.layer.borderWidth = 1 * H;
    messageView.backgroundColor = [UIColor clearColor];
    messageView.layer.borderColor = [UIColor grayColor].CGColor;
    messageView.delegate = self;
    messageView.font = [UIFont systemFontOfSize:15 * H];
   
    
}
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (![text isEqualToString:@""]) {
        _placeholdView.hidden = YES;
    }
    if ([text isEqualToString:@""] && range.location == 0 && range.length == 1) {
        _placeholdView.hidden = NO;
    }
    return YES;
}
- (void)sendAction {
    
}
- (void)sendPeopleAction {
    ReceivePeopleViewController *receive = [[ReceivePeopleViewController alloc] init];
    [self.navigationController pushViewController:receive animated:YES];
}
- (void)changeTimeAction {
#pragma mark
    UITapGestureRecognizer *timeChange = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sureAction)];
    timeChange.numberOfTapsRequired = 1;
    _sendMessageLabel.userInteractionEnabled = YES;
    _backView = [[UIView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_backView];
    _backView.backgroundColor = [UIColor grayColor];
    _backView.alpha = 0.5;
    [_backView addGestureRecognizer:timeChange];

    
    _secondBackView = [[UIView alloc] initWithFrame:CGRectMake(20 * W, 170 * H, kScreenWidth - 40 * W, 300 * H)];
    _secondBackView.backgroundColor = [UIColor whiteColor];
    _secondBackView.layer.cornerRadius = 10 * H;
    _secondBackView.layer.masksToBounds = YES;
    [self.view addSubview:_secondBackView];
    
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * W, 20 * H, 250 * W, 40 * H)];
    timeLabel.text = @"设置自动短信时间";
    timeLabel.font = [UIFont systemFontOfSize:20 * H];
    [_secondBackView addSubview:timeLabel];
    timeLabel.backgroundColor = [UIColor whiteColor];
    
    UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeSystem];
    sureButton.frame = CGRectMake(250 * W, 20 * H, 70 * W, 40 * H);
    sureButton.backgroundColor = [UIColor orangeColor];
    [sureButton setTitle:@"确定" forState:UIControlStateNormal];
    sureButton.layer.cornerRadius = 10 * H;
    sureButton.layer.masksToBounds = YES;
    [sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sureButton addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
    [_secondBackView addSubview:sureButton];

    _timePickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 70 * H, kScreenWidth - 40 * W, 200 * H)];
    _timePickerView.backgroundColor = [UIColor grayColor];
    _timePickerView.delegate = self;
    _timePickerView.dataSource = self;
    [_secondBackView addSubview:_timePickerView];
    
   
}
- (void)sureAction {
    [_backView removeFromSuperview];
    [_secondBackView removeFromSuperview];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _timeArr.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _timeArr[row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"%@",_timeArr[row]);
    _sendMessageLabel.text = [NSString stringWithFormat:@"补发短信通知 : %@                        ",_timeArr[row]];
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
