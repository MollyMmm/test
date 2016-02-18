//
//  ReadTableViewCell.m
//  MobileSchool
//
//  Created by Apple on 16/2/18.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "ReadTableViewCell.h"
#import "ReadCollectionViewCell.h"

@implementation ReadTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    return self;
}
- (void)createView {
    _readImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_readImageView];
    _readImageView.frame = CGRectMake(30 * W, 10 * H, 30 * H, 30 * H);
    _readImageView.image = [UIImage imageNamed:@"阅读"];
    
    UICollectionViewFlowLayout  *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    
    //不同于tableView,他用item进行显示,所以要先设置每个item有多大
    flowlayout.itemSize = CGSizeMake((kScreenWidth - 30 * W - 30 * H) / 5 - 20 * W, (kScreenWidth - 30 * W - 30 * H) / 5 - 20 * W);
    
    //创建一个collectionView
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(kScreenWidth / 4 - 10 * W, 10 * H, kScreenWidth * 3 / 4, kScreenHeight)collectionViewLayout:flowlayout];
    
    //接下来就是和tableView很相似,使用前需要签订2个协议datasource,Delegate
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.contentView addSubview:_collectionView];
    _collectionView.backgroundColor = [UIColor whiteColor];
    

    
    
    //通过注册的方式创建cell
    
    //第一个参数:需要制定注册对象的类型
    //第二个参数:重用的标识
    [_collectionView registerClass:[ReadCollectionViewCell class] forCellWithReuseIdentifier:@"reuse"];
    
    //设置行间距
    flowlayout.minimumLineSpacing = 10 * W;
    //设置列间距
    flowlayout.minimumInteritemSpacing = 10 * H;
    
    
    
}

+ (ReadTableViewCell *)tableViewCell:(UITableView *)tableView {
    static NSString *reuse = @"ReadReuse";
    ReadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[ReadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    }
    return cell;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
#pragma mark 在collectionCell的创建时候,提供了另外一种不同于tableView的cell创建方式
    ReadCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuse" forIndexPath:indexPath];
    
    return cell;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
