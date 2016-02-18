//
//  ReadTableViewCell.m
//  MobileSchool
//
//  Created by Apple on 16/2/18.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "ReadTableViewCell.h"

@implementation ReadTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    return self;
}
- (void)createView {
    _readImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_readImageView];
}
- (void)layoutSubviews {
    _readImageView.frame = CGRectMake(0, 10, kScreenWidth / 4, 50 * H);
    _readImageView.image = [UIImage imageNamed:@"阅读"];
}
+ (ReadTableViewCell *)tableViewCell:(UITableView *)tableView {
    static NSString *reuse = @"ReadReuse";
    ReadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[ReadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    }
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
