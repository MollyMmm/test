//
//  GroupMemberViewController.m
//  MobileSchool
//
//  Created by Molly on 16/2/24.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "GroupMemberViewController.h"
#import "GroupMemberCollectionViewCell.h"

#import "UserModel.h"
#import "NetworkingManager.h"
#import "GetGroupMemberOperator.h"
#import "UIButton+AFNetworking.h"

@interface GroupMemberViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UISearchBarDelegate>{
    NSString *_cellIndentify;
    UISearchBar *mySearchBar;
}

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSArray *iconData;
@property (strong, nonatomic) NSArray *nameData;

@property (strong, nonatomic) NSArray *memberArr;

@end

@implementation GroupMemberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    _cellIndentify = @"GroupMemberCollectionViewCell";
    [_collectionView registerNib:[UINib nibWithNibName:@"GroupMemberCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:_cellIndentify];
    
    _iconData = [[NSArray alloc] init];
    _nameData = [[NSArray alloc] init];
    _iconData = @[@"myGroup",@"myGroup",@"myGroup",@"newFriend",@"newFriend",@"newFriend"];
    _nameData = @[@"小明",@"张三",@"李四",@"王五",@"赵六",@"郑七"];
    
    self.title = @"群名";
    UIBarButtonItem *leftBarBtton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"leftBtn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(pressCancleBtn:)];
    self.navigationItem.leftBarButtonItem = leftBarBtton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
//    return ([_iconData count] + 1 );
    return [_memberArr count] + 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{

    CGFloat width = kScreenWidth/5 - 20;
    return CGSizeMake(width, width * 130 / 100);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(20, 20, 0, 20);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GroupMemberCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_cellIndentify forIndexPath:indexPath];
    
    if (indexPath.row == [_iconData count]) {
        
        UIImage *icon = [UIImage imageNamed:@"addBtn"];
        [cell.iconBtn setImage:icon forState:UIControlStateNormal];
        [cell.iconBtn.layer setMasksToBounds:YES];
        [cell.iconBtn.layer setBorderWidth:1.f];
        cell.iconBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        cell.nameLbl.text = @"";
    }
    else{
        
        if (_memberArr) {
            
            UserModel *user = [_memberArr objectAtIndex:indexPath.row];
            [cell.iconBtn setImageForState:UIControlStateNormal withURL:[NSURL URLWithString:user.img] placeholderImage:[UIImage imageNamed:@"myFan"]];
            cell.nameLbl.text = user.name;
        }
//        UIImage *icon = [UIImage imageNamed:[_iconData objectAtIndex:indexPath.row]];
//        [cell.iconBtn setImage:icon forState:UIControlStateNormal];
//        cell.nameLbl.text = [_nameData objectAtIndex:indexPath.row];
    }

    return cell;
}

#pragma mark - public
- (void)pressCancleBtn:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
/**
 *请求群成员
 *  http://123.56.17.198:8180/ms/api/user_ser/groupmembers?tokenid=628960a3ed62c3e08b3f7ea11534ffdc&groupname=all
 */
- (void)requestGroupMember{
    
    GetGroupMemberOperator *getMemberOperator = [[GetGroupMemberOperator alloc] initWithParamsDic:@{@"tokenid":[[NSUserDefaults standardUserDefaults] objectForKey:@"tokenid"],@"groupname":@"all"}];
    NetworkingManager *manager = [NetworkingManager sharedInstance];
    
    [manager asyncTaskWithOperator:getMemberOperator withSuccessCallBack:^(BaseModel *model) {
        
        _memberArr = [[NSArray alloc] init];
        _memberArr = getMemberOperator.groupMemberArr;
    } andFaildCallBack:^(id response) {
        
    }];
    
}
@end
