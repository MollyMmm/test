//
//  AddFriendsTableViewCell.m
//  MobileSchool
//
//  Created by Apple on 16/2/25.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "AddFriendsTableViewCell.h"

@implementation AddFriendsTableViewCell
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
    
    _titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_titleLabel];
    
    _cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.contentView addSubview:_cancelButton];
    [_cancelButton addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    
    _sureButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.contentView addSubview:_sureButton];
    [_sureButton addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
    [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 45 * H, kScreenWidth, 1 * H)];
    lineLabel.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:lineLabel];
}
- (void)layoutSubviews {
    _headerImageView.frame = CGRectMake(10 * W, 5 * H, 30 * H, 30 * H);
    _headerImageView.layer.cornerRadius = 15;
    _headerImageView.layer.masksToBounds = YES;
    _headerImageView.backgroundColor = [UIColor yellowColor];
    
    _cancelButton.frame = CGRectMake(kScreenWidth - 70 * W, 5 * H, 60 * W, 30 * H);
    _titleLabel.frame = CGRectMake(20 * W + 30 * H, 0, 100, 40);
    _cancelButton.layer.cornerRadius = 5 * H;
    _cancelButton.layer.borderColor = [UIColor grayColor].CGColor;
    _cancelButton.layer.borderWidth = 1 * H;
    
    _sureButton.frame = CGRectMake(kScreenWidth - 135 * W, 5 * H, 60 * W, 30 * H);
    _sureButton.layer.cornerRadius = 5 * H;
    _sureButton.layer.borderColor = [UIColor grayColor].CGColor;
    _sureButton.layer.borderWidth = 1 * H;
}
- (void)cancelAction {
    [self.cancelDelegate cancelAddFriends:_titleLabel.text];
}
- (void)sureAction {
    [self.sureDelegate sureAddFriends:_titleLabel.text];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
