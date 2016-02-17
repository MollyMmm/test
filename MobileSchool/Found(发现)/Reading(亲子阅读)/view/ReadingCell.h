//
//  ReadingCell.h
//  MobileSchool
//
//  Created by 李公博 on 16/1/29.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReadingCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIButton *imageButton;
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;
@end
