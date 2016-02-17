//
//  HelpViewController.m
//  MobileSchool
//
//  Created by 李公博 on 16/1/27.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "HelpViewController.h"

@interface HelpViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"家长学生专区";
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(pressCancleBtn:)];
    self.navigationItem.leftBarButtonItem = barButtonItem;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self configData];
    [self createTableView];
    self.view.backgroundColor = [UIColor grayColor];
}


-(void)configData
{
    if (!_dataArray) {
        _dataArray = [NSArray arrayWithObjects:@"1访问、下砸、注册", @"2设置用户名、密码",@"3搜索、加入群",@"4发表日志",@"5加好友",@"6签收通知",@"7查看作业",@"8接受成绩单",@"9聊天",@"10创建一个自己的群",nil];;
    }
   }

-(void)createTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(4, 0, [UIScreen mainScreen].bounds.size.width-8, 700) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;

}

#pragma mark -- tableview的代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text  = [_dataArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
