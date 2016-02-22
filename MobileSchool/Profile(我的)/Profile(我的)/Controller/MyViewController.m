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
#import "MyViewTableViewCell.h"
#import "MMDrawerController.h"
#import "LeftSideDrawerViewController.h"
#import "BarcodeViewController.h"
#import "IdentificationViewController.h"
#import "BlackListViewController.h"
#import "SendQueueViewController.h"
#import "SettingViewController.h"
#import "TrashViewController.h"

@interface MyViewController ()
@property(nonatomic,strong)MMDrawerController* drawController;
@end

@implementation MyViewController
{
    NSArray *_dataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self getData];
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
}
-(void)getData
{
    _dataSource = @[@[@"button"],@[@"我的二维码"],@[@"发送队列",@"回收站",@"黑名单"],@[@"设置"],@[@"学校认证"]];
}


#pragma mark - UItableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_dataSource count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSInteger rowCount = [(NSArray*)[_dataSource objectAtIndex:section] count];
    return rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* cellIdentifier = @"cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSString* text = [[_dataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.text = text;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image = [UIImage imageNamed:@"tabbar_home_selected"];
    if (indexPath.section == 0 && indexPath.row == 0) {
        return (UITableViewCell*)[[[NSBundle mainBundle] loadNibNamed:@"MyViewTableViewCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* text = [[_dataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    if ([text isEqualToString:@"系统设置"]||[text isEqualToString:@"我的订单"]||[text isEqualToString:@"地址管理"]||[text isEqualToString:@"我的账号"]) {
        
        
    }
    
    
    if ([text isEqualToString:@"我的二维码"]) {
        BarcodeViewController *barcode = [[BarcodeViewController alloc]init];
        NavigationViewController *nac = [[NavigationViewController alloc]initWithRootViewController:barcode];
        [self presentViewController:nac animated:YES completion:nil];
    }
    
    if ([text isEqualToString:@"发送队列"]) {
        SendQueueViewController *sendQueue = [[SendQueueViewController alloc]init];
        NavigationViewController *nac = [[NavigationViewController alloc]initWithRootViewController:sendQueue];
        [self presentViewController:nac animated:YES completion:nil];
        
    }
    if ([text isEqualToString:@"回收站"]) {
        TrashViewController *trash = [[TrashViewController alloc]init];
        NavigationViewController *nac = [[NavigationViewController alloc]initWithRootViewController:trash];
        [self presentViewController:nac animated:YES completion:nil];
        
    }
    if ([text isEqualToString:@"黑名单"]) {
        BlackListViewController *blackList = [[BlackListViewController alloc]init];
        NavigationViewController *nac = [[NavigationViewController alloc]initWithRootViewController:blackList];
        [self presentViewController:nac animated:YES completion:nil];
    }
    
    if ([text isEqualToString:@"设置"]) {
        SettingViewController *setting = [[SettingViewController alloc]init];
        NavigationViewController *nac = [[NavigationViewController alloc]initWithRootViewController:setting];
        [self presentViewController:nac animated:YES completion:nil];
        
    }
    if ([text isEqualToString:@"学校认证"]) {
        IdentificationViewController *indentification = [[IdentificationViewController alloc]init];
        NavigationViewController *nac = [[NavigationViewController alloc]initWithRootViewController:indentification];
        [self presentViewController:nac animated:YES completion:nil];
        
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 200.f;
    }
    return 44.f;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}





//隐藏导航栏
-(void)viewWillAppear:(BOOL)animated
{
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
