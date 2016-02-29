//
//  OrganizeViewController.m
//  MobileSchool
//
//  Created by Molly on 16/2/26.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "OrganizeViewController.h"
#import "TreeTableViewCell.h"

#import "Node.h"
#import "GetOrganizeOperator.h"
#import "NetworkingManager.h"

@interface OrganizeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *memberArr;
@property (strong, nonatomic) NSMutableArray *tempArr;

@end

@implementation OrganizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_tempArr count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44.f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    NSString *cellIdentifier = @"cell";
    Node *node = [_memberArr objectAtIndex:indexPath.row];
    
    if ([node.leaf isEqualToString:@"1"]) {
        
        TreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"TreeTableViewCell" owner:nil options:nil] lastObject];
        }
        
        cell.nameLbl.text = node.nodeName;
        return cell;
    }
    if ([node.leaf isEqualToString:@"0"]) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        [cell.imageView setImage:[UIImage imageNamed:@"xiala"]];
        cell.textLabel.text = node.nodeName;
        return cell;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //先修改数据源
    Node *parentNode = [_tempArr objectAtIndex:indexPath.row];
    if (_treeTableCellDelegate && [_treeTableCellDelegate respondsToSelector:@selector(cellClick:)]) {
        [_treeTableCellDelegate cellClick:parentNode];
    }
    
    NSUInteger startPosition = indexPath.row+1;
    NSUInteger endPosition = startPosition;
    BOOL expand = NO;
    for (int i=0; i<_memberArr.count; i++) {
        Node *node = [_memberArr objectAtIndex:i];
        if (node.parentId == parentNode.nodeId) {
            node.expand = !node.expand;
            if (node.expand) {
                [_tempArr insertObject:node atIndex:endPosition];
                expand = YES;
                endPosition++;
            }else{
                expand = NO;
                endPosition = [self removeAllNodesAtParentNode:parentNode];
                break;
            }
        }
    }
    
    //获得需要修正的indexPath
    NSMutableArray *indexPathArray = [NSMutableArray array];
    for (NSUInteger i=startPosition; i<endPosition; i++) {
        NSIndexPath *tempIndexPath = [NSIndexPath indexPathForRow:i inSection:0];
        [indexPathArray addObject:tempIndexPath];
    }
    
    //插入或者删除相关节点
    if (expand) {
        [_tableView insertRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationNone];
    }else{
        [_tableView deleteRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationNone];
    }
}

/**
 *  删除该父节点下的所有子节点（包括孙子节点）
 *
 *  @param parentNode 父节点
 *
 *  @return 该父节点下一个相邻的统一级别的节点的位置
 */
-(NSUInteger)removeAllNodesAtParentNode : (Node *)parentNode{
    NSUInteger startPosition = [_tempArr indexOfObject:parentNode];
    NSUInteger endPosition = startPosition;
    for (NSUInteger i=startPosition+1; i<_tempArr.count; i++) {
        Node *node = [_tempArr objectAtIndex:i];
        endPosition++;
        if (node.deepth <= parentNode.deepth) {
            break;
        }
        if(endPosition == _tempArr.count-1){
            endPosition++;
            node.expand = NO;
            break;
        }
        node.expand = NO;
    }
    if (endPosition>startPosition) {
        [_tempArr removeObjectsInRange:NSMakeRange(startPosition+1, endPosition-startPosition-1)];
    }
    return endPosition;
}


#pragma mark - public
/**
 *  http://123.56.17.198:8180/ms/api/user_ser/nodes?tokenid=5e2a2143cc5d7e779101292a71f0e000&nodeid=0
 *  获取组织
 *
 */

- (void)requestOrganizeMember{
    
    GetOrganizeOperator *memberOperator = [[GetOrganizeOperator alloc] initWithParamsDic:@{@"tokenid":[[NSUserDefaults standardUserDefaults] objectForKey:@"tokenid"],@"nodeid":@"0"}];
    NetworkingManager *manager = [NetworkingManager sharedInstance];
    
    [manager asyncTaskWithOperator:memberOperator withSuccessCallBack:^(BaseModel *model) {
        
        _memberArr = memberOperator.dataArr;
        _tempArr = [self createTempData:_memberArr];
        
    } andFaildCallBack:^(id response) {
        
    }];
    
}
/**
 * 初始化数据源
 */
-(NSMutableArray *)createTempData : (NSArray *)data{
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i=0; i<data.count; i++) {
        Node *node = [data objectAtIndex:i];
        if (node.expand) {
            [tempArray addObject:node];
        }
    }
    return tempArray;
}

@end
