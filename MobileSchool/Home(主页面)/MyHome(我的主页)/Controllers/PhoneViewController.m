//
//  PhoneViewController.m
//  MobileSchool
//
//  Created by Apple on 16/2/4.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "PhoneViewController.h"

@interface PhoneViewController ()<UITextFieldDelegate>

@end

@implementation PhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;
    self.view.backgroundColor = [UIColor grayColor];
    self.title = @"换绑手机";
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10 * W, 40 * H + 64, kScreenWidth - 20 * W, 40 * H)];
    [self.view addSubview:textField];
    textField.backgroundColor = [UIColor whiteColor];
    textField.clearButtonMode = UITextFieldViewModeAlways;
    textField.delegate = self;
    textField.userInteractionEnabled = YES;
    textField.placeholder = @"请输入当前帐号的密码";
    
    UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [sureButton setTitle:@"下一步" forState:UIControlStateNormal];
    [sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sureButton.titleLabel.font = [UIFont systemFontOfSize:20 * H];
    sureButton.backgroundColor = [UIColor orangeColor];
    sureButton.frame = CGRectMake(10 * W, 174 * H, kScreenWidth - 20 * W, 40 * H);
    [self.view addSubview:sureButton];
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
