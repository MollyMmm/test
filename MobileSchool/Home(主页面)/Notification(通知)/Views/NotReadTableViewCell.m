//
//  NotReadTableViewCell.m
//  MobileSchool
//
//  Created by Apple on 16/2/15.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "NotReadTableViewCell.h"

@implementation NotReadTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    return self;
}
- (void)createView {
    _headerImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_headerImageView];
    
    _nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLabel];
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50 * H, kScreenWidth, 1 * H)];
    lineLabel.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:lineLabel];
    
    UIImageView *rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth - 30 * H, 10 * H, 30 * H, 30 * H)];
    [self.contentView addSubview:rightImageView];
    rightImageView.image = [UIImage imageNamed:@"向右"];
    
}
- (void)layoutSubviews {
    _nameLabel.frame = CGRectMake(40 * H + 20 * W, 0, 100 * W, 40 * H);
    _headerImageView.frame = CGRectMake(10 * W, 0 * H, 40 * H, 40 * H);
    _headerImageView.layer.cornerRadius = 20 * H;
    _headerImageView.layer.masksToBounds = YES;
    
    _headerImageView.image = [UIImage imageNamed:@"头像"];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
