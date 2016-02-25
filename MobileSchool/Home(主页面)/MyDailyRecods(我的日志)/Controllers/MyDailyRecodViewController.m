//
//  MyDailyRecodViewController.m
//  MobileSchool
//
//  Created by Apple on 16/1/29.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "MyDailyRecodViewController.h"
#import "DetailMyDailyRecodsViewController.h"
#import "MyDailyRecodTableViewCell.h"


@interface MyDailyRecodViewController ()<UITableViewDataSource,UITableViewDelegate,mydailyRecodDelegate>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MyDailyRecodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的日志";
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, 40 * H)];
    searchBar.placeholder = @"筛选";
    [self.view addSubview:searchBar];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64 + 40 * H, kScreenWidth, kScreenHeight - 64 - 40 * H)];
    _tableView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 250 * H;
}
- (void)getNumber:(int)number {
    DetailMyDailyRecodsViewController *detailrecod = [[DetailMyDailyRecodsViewController alloc] init];
    [self.navigationController pushViewController:detailrecod animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuse = @"reuse";
    MyDailyRecodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[MyDailyRecodTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailMyDailyRecodsViewController *detailrecod = [[DetailMyDailyRecodsViewController alloc] init];
    [self.navigationController pushViewController:detailrecod animated:YES];
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
