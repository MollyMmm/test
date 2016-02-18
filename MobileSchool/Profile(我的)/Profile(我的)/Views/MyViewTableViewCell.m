//
//  MyViewTableViewCell.m
//  MobileSchool
//
//  Created by 李公博 on 16/2/18.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "MyViewTableViewCell.h"
#import "ContactsViewController.h"
#import "NavigationViewController.h"
@implementation MyViewTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.userInteractionEnabled = YES;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, kScreenWidth/4, 100);
    button.backgroundColor = [UIColor whiteColor];
    [button addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(kScreenWidth/4, 0, kScreenWidth/4, 100);
    button1.backgroundColor = [UIColor grayColor];
    [button1 addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(kScreenWidth/2, 0, kScreenWidth/4, 100);
    button2.backgroundColor = [UIColor blueColor];
    [button2 addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeSystem];
    button3.frame = CGRectMake(kScreenWidth/4*3, 0, kScreenWidth/4, 100);
    button3.backgroundColor = [UIColor grayColor];
    [button3 addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeSystem];
    button4.frame = CGRectMake(0, 100, kScreenWidth/4, 100);
    button4.backgroundColor = [UIColor grayColor];
    [button4 addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button4];
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeSystem];
    button5.frame = CGRectMake(kScreenWidth/4, 100, kScreenWidth/4, 100);
    button5.backgroundColor = [UIColor grayColor];
    [button5 addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button5];
    
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeSystem];
    button6.frame = CGRectMake(kScreenWidth/2, 100, kScreenWidth/4, 100);
    button6.backgroundColor = [UIColor grayColor];
    [button6 addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button6];
    
   
}



-(void)press
{
    ContactsViewController* contactController = [[ContactsViewController alloc] init];
    NavigationViewController* navController = [[NavigationViewController alloc] initWithRootViewController:contactController];
    [self.window.rootViewController presentViewController:navController animated:YES completion:nil];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
