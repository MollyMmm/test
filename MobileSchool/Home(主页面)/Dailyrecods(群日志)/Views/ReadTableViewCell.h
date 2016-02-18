//
//  ReadTableViewCell.h
//  MobileSchool
//
//  Created by Apple on 16/2/18.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReadTableViewCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UIImageView *readImageView;
@property (nonatomic, strong) UICollectionView *collectionView;

+ (ReadTableViewCell *)tableViewCell:(UITableView *)tableView;

- (void)getCollection:(int)ReadOrSupport;


@end
