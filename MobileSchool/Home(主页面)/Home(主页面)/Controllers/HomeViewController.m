//
//  HomeViewController.m
//  MobileSchool
//
//  Created by 李公博 on 16/1/25.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCollectionViewCell.h"
#import "AddViewController.h"
#import "NotificationAndRecodsViewController.h"
#import "RecodesViewController.h"
#import "AchievementViewController.h"
#import "DraftViewController.h"
#import "DailyRecodViewController.h"
#import "AboutMeViewController.h"
#import "MyDailyRecodViewController.h"
#import "AddressBookViewController.h"
#import "RemindViewController.h"
#import "FriendsViewController.h"
#import "FileViewController.h"
#import "MyHomePageViewController.h"
#import "CollectViewController.h"
#import "CommentViewController.h"


@interface HomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,AddViewControllerDelegate,cancelDelegate>
@property (nonatomic, strong) NSMutableArray *titleArr;
@property (nonatomic, strong) NSMutableArray *noAddArr;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) BOOL canceOrNot;
@property (nonatomic, strong) UIButton *sureButton;
@end

@implementation HomeViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _titleArr = [NSMutableArray arrayWithObjects:@"通知",@"作业",@"成绩",@"群日志",@"提到我的",@"我的日志",@"通讯录",@"提醒",@"好友圈",@"添加", nil];
        _noAddArr = [NSMutableArray arrayWithObjects:@"我的评论",@"草稿箱",@"收藏夹",@"我的主页",@"档案库", nil];
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated {
    self.title = @"尹直富";
#pragma mark 设置导航栏字体颜色为白色
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor redColor];
    NSDictionary *navTitleArr = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [UIColor whiteColor],NSForegroundColorAttributeName,nil];
    
    self.navigationController.navigationBar.titleTextAttributes = navTitleArr;

    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    self.hidesBottomBarWhenPushed = YES;
}
- (void)viewWillDisappear:(BOOL)animated {
    self.hidesBottomBarWhenPushed = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    NSDictionary *navTitleArr = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [UIColor blackColor],NSForegroundColorAttributeName,nil];
    
    self.navigationController.navigationBar.titleTextAttributes = navTitleArr;


}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

#pragma mark 主页面的创建
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    flowlayout.itemSize = CGSizeMake(kScreenWidth / 3, (kScreenHeight - 64 - 49)/ 4);
    flowlayout.minimumInteritemSpacing = 0;
    flowlayout.minimumLineSpacing = 0;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) collectionViewLayout:flowlayout];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:@"reuse"];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction)];
    longPress.minimumPressDuration = 2;
    [_collectionView addGestureRecognizer:longPress];
    longPress.allowableMovement = 200;
    _collectionView.userInteractionEnabled = YES;
    _canceOrNot = NO;
    
}
- (void)longPressAction {
    _canceOrNot = YES;
    NSLog(@"长按");
    self.tabBarController.tabBar.hidden = YES;
    
    _sureButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_sureButton setTitle:@"完成" forState:UIControlStateNormal];
    [_sureButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _sureButton.backgroundColor = [UIColor grayColor];
    
    [_sureButton addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_sureButton];
    
    _sureButton.frame = CGRectMake(0, kScreenHeight - 49, kScreenWidth, 49);
    [_collectionView reloadData];
}
- (void)sureAction {
    _canceOrNot = NO;
    self.tabBarController.tabBar.hidden = NO;
    [_sureButton removeFromSuperview];
    [_collectionView reloadData];
}
- (void)cancelName:(NSString *)name {
    [_titleArr removeObject:name];
    [_noAddArr addObject:name];
    [_collectionView reloadData];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _titleArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuse" forIndexPath:indexPath];
    cell.titleLabel.text = _titleArr[indexPath.row];
    cell.titleLabel.textColor = [UIColor grayColor];
    cell.layer.borderWidth = 1 * H;
    cell.layer.borderColor = [UIColor grayColor].CGColor;
    cell.delegate = self;


#pragma mark  添加
    if ([_titleArr[indexPath.row] isEqualToString:@"添加"]) {
        cell.titleImageView.image = [UIImage imageNamed:@"主页面添加图标"];
        cell.cancelImageView.hidden = YES;
    } else {
#pragma mark  功能图标
    cell.titleImageView.image = [UIImage imageNamed:@"主页面功能图标"];
        if (_canceOrNot) {
         cell.cancelImageView.hidden = NO;
        } else {
            cell.cancelImageView.hidden = YES;

        }
    
    }
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
#pragma mark 添加，代理传值
    if (!_canceOrNot) {

    if (indexPath.row == _titleArr.count - 1) {
        AddViewController *addVC = [[AddViewController alloc] init];
        [self.navigationController pushViewController:addVC animated:YES];
        addVC.addArr = _titleArr;
        addVC.noAddArr = _noAddArr;
        addVC.addArrDelegate = self;
    } else {
#pragma mark 通知
        if ([_titleArr[indexPath.row] isEqualToString:@"通知"]) {
            NotificationAndRecodsViewController *notification = [[NotificationAndRecodsViewController alloc] init];
            [self.navigationController pushViewController:notification animated:YES];
        }
#pragma mark 作业
        if ([_titleArr[indexPath.row] isEqualToString:@"作业"]) {
            RecodesViewController *notification = [[RecodesViewController alloc] init];
            [self.navigationController pushViewController:notification animated:YES];
        }
#pragma mark 成绩
        if ([_titleArr[indexPath.row] isEqualToString:@"成绩"]) {
            AchievementViewController *notification = [[AchievementViewController alloc] init];
            [self.navigationController pushViewController:notification animated:YES];
        }
#pragma mark 群日志
        if ([_titleArr[indexPath.row] isEqualToString:@"群日志"]) {
            DailyRecodViewController *draft = [[DailyRecodViewController alloc] init];
            [self.navigationController pushViewController:draft animated:YES];
        }
#pragma mark 提到我的
        if ([_titleArr[indexPath.row] isEqualToString:@"提到我的"]) {
            AboutMeViewController *draft = [[AboutMeViewController alloc] init];
            [self.navigationController pushViewController:draft animated:YES];
        }
#pragma mark 我的日志
        if ([_titleArr[indexPath.row] isEqualToString:@"我的日志"]) {
            MyDailyRecodViewController *draft = [[MyDailyRecodViewController alloc] init];
            [self.navigationController pushViewController:draft animated:YES];
        }
#pragma mark 通讯录
        if ([_titleArr[indexPath.row] isEqualToString:@"通讯录"]) {
            AddressBookViewController *draft = [[AddressBookViewController alloc] init];
            [self.navigationController pushViewController:draft animated:YES];
        }
#pragma mark 提醒
        if ([_titleArr[indexPath.row] isEqualToString:@"提醒"]) {
            RemindViewController *draft = [[RemindViewController alloc] init];
            [self.navigationController pushViewController:draft animated:YES];
        }
#pragma mark 好友圈
        if ([_titleArr[indexPath.row] isEqualToString:@"好友圈"]) {
            FriendsViewController *draft = [[FriendsViewController alloc] init];
            [self.navigationController pushViewController:draft animated:YES];
        }
#pragma mark 档案库
        if ([_titleArr[indexPath.row] isEqualToString:@"档案库"]) {
            FileViewController *draft = [[FileViewController alloc] init];
            [self.navigationController pushViewController:draft animated:YES];
        }
#pragma mark 我的主页
        if ([_titleArr[indexPath.row] isEqualToString:@"我的主页"]) {
            MyHomePageViewController *draft = [[MyHomePageViewController alloc] init];
            [self.navigationController pushViewController:draft animated:YES];
        }
#pragma mark 收藏夹
        if ([_titleArr[indexPath.row] isEqualToString:@"收藏夹"]) {
            CollectViewController *draft = [[CollectViewController alloc] init];
            [self.navigationController pushViewController:draft animated:YES];
        }
#pragma mark 草稿箱
        if ([_titleArr[indexPath.row] isEqualToString:@"草稿箱"]) {
            DraftViewController *draft = [[DraftViewController alloc] init];
            [self.navigationController pushViewController:draft animated:YES];
        }
#pragma mark 我的评论
        if ([_titleArr[indexPath.row] isEqualToString:@"我的评论"]) {
            CommentViewController *draft = [[CommentViewController alloc] init];
            [self.navigationController pushViewController:draft animated:YES];
        }

    }
    }
}
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    //先获取到起始位置的数据
    NSString *str=_titleArr[sourceIndexPath.row];
    //2.把起始位置的对象从数据源中删除
    [_titleArr removeObjectAtIndex:sourceIndexPath.row];
    //3.把数据插入到数组的目的位置上去
    [_titleArr insertObject:str atIndex:destinationIndexPath.row];
    
}
- (void)getaddArr:(NSMutableArray *)arr {
    [arr addObject:@"添加"];
    _titleArr = arr;
    [_collectionView reloadData];
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
