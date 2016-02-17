//
//  MyViewController.m
//  MobileSchool
//
//  Created by 李公博 on 16/1/25.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "MyViewController.h"
#import "ContactsViewController.h"
#import "NavigationViewController.h"

#import "MMDrawerController.h"
#import "LeftSideDrawerViewController.h"
@interface MyViewController ()
@property(nonatomic,strong)MMDrawerController* drawController;
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"你的";
    //[self setNavigationBarHidden:YES];
    self.navigationController.navigationBarHidden = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressContactBtn:(UIButton *)sender {
    ContactsViewController* contactController = [[ContactsViewController alloc] init];
    NavigationViewController* navController = [[NavigationViewController alloc] initWithRootViewController:contactController];
    [self.navigationController presentViewController:navController animated:YES completion:nil];
//    [self.navigationController pushViewController:contactController animated:YES];
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
