//
//  GroupSpaceViewController.m
//  MobileSchool
//
//  Created by 李公博 on 16/1/25.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "GroupSpaceViewController.h"
#import "GroupViewController.h"
#import "DailyViewController.h"
#import "JSDropmenuView.h"
#define SCREEN_WIDTH   ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT  ([[UIScreen mainScreen] bounds].size.height)
@interface GroupSpaceViewController ()<JSDropmenuViewDelegate>{
    UIScrollView *_scrollView;
    UISegmentedControl *_seCtl;
    UISearchBar *_searchBar;
}
@property(nonatomic,strong) NSArray *menuArray;//菜单
@end

@implementation GroupSpaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
     {
        self.edgesForExtendedLayout = UIRectEdgeNone;
     }
    
    //

    self.menuArray = @[@{@"imageName":@"SaoMiao", @"title":@"扫一扫"},@{@"imageName":@"qunhome_createQun", @"title":@"创建群"},@{@"imageName":@"yaoqing", @"title":@"暗号进群"}];
    
     [self build];
     [self setSegmentedControl];

}

-(void)open:(UIBarButtonItem *)btn
{
    JSDropmenuView *dropmenuView = [[JSDropmenuView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-150, 64-12, 140, 44*3+12)];
    dropmenuView.delegate = self;
    
    [dropmenuView showViewInView:self.navigationController.view];
}

-(void)setSegmentedControl
{
    if(!_seCtl)
    {
    NSArray *arr = [[NSArray alloc]initWithObjects:@"群组",@"日志", nil];
    _seCtl = [[UISegmentedControl alloc]initWithItems:arr];
    _seCtl.frame = CGRectMake(20.0, 20.0, 180, 30);
    _seCtl.selectedSegmentIndex = 0;
    _seCtl.tintColor = [UIColor whiteColor];
    
    self.navigationItem.titleView = _seCtl;
    [_seCtl addTarget:self action:@selector(didClicksegmentedControlAction:) forControlEvents:UIControlEventValueChanged];
    }
    
    
    UIImage *image = [[UIImage imageNamed:@"tabbar_compose_icon_add"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(open:)];

    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

-(void)build
{
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.backgroundColor = [UIColor redColor];
    _scrollView.frame = CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*2,SCREEN_HEIGHT);
    _scrollView.pagingEnabled = YES;
    _scrollView.scrollEnabled = NO;
    [self.view addSubview:_scrollView];
    
    
    GroupViewController *TableView = [[GroupViewController alloc]init];
    TableView.view.frame = CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
    
    [self addChildViewController:TableView];
    [_scrollView addSubview:TableView.view];
    
    
    
    DailyViewController *Table = [[DailyViewController alloc]init];
    CGRect aframe = CGRectMake(SCREEN_WIDTH,0,SCREEN_WIDTH,SCREEN_HEIGHT);
    
    Table.view.frame =aframe;
    
    [self addChildViewController:Table];
    [_scrollView addSubview:Table.view];

}
-(void)didClicksegmentedControlAction:(UISegmentedControl *)Seg{
    switch (Seg.selectedSegmentIndex) {
            
        case 0:{
            [_scrollView setContentOffset:CGPointMake(_scrollView.bounds.size.width * Seg.selectedSegmentIndex, 0) animated:YES];
            break;
        }
        case 1:{
            [_scrollView setContentOffset:CGPointMake(_scrollView.bounds.size.width * Seg.selectedSegmentIndex, 0) animated:YES];
            break;
        }
        default:
            break;
    }
}


#pragma mark - JSDropmenuViewDelegate

- (NSArray *)dropmenuDataSource {
    return self.menuArray;
}

- (void)dropmenuView:(JSDropmenuView *)dropmenuView didSelectedRow:(NSInteger)index {
    
    if(index>=self.menuArray.count){
        return;
    }
    
    NSDictionary *itemDic = [self.menuArray objectAtIndex:index];
    
    [NSString stringWithFormat:@"选中 ----- %@",[itemDic objectForKey:@"title"]];
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
