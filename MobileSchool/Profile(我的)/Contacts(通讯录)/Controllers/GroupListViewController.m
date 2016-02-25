//
//  GroupListViewController.m
//  MobileSchool
//
//  Created by Molly on 16/2/24.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "GroupListViewController.h"

#import "GroupMemberViewController.h"
#import "NavigationViewController.h"
@interface GroupListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *nameData;
@property (strong, nonatomic) NSArray *imgData;
@end

@implementation GroupListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"群组";
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _imgData = [[NSArray alloc] init];
    _nameData = [[NSArray alloc] init];
    _imgData = @[@"myGroup",@"myGroup",@"myGroup",@"newFriend",@"newFriend",@"newFriend"];
    _nameData = @[@"小明",@"张三",@"李四",@"王五",@"赵六",@"郑七"];
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"leftBtn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(pressCancleBtn:)];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    _tableView.separatorInset = UIEdgeInsetsZero;
    _tableView.tableFooterView = [[UIView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    [cell.imageView setImage:[UIImage imageNamed:[_imgData objectAtIndex:indexPath.row]]];
    cell.textLabel.text = [_nameData objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 44.f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [_imgData count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GroupMemberViewController *groupVC = [[GroupMemberViewController alloc] init];
    NavigationViewController *nav = [[NavigationViewController alloc] initWithRootViewController:groupVC];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}
#pragma mark - public
- (void)pressCancleBtn:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
