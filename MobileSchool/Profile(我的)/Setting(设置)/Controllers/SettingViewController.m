//
//  SettingViewController.m
//  MobileSchool
//
//  Created by 李公博 on 16/2/23.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()
{
    NSArray *_dataSource;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"设置";
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"leftBtn"] style:UIBarButtonItemStyleDone target:self action:@selector(pressCancleBtn:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self loadData];
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    
}
-(void)loadData
{
    _dataSource = @[@[@"新消息通知"],@[@"字体大小",@"清理缓存",@"关于校内外"],@[@"意见反馈"]];
}


#pragma mark - UItableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataSource.count;
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
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* text = [[_dataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    if ([text isEqualToString:@"我的二维码"]) {
        //        BarcodeViewController *barcode = [[BarcodeViewController alloc]init];
        //        NavigationViewController *nac = [[NavigationViewController alloc]initWithRootViewController:barcode];
        //        [self presentViewController:nac animated:YES completion:nil];
    }
    if ([text isEqualToString:@"发送队列"]) {
        
    }
    if ([text isEqualToString:@"回收站"]) {
        //        TrashViewController *trash = [[TrashViewController alloc]init];
        //        NavigationViewController *nac = [[NavigationViewController alloc]initWithRootViewController:trash];
        //        [self presentViewController:nac animated:YES completion:nil];
        //
    }
    if ([text isEqualToString:@"黑名单"]) {
        //        BlackListViewController *blackList = [[BlackListViewController alloc]init];
        //        NavigationViewController *nac = [[NavigationViewController alloc]initWithRootViewController:blackList];
        //        [self presentViewController:nac animated:YES completion:nil];
    }
    
    if ([text isEqualToString:@"设置"]) {
        //        SettingViewController *setting = [[SettingViewController alloc]init];
        //        NavigationViewController *nac = [[NavigationViewController alloc]initWithRootViewController:setting];
        //        [self presentViewController:nac animated:YES completion:nil];
        
    }
    if ([text isEqualToString:@"学校认证"]) {
        //        IdentificationViewController *indentification = [[IdentificationViewController alloc]init];
        //        NavigationViewController *nac = [[NavigationViewController alloc]initWithRootViewController:indentification];
        //        [self presentViewController:nac animated:YES completion:nil];
        
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  44.f;
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
