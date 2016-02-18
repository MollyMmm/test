//
//  ReadTableViewCell.h
//  MobileSchool
//
//  Created by Apple on 16/2/18.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReadTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *readImageView;

+ (ReadTableViewCell *)tableViewCell:(UITableView *)tableView;


@end
