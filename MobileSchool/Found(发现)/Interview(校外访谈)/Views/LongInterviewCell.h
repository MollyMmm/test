//
//  LongInterviewCell.h
//  MobileSchool
//
//  Created by 李公博 on 16/2/3.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LongInterviewCell : UITableViewCell<UITableViewDataSource,UITableViewDelegate>

//时间标签
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
//图片按钮
@property (weak, nonatomic) IBOutlet UIButton *imageButton;
//图片上的文字标签
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;
//cell内部的tableview
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
