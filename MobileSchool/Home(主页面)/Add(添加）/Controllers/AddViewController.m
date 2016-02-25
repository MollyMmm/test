//
//  AddViewController.m
//  MobileSchool
//
//  Created by Apple on 16/1/27.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "AddViewController.h"
#import "AddTableViewCell.h"

@interface AddViewController ()<UITableViewDataSource,UITableViewDelegate,AddDelegate>
@property (nonatomic, strong)NSMutableArray *allArr;
@property (nonatomic, strong)UITableView *tableView;


@end

@implementation AddViewController

- (void)viewWillAppear:(BOOL)animated {
    self.hidesBottomBarWhenPushed = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _allArr = [NSMutableArray array];
    [_allArr addObjectsFromArray:_addArr];
    [_allArr addObjectsFromArray:_noAddArr];
    self.title = @"定制个性化首页";
    
#pragma mark 自定义返回按钮
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;
    self.view.backgroundColor = [UIColor yellowColor];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight + 49)];
    _tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 50 * H;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
- (void)addAction:(NSString *)name {
    NSLog(@"%@",name);
    BOOL a = [_addArr containsObject:name];
    if (!a) {
        [_addArr addObject:name];
        [_noAddArr removeObject:name];
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _allArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuse = @"reuse";
    AddTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[AddTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuse];
    }
    cell.headerImageView.image = [UIImage imageNamed:@"主页面功能图标"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.selected = NO;
    cell.delegate = self;

    cell.titleLabel.text = _allArr[indexPath.row];
    if (indexPath.row < _addArr.count) {
        [cell.addButton setTitle:@"已添加" forState:UIControlStateNormal];
        [cell.addButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        cell.addButton.layer.borderColor = [UIColor whiteColor].CGColor;
    } else {
        [cell.addButton setTitle:@"添加" forState:UIControlStateNormal];
        [cell.addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        cell.addButton.layer.borderWidth = 1 * H;
        cell.addButton.layer.borderColor = [UIColor grayColor].CGColor;
    }
    if ([_addArr containsObject:cell.titleLabel.text]) {
        [cell.addButton setTitle:@"已添加" forState:UIControlStateNormal];
        [cell.addButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        cell.addButton.layer.borderColor = [UIColor whiteColor].CGColor;

    }
    
    
    return cell;
    
}
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
    [self.addArrDelegate getaddArr:_addArr];
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
