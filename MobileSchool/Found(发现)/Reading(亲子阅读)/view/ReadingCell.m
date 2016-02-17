//
//  ReadingCell.m
//  MobileSchool
//
//  Created by 李公博 on 16/1/29.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ReadingCell.h"

@implementation ReadingCell

- (void)awakeFromNib {
    // Initialization code
}
- (IBAction)clickButton:(id)sender {
    
    NSLog(@"点击图片按钮");
}

//设置时间label圆角
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    self.timeLabel.layer.cornerRadius = 5;
    self.timeLabel.clipsToBounds = YES;
    
    self.imageButton.layer.cornerRadius = 3;
    self.imageButton.clipsToBounds = YES;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
