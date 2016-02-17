//
//  AchievementViewController.m
//  MobileSchool
//
//  Created by Apple on 16/1/29.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "AchievementViewController.h"

@interface AchievementViewController ()

@end

@implementation AchievementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"成绩单";
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"成绩单"]];
    self.view = imageView;
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
