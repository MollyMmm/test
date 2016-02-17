//
//  FileViewController.m
//  MobileSchool
//
//  Created by Apple on 16/1/29.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "FileViewController.h"

@interface FileViewController ()

@end

@implementation FileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的档案";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"创建档案" style:UIBarButtonItemStyleBordered target:self action:@selector(sendAction)];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.hidesBottomBarWhenPushed = YES;
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;

}
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)sendAction {
    
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
