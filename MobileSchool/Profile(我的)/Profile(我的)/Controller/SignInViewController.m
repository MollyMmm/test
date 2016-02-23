//
//  SignInViewController.m
//  MobileSchool
//
//  Created by Molly on 16/2/23.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "SignInViewController.h"

#import "NetworkingManager.h"
#import "SignOperator.h"
#import "UserModel.h"

#import "ContactsViewController.h"
#import "NavigationViewController.h"

@interface SignInViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTxtField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxtField;
@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
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
        
        //-暂时先跳转到通讯录
        ContactsViewController *conVC = [[ContactsViewController alloc] init];
        NavigationViewController *conNav = [[NavigationViewController alloc] initWithRootViewController:conVC];
        
        [self.navigationController presentViewController:conNav animated:YES completion:nil];
        
        
        NSLog(@"正确");
    } andFaildCallBack:^(id response) {
        
    }];
    
    
}

//隐藏导航栏
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    
}

@end
