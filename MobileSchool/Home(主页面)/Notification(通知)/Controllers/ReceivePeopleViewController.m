//
//  ReceivePeopleViewController.m
//  MobileSchool
//
//  Created by Apple on 16/1/29.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ReceivePeopleViewController.h"



@interface ReceivePeopleViewController ()

@end

@implementation ReceivePeopleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"选择接收人";
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(sureAction)];
    item.tintColor = [UIColor orangeColor];
    self.navigationItem.rightBarButtonItem = item;
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, 40 * H)];
    searchBar.placeholder = @"筛选";
    [self.view addSubview:searchBar];
}
- (void)sureAction {
    
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
