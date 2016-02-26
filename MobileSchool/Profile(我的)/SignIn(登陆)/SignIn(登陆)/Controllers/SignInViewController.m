//
//  SignInViewController.m
//  MobileSchool
//
//  Created by Molly on 16/2/23.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "SignInViewController.h"
#import "RegisterViewController.h"

#import "NetworkingManager.h"
#import "SignOperator.h"
#import "UserModel.h"

#import "NavigationViewController.h"
#import "FriendsListViewController.h"

#import "SearcheViewController.h"

@interface SignInViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTxtField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxtField;
@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //输入框中是否有个叉号，在什么时候显示，用于一次性删除输入框中的内容
    _usernameTxtField.clearButtonMode = UITextFieldViewModeAlways;
    _passwordTxtField.clearButtonMode = UITextFieldViewModeAlways;
    
    //是否纠错
    _usernameTxtField.autocorrectionType = UITextAutocorrectionTypeNo;
    _passwordTxtField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _usernameTxtField.placeholder = @"账号";
    _passwordTxtField.placeholder = @"密码";
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - public 

- (IBAction)pressSignInBtn:(UIButton *)sender {
    
    SignOperator *signOperator = [[SignOperator alloc] initWithParamsDic:@{@"username":_usernameTxtField.text,@"password":_passwordTxtField.text}];
    NetworkingManager *manager = [NetworkingManager sharedInstance];
    
    [manager asyncTaskWithOperator:signOperator withSuccessCallBack:^(BaseModel *model) {
        UserModel *userModel = [[UserModel alloc] init];
        userModel = signOperator.userModel;
        
        [[NSUserDefaults standardUserDefaults] setValue:userModel.username forKey:@"username"];
        [[NSUserDefaults standardUserDefaults] setValue:userModel.tokenid forKey:@"tokenid"];
        
        FriendsListViewController *friendVC = [[FriendsListViewController alloc] init];
        NavigationViewController *friendNav = [[NavigationViewController alloc] initWithRootViewController:friendVC];
        
        [self.navigationController presentViewController:friendNav animated:YES completion:nil];
    
        NSLog(@"正确");
    } andFaildCallBack:^(id response) {
        
    }];
    
    
}
- (IBAction)signIn:(id)sender {

    
}
- (IBAction)searchFriend:(id)sender {
    
    SearcheViewController *svc = [[SearcheViewController alloc]init];
    NavigationViewController *navc = [[NavigationViewController alloc]initWithRootViewController:svc];
    [self.navigationController presentViewController:navc animated:YES completion:nil];
    
}

//隐藏导航栏
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    
}

@end
