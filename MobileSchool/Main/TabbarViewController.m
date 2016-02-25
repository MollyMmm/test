//
//  TabbarViewController.m
//  MobileSchool
//
//  Created by 李公博 on 16/1/25.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "TabbarViewController.h"

#import "NavigationViewController.h"
#import "GroupSpaceViewController.h"
#import "MessageViewController.h"
#import "HomeViewController.h"
#import "FoundViewController.h"
#import "MyViewController.h"

#import "FriendsListViewController.h"

#import "ContactsViewController.h"
@interface TabbarViewController ()

@end

@implementation TabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //群空间
    GroupSpaceViewController *group = [[GroupSpaceViewController alloc]init];
    [self addChildViewController:group image:@"tabbar_home" selectedImage:@"tabbar_home_selected" title:@"群空间"];
    
    //消息
    MessageViewController *message = [[MessageViewController alloc]init];
    [self addChildViewController:message image:@"tabbar_home" selectedImage:@"tabbar_home_selected" title:@"消息"];
    
    //主页
    HomeViewController *home = [[HomeViewController alloc]init];
    [self addChildViewController:home image:@"tabbar_home" selectedImage:@"tabbar_home_selected" title:@"首页"];
    
    //发现
//    FoundViewController *found = [[FoundViewController alloc]init];
//    [self addChildViewController:found image:@"tabbar_home" selectedImage:@"tabbar_home_selected" title:@"发现"];
    
    //我的
    MyViewController *my = [[MyViewController alloc]init];
    [self addChildViewController:my image:@"tabbar_home" selectedImage:@"tabbar_home_selected" title:@"我的"];
    
    
    //好友列表
    FriendsListViewController *friend = [[FriendsListViewController alloc] init];
    [self addChildViewController:friend image:@"tabbar_home" selectedImage:@"tabbar_home_selected" title:@"好友"];

}


/**
 *  添加子控制器
 *
 *  @param childViewController 子控制器
 *  @param image               tabBarItem正常状态图片
 *  @param selectedImage       tabBarItem选中状态图片
 *  @param title               标题
 */
- (void)addChildViewController:(UIViewController *)childViewController image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title {
    
    //标题
    childViewController.title = title;
    childViewController.view.backgroundColor = [UIColor whiteColor];
    
    //tabBarItem图片
    childViewController.tabBarItem.image = [UIImage imageNamed:image];
    childViewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //tabBarItem字体的设置
    //正常状态
    NSMutableDictionary *normalText = [NSMutableDictionary dictionary];
    normalText[NSForegroundColorAttributeName] = [UIColor colorWithRed:123/255.0 green:123/255.0 blue:123/255.0 alpha:1.0];
    [childViewController.tabBarItem setTitleTextAttributes:normalText forState:UIControlStateNormal];
    
    //选中状态
    NSMutableDictionary *selectedText = [NSMutableDictionary dictionary];
    selectedText[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childViewController.tabBarItem setTitleTextAttributes:selectedText forState:UIControlStateSelected];
    
    //导航控制器
    NavigationViewController *navgationVC = [[NavigationViewController alloc]initWithRootViewController:childViewController];
    
    navgationVC.title= nil;
    
    [self addChildViewController:navgationVC];
    
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
