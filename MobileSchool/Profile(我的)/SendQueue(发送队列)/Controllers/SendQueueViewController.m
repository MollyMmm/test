//
//  SendQueueViewController.m
//  MobileSchool
//
//  Created by 李公博 on 16/2/23.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "SendQueueViewController.h"

@interface SendQueueViewController ()

@end

@implementation SendQueueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发送队列";
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"leftBtn"] style:UIBarButtonItemStyleDone target:self action:@selector(pressCancleBtn:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
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
