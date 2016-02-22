//
//  AddChatViewController.m
//  MobileSchool
//
//  Created by Molly on 16/2/22.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "AddChatViewController.h"

#import "AddChatTableViewCell.h"

@interface AddChatViewController ()<UITableViewDataSource,UITableViewDelegate>{

    NSString *_cellIdentifier;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;
@property (weak, nonatomic) IBOutlet UIButton *groupBtn;

@property (strong, nonatomic) NSArray *tableData;
@property (strong, nonatomic) NSArray *indexData;

@end

@implementation AddChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"发起聊天";
    UIBarButtonItem* leftBarBtnItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"leftBtn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(pressCancleBtn:)];
    self.navigationItem.leftBarButtonItem = leftBarBtnItem;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = [[UIView alloc] init];
    _cellIdentifier = @"AddChatTableViewCell";
    [_tableView registerNib:[UINib nibWithNibName:@"AddChatTableViewCell" bundle:nil]  forCellReuseIdentifier:_cellIdentifier];
    
    _tableData = [[NSArray alloc] init];
    _indexData = [[NSArray alloc] init];
    _tableData = @[@[@"啊1",@"啊2"],@[@"波波",@"菠菜"],@[@"赫赫"],@[@"校内外助手",@"新人",@"小人",@"昕人"]];
    _indexData = @[@"A",@"B",@"H",@"X"];
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 98)];
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
    searchBar.placeholder = @"筛选";
    [headView addSubview:searchBar];
    UIButton *headBtn = [[UIButton alloc] initWithFrame:CGRectMake(8, 44, kScreenWidth, 54)];
    [headBtn setTitle:@"选择一个群" forState:UIControlStateNormal];
    [headBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [headBtn addTarget:self action:@selector(pressChooseGroupBtn:) forControlEvents:UIControlEventTouchDragInside];
    headBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    UIImageView *nextImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"next"]];
    nextImg.frame = CGRectMake(kScreenWidth - 20 - 16, 17, 20, 20);
    [headBtn addSubview:nextImg];
    [headView addSubview:headBtn];
    _tableView.tableHeaderView = headView;
    
    [_confirmBtn.layer setMasksToBounds:YES];
    [_confirmBtn.layer setCornerRadius:10.f];
    [_confirmBtn.layer setBorderWidth:1.f];
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGColorRef borderColor = CGColorCreate(colorSpaceRef, (CGFloat[]){48/255.f,131/255.f,251/255.f,1.0});
    _confirmBtn.layer.borderColor = borderColor;
//    [_confirmBtn.layer setBorderColor:(__bridge CGColorRef _Nullable)[UIColor blueColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_tableData count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[_tableData objectAtIndex:section] count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 54.f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AddChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentifier forIndexPath:indexPath];
    [cell.iconImg setImage:[UIImage imageNamed:@"myFan"]];
    cell.nameLbl.text = [[_tableData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.selectd = false;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    AddChatTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selectd = !cell.selectd;
    if (cell.selectd) {
        [cell.chooseImg  setImage:[UIImage imageNamed:@"chooseUser-choose"]];
    }
    else{
        [cell.chooseImg setImage:[UIImage imageNamed:@"chooseUser-unchoose"]];
    }
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView* indexView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    [indexView setBackgroundColor:[UIColor colorWithRed:247/255.0 green:247/255.0 blue:248/255.0 alpha:1]];
    UILabel* indexLbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 4, kScreenWidth, 12)];
    indexLbl.text = [_indexData objectAtIndex:section];
    [indexView addSubview:indexLbl];
    return indexView;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [_indexData objectAtIndex:section];
}
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return _indexData;
}
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    
    NSInteger section = [_indexData indexOfObject:title];
    return section;
}
#pragma mark - public
- (void)pressChooseGroupBtn:(id)sender{

}

- (void)pressCancleBtn:(id)sender{

    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
