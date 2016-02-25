//
//  SearchGroupViewController.m
//  MobileSchool
//
//  Created by 李公博 on 16/2/25.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "SearchGroupViewController.h"

@interface SearchGroupViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    NSMutableArray *_dataSource;
    NSMutableArray * _searchDataSource;//搜索结果数据源
    UISearchDisplayController * _searchDisplayController;//搜索显示视图控制器
    
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation SearchGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareTableView];
    [self prepareSearchBar];
    [self prepareDataSource];
}


-(void)prepareDataSource
{
    _dataSource = [[NSMutableArray alloc]init];
    _searchDataSource = [[NSMutableArray alloc]init];
    
    //    NSString * filePath = [[NSBundle mainBundle]pathForResource:@"student" ofType:@"plist"];
    //    NSArray * array = [NSArray arrayWithContentsOfFile:filePath];
    //    for (NSDictionary * dd in array) {
    //        KGUserModel * user = [[KGUserModel alloc]init];
    //        //这里直接用取出来的字典进行赋值 KVC
    //        [user setValuesForKeysWithDictionary:dd];
    //        [_dataSource addObject:user];
    //    }
    
}

-(void)prepareTableView
{
    self.title = @"搜索好友";
    _tableView.delegate = self;
    _tableView.dataSource = self;
    //_tableView.tableHeaderView = _searchBar;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

-(void)prepareSearchBar
{
    _searchBar.delegate = self;
    
    _searchDisplayController = [[UISearchDisplayController alloc]initWithSearchBar:_searchBar contentsController:self];
    _searchDisplayController.searchResultsDataSource = self;
    _searchDisplayController.searchResultsDelegate = self;
}

//这个方法是搜索条的协议,
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    //在每次搜索前清空原来的搜索结果
    [_searchDataSource removeAllObjects];
    //
    //    NSLog(@"%@",searchBar.text);
    //    for (KGUserModel * user in _dataSource) {
    //        if (([user.UserName rangeOfString:searchBar.text].location != NSNotFound) || ([user.Telephone rangeOfString:searchBar.text].location != NSNotFound)) {
    //            [_searchDataSource addObject:user];
    //        }
    //    }
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //因为当前视图控制器给两个talbeView提供数据,
    //那么就需要根据不同tableView的调用 ,来区分传给talbeView什么数据
    if (tableView == _tableView) {
        return _dataSource.count;
    }
    else
        return _searchDataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cc" ];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cc"];
    }
    
    //从数据源将模型对象取出来
    //    KGUserModel * user;
    //    if (tableView == _tableView) {
    //        user= [_dataSource objectAtIndex:indexPath.row];
    //    }
    //    else
    //        user = [_searchDataSource objectAtIndex:indexPath.row];
    //
    //    cell.imageView.image = [UIImage imageNamed:user.Photo];
    //    cell.textLabel.text = user.UserName;
    //    cell.detailTextLabel.text = user.Telephone;
    return cell;
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
