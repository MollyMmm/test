//
//  FoundViewController.m
//  MobileSchool
//
//  Created by 李公博 on 16/1/25.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "FoundViewController.h"
#import "FriendsCircleViewController.h"
#import "NavigationViewController.h"
#import "HotViewController.h"
#import "ReadingViewController.h"
#import "InterviewViewController.h"
#import "HelpViewController.h"
#import "RecommendedViewController.h"
@interface FoundViewController ()

@end

@implementation FoundViewController

//朋友圈界面
- (IBAction)openfriendscircle:(id)sender {
    FriendsCircleViewController *fvc = [[FriendsCircleViewController alloc]init];
    NavigationViewController *nac = [[NavigationViewController alloc]initWithRootViewController:fvc];
    [self presentViewController:nac animated:YES completion:nil];
}

//热点新闻界面
- (IBAction)openHot:(id)sender {
    
    HotViewController *hvc = [[HotViewController alloc]init];
    NavigationViewController *nac = [[NavigationViewController alloc]initWithRootViewController:hvc];
    [self presentViewController:nac animated:YES completion:nil];
    
}

//亲自阅读界面
- (IBAction)openReading:(id)sender {
    
    ReadingViewController *rvc = [[ReadingViewController alloc]init];
    NavigationViewController *nac = [[NavigationViewController alloc]initWithRootViewController:rvc];
    [self presentViewController:nac animated:YES completion:nil];
}

//校外访谈
- (IBAction)openInterview:(id)sender {
    
    InterviewViewController *ivc = [[InterviewViewController alloc]init];
    NavigationViewController *nac = [[NavigationViewController alloc]initWithRootViewController:ivc];
    [self presentViewController:nac animated:YES completion:nil];
}

//帮助页面
- (IBAction)openHelp:(id)sender {
    
    HelpViewController *hvc = [[HelpViewController alloc]init];
    NavigationViewController *nac = [[NavigationViewController alloc]initWithRootViewController:hvc];
    
    
    [self presentViewController:nac animated:YES completion:nil];
}

//推荐群页面
- (IBAction)openRecommended:(id)sender {
    
    RecommendedViewController *revc = [[RecommendedViewController alloc]init];
    NavigationViewController *nac = [[NavigationViewController alloc]initWithRootViewController:revc];
    [self presentViewController:nac animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //更改导航栏颜色为黑色
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
   //改变本页面的状态栏颜色
    [self setNeedsStatusBarAppearanceUpdate];

}

//改变本页面的状态栏颜色为白色
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(UIStatusBarAnimation)preferredStatusBarUpdateAnimation{
    
    //    return UIStatusBarAnimationFade;
    return UIStatusBarAnimationSlide;
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
