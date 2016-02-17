//
//  InterviewCell.m
//  MobileSchool
//
//  Created by 李公博 on 16/2/3.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "InterviewCell.h"

@implementation InterviewCell

- (void)awakeFromNib {
    // Initialization code
}
- (IBAction)clickButton:(id)sender {
     NSLog(@"点击图片按钮");
    
}
//设置时间label和图片按钮为圆角
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    self.timeLabel.layer.cornerRadius = 5;
    self.timeLabel.clipsToBounds = YES;
    
    self.iamgeButton.layer.cornerRadius = 3;
    self.iamgeButton.clipsToBounds = YES;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
