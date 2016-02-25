//
//  RegisterViewController.m
//  MobileSchool
//
//  Created by 李公博 on 16/2/23.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
{
    UIWebView *webView;
}
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view from its nib.
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight-60)];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://123.56.17.198:8180/ms/signup"]];
    [self.view addSubview: webView];
    [webView loadRequest:request];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, kScreenHeight-40, kScreenWidth, 40);
    [button setTitle:@"完成登陆" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)back:(UIButton *)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
