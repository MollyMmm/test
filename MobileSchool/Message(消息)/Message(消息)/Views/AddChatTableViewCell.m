//
//  AddChatTableViewCell.m
//  MobileSchool
//
//  Created by Molly on 16/2/22.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "AddChatTableViewCell.h"

@implementation AddChatTableViewCell

- (void)awakeFromNib {

    [_iconImg.layer setCornerRadius:27.f];
    _iconImg.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
