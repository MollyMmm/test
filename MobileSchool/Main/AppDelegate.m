//
//  AppDelegate.m
//  MobileSchool
//
//  Created by Molly on 16/2/17.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "AppDelegate.h"
#import "TabbarViewController.h"
#import "IQKeyboardManager.h"
#import <AVOSCloudIM/AVOSCloudIM.h>
#import <AVOSCloud/AVOSCloud.h>
#import "NavigationViewController.h"
#import "SignInViewController.h"
#import "CHLeadViewController.h"
#define kApplicationId @"q7A8P8I2IcPb8lwbaAqpGvz6-gzGzoHsz"
#define kClientKey @"2KooEQ9JPFGq0ee1R1dGnqDo"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    


//    [AVOSCloudIM registerForRemoteNotification];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    SignInViewController *sgin = [[SignInViewController alloc]init];
    
    
     NavigationViewController *navgationVC = [[NavigationViewController alloc]initWithRootViewController:sgin];
    
    void(^block)() = ^(){
        [self.window setRootViewController:navgationVC];
    };
    
#warning 引导页创建(只第一次运行)
    
    CHLeadViewController *leadVC = [[CHLeadViewController alloc] init];
    leadVC.block = block;
    _window.rootViewController = leadVC;
    
    [self.window makeKeyAndVisible];
    
    IQKeyboardManager* keyBoardManager = [IQKeyboardManager sharedManager];
    keyBoardManager.enable = YES;
    keyBoardManager.shouldResignOnTouchOutside = YES;
    keyBoardManager.enableAutoToolbar = NO;

    // 初始化 LeanCloud SDK
    [AVOSCloud setApplicationId:kApplicationId clientKey:kClientKey];
#ifdef DEBUG
    [AVAnalytics setAnalyticsEnabled:NO];
    [AVOSCloud setVerbosePolicy:kAVVerboseShow];
    [AVLogger addLoggerDomain:AVLoggerDomainIM];
    [AVLogger addLoggerDomain:AVLoggerDomainCURL];
    [AVLogger setLoggerLevelMask:AVLoggerLevelAll];
#endif

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
