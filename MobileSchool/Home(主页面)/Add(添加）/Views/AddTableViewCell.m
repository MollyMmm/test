//
//  AddTableViewCell.m
//  MobileSchool
//
//  Created by Apple on 16/2/15.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "AddTableViewCell.h"

@implementation AddTableViewCell
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
    
    _addButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.contentView addSubview:_addButton];
    [_addButton addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 45 * H, kScreenWidth, 1 * H)];
    lineLabel.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:lineLabel];
}
- (void)layoutSubviews {
    _headerImageView.frame = CGRectMake(10 * W, 5 * H, 30 * H, 30 * H);
    _headerImageView.layer.cornerRadius = 15;
    _headerImageView.layer.masksToBounds = YES;
    _headerImageView.backgroundColor = [UIColor yellowColor];
    
    _addButton.frame = CGRectMake(kScreenWidth - 60 * W, 5 * H, 50 * W, 30 * H);
    _titleLabel.frame = CGRectMake(20 * W + 30 * H, 0, 100, 40);
    _addButton.layer.cornerRadius = 10 * H;
}
- (void)addAction {
    [_addButton setTitle:@"已添加" forState:UIControlStateNormal];
    _addButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [_addButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.delegate addAction:_titleLabel.text];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
