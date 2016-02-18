//
//  CommentTableViewCell.h
//  MobileSchool
//
//  Created by Apple on 16/2/18.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *peopleImageView;
@property (nonatomic, strong) UILabel *peopleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *fromLabel;
@property (nonatomic, strong) UILabel *contentLabel;

+ (CommentTableViewCell *)commentTableViewCell:(UITableView *)tableView;


@end
