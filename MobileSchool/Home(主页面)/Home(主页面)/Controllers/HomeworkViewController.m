//
//  HomeworkViewController.m
//  MobileSchool
//
//  Created by Apple on 16/1/29.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "HomeworkViewController.h"
#import "ReceivePeopleViewController.h"
#import "SendTableViewCell.h"



@interface HomeworkViewController ()<UITextViewDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *titleArr;
@property (nonatomic, strong) UITextView *placeholdView;
@property (nonatomic, assign) BOOL openORclose;
@property (nonatomic, strong) UITableView *openTableView;
@property (nonatomic, strong) NSMutableArray *openArr;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIView *secondBackView;
@property (nonatomic, strong) UIView *buttonBackView;
@property (nonatomic, strong) UIView *textFieldBackView;
@property (nonatomic, strong) NSString *subject;
@property (nonatomic, strong) UIButton *sureButton;
@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, assign) BOOL editor;
@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) NSString *timeString;
@property (nonatomic, strong) UILabel *timeLabel;



@end

@implementation HomeworkViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _titleArr = [NSMutableArray arrayWithObjects:@"发表到:",@"科目：",@"提交时间：", nil];
        _openArr = [NSMutableArray arrayWithObjects:@"语文",@"数学",@"英语",@"", nil];
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
#pragma mark
    self.title = @"留作业";
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(sendAction)];
    item.tintColor = [UIColor grayColor];
    self.navigationItem.rightBarButtonItem = item;
    self.view.backgroundColor = [UIColor grayColor];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(backReturnAction)];
    self.navigationItem.leftBarButtonItem = backItem;

#pragma mark
    UIView *holdView = [[UIView alloc] initWithFrame:CGRectMake(10 * W, 70 * H, kScreenWidth - 20 * W, kScreenHeight  - 64 - 15 * H)];
    holdView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:holdView];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10 * W, 70 * H, kScreenWidth - 20 * W, 140 * H)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
#pragma mark
    _openORclose = NO;
    _openTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    _openTableView.delegate = self;
    _openTableView.dataSource = self;
    [self.view addSubview:_openTableView];
#pragma mark
    UISwitch *switchButton = [[UISwitch alloc] initWithFrame:CGRectMake(290 * W, 140 * H, 150 * W, 40 * H)];
    UILabel *YESorNOLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * W, 140 * H, 150 * W, 40 * H)];
    YESorNOLabel.text = @"要求线上交作业：";
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 180 * H, 400 * W, 1 * H)];
    lineLabel.backgroundColor = [UIColor grayColor];
    [holdView addSubview:lineLabel];
    [holdView addSubview:switchButton];
    [holdView addSubview:YESorNOLabel];
    
#pragma mark
    _placeholdView = [[UITextView alloc] initWithFrame:CGRectMake(10 * W, 190 * H, holdView.frame.size.width - 20 * W, 200 * H)];
    [holdView addSubview:_placeholdView];
    _placeholdView.text = @"说点什么吧。。。。。。";
    _placeholdView.font = [UIFont systemFontOfSize:15 * H];
    _placeholdView.textColor = [UIColor grayColor];
    _placeholdView.editable = NO;
    
    UITextView *messageView = [[UITextView alloc] initWithFrame:CGRectMake(10 * W, 190 * H, holdView.frame.size.width - 20 * W, 200 * H)];
    [holdView addSubview:messageView];
    messageView.layer.borderWidth = 1 * H;
    messageView.backgroundColor = [UIColor clearColor];
    messageView.layer.borderColor = [UIColor grayColor].CGColor;
    messageView.delegate = self;
    messageView.font = [UIFont systemFontOfSize:15 * H];
#pragma mark
    UITapGestureRecognizer *timeChange = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(notimesureAction)];
    timeChange.numberOfTapsRequired = 1;
    _backView = [[UIView alloc] initWithFrame:self.view.frame];
    _backView.backgroundColor = [UIColor grayColor];
    _backView.alpha = 0.5;
    [_backView addGestureRecognizer:timeChange];
    _secondBackView = [[UIView alloc] initWithFrame:CGRectMake(20 * W, 200 * H, kScreenWidth - 40 * W, 300 * H)];
    _secondBackView.backgroundColor = [UIColor whiteColor];
    _secondBackView.layer.cornerRadius = 10 * H;
    _secondBackView.layer.masksToBounds = YES;
    
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * W, 20 * H, 250 * W, 40 * H)];
    _timeLabel.text = @"设置提交时间";
    _timeLabel.font = [UIFont systemFontOfSize:20 * H];
    [_secondBackView addSubview:_timeLabel];
    _timeLabel.backgroundColor = [UIColor whiteColor];
    
    _sureButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _sureButton.frame = CGRectMake(250 * W, 20 * H, 70 * W, 40 * H);
    _sureButton.backgroundColor = [UIColor orangeColor];
    [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
    _sureButton.layer.cornerRadius = 10 * H;
    _sureButton.layer.masksToBounds = YES;
    [_sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_sureButton addTarget:self action:@selector(timesureAction) forControlEvents:UIControlEventTouchUpInside];
    [_secondBackView addSubview:_sureButton];

    _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 60 * H, _secondBackView.frame.size.width, 200 * H)];
    _datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    _datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    NSData *pickerDate = [_datePicker date];
    NSDateFormatter *pickerFormatter = [[NSDateFormatter alloc] init];
    [pickerFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    [_secondBackView addSubview:_datePicker];
    NSString *dateString = [pickerFormatter stringFromDate:pickerDate];
    _timeString = dateString;
    [_datePicker addTarget:self action:@selector(dateChanged) forControlEvents:UIControlEventValueChanged];
    NSString *timeString = [NSString stringWithFormat:@"提交时间：%@",_timeString];
    [_titleArr replaceObjectAtIndex:2 withObject:timeString];


    
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

- (void)notimesureAction {
    [_backView removeFromSuperview];
    [_secondBackView removeFromSuperview];
}
- (void)timesureAction {
    [_backView removeFromSuperview];
    [_secondBackView removeFromSuperview];
    NSString *timeString = [NSString stringWithFormat:@"提交时间：%@",_timeString];
    [_titleArr replaceObjectAtIndex:2 withObject:timeString];
    [_tableView reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == _tableView) {
        return _titleArr.count;

    } else {
    return _openArr.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuse = @"reuse";
    SendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[SendTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
   
    if (tableView == _tableView) {
         cell.commentLabel.text = _titleArr[indexPath.row];
        if (indexPath.row == 0) {
            cell.commentLabel.textColor = [UIColor blueColor];
            cell.photoImageView.image = [UIImage imageNamed:@"iconfont-tianjia-2"];
        }
        if (indexPath.row == 1 || indexPath.row == 2) {
            cell.photoImageView.image = [UIImage imageNamed:@"iconfont-xiangyou01"];
            
        }

    } else {
        if (indexPath.row < _openArr.count - 1) {
            cell.commentLabel.text = _openArr[indexPath.row];
        } else {
            _addButton = [UIButton buttonWithType:UIButtonTypeSystem];
            [_addButton setTitle:@"＋科目" forState:UIControlStateNormal];
            [_addButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            [_addButton addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchUpInside];
            _addButton.frame = CGRectMake(0, 0, kScreenWidth - 20, 40);
            [cell.contentView addSubview:_addButton];
        }
    }
       return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _tableView) {
        if (indexPath.row == 0) {
            ReceivePeopleViewController *receive = [[ReceivePeopleViewController alloc] init];
            [self.navigationController pushViewController:receive animated:YES];
            
        }
        if (indexPath.row == 1) {
            if (!_openORclose) {
                _openTableView.frame = CGRectMake(10, 150, kScreenWidth - 20, kScreenHeight);
            } else {
                _openTableView.frame = CGRectMake(0, 0, 0, 0);
            }
            _openORclose = !_openORclose;
        }
        if (indexPath.row == 2) {
             [self.view addSubview:_backView];
            [self.view addSubview:_secondBackView];
            }

    }
    if (tableView == _openTableView) {
        if (indexPath.row != _openArr.count - 1) {
            
            NSString *subject = [NSString stringWithFormat:@"科目：%@",_openArr[indexPath.row]];
            [_titleArr replaceObjectAtIndex:1 withObject:subject];
            [_tableView reloadData];
        }
    }
}
- (void)dateChanged {
    NSData *pickerDate = [_datePicker date];
    NSDateFormatter *pickerFormatter = [[NSDateFormatter alloc] init];
    [pickerFormatter setDateFormat:@"yyyy-MM-dd  HH:mm"];
    NSString *dateString = [pickerFormatter stringFromDate:pickerDate];
    _timeString = dateString;

}
- (void)addAction {
    UITapGestureRecognizer *timeChange = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backAction)];
    timeChange.numberOfTapsRequired = 1;
    _backView = [[UIView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_backView];
    _backView.backgroundColor = [UIColor grayColor];
    _backView.alpha = 0.5;
    [_backView addGestureRecognizer:timeChange];
    
    _textFieldBackView = [[UIView alloc] initWithFrame:CGRectMake(40 * W, 220 * H, 210 * W, 50 * H)];
    [self.view addSubview:_textFieldBackView];
    _textFieldBackView.backgroundColor = [UIColor orangeColor];
    UITextField *timeLabel = [[UITextField alloc] initWithFrame:CGRectMake(5 * W, 5 * H, 200 * W, 40 * H)];
    timeLabel.font = [UIFont systemFontOfSize:20 * H];
    [_textFieldBackView addSubview:timeLabel];
    timeLabel.placeholder = @"请输入";
    timeLabel.backgroundColor = [UIColor whiteColor];
    timeLabel.delegate = self;
    
    
    _buttonBackView = [[UIView alloc] initWithFrame:CGRectMake(260 * W, 220 * H, 70 * W, 40 * H)];
    [self.view addSubview:_buttonBackView];
    _buttonBackView.backgroundColor = [UIColor orangeColor];
    _sureButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _sureButton.frame = CGRectMake(0 * W, 0 * H, 70 * W, 40 * H);
    _sureButton.backgroundColor = [UIColor orangeColor];
    [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
    _sureButton.layer.cornerRadius = 10 * H;
    _sureButton.layer.masksToBounds = YES;
    [_sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_sureButton addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
    [_buttonBackView addSubview:_sureButton];

}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    _subject = textField.text;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    _editor = YES;
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return NO;
}
- (void)sureAction {
    if (_editor) {
        [_backView removeFromSuperview];
        [_buttonBackView removeFromSuperview];
        [_textFieldBackView removeFromSuperview];
        [_addButton removeFromSuperview];
        NSString *subject = [NSString stringWithFormat:@"科目：%@",_subject];
        [_openArr insertObject:_subject atIndex:0];
        [_titleArr replaceObjectAtIndex:1 withObject:subject];
        _editor = !_editor;
        [_tableView reloadData];
        [_openTableView reloadData];
    }
}
- (void)backReturnAction {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)backAction {
    [_backView removeFromSuperview];
    [_buttonBackView removeFromSuperview];
    [_textFieldBackView removeFromSuperview];
}
- (void)sendAction {
    
}
- (void)changeTimeAction {
    NSLog(@"呵呵");
    
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
