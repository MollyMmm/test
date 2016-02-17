//
//  SendTableViewCell.m
//  MobileSchool
//
//  Created by Apple on 16/1/29.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "SendTableViewCell.h"


@implementation SendTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    return self;
}
- (void)createView {
    _commentLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_commentLabel];
    _photoImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_photoImageView];
    _lineLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_lineLabel];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    _commentLabel.frame = CGRectMake(10 * W, 0, 300 * W, 40 * H);
    _photoImageView.frame = CGRectMake(320 * W, 10 * H, 25 * W, 25 * H);
    _lineLabel.frame = CGRectMake(0, 40 * H, 400 * W, 1 * H);
    _lineLabel.backgroundColor = [UIColor grayColor];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
