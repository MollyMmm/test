//
//  FriendsCircleViewController.m
//  MobileSchool
//
//  Created by 李公博 on 16/1/27.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "FriendsCircleViewController.h"

@interface FriendsCircleViewController ()

@end

@implementation FriendsCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"朋友圈";
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(pressCancleBtn:)];
    
    self.navigationItem.leftBarButtonItem = leftBar;
}



-(void)pressCancleBtn:(UIButton *)btn
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
