//
//  CommentTableViewCell.m
//  MobileSchool
//
//  Created by Apple on 16/2/18.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "CommentTableViewCell.h"

@implementation CommentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    _peopleImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_peopleImageView];
    _peopleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_peopleLabel];
    _timeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_timeLabel];
    _fromLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_fromLabel];
    
    _contentLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_contentLabel];
    
    
    
    
    
}

+ (CommentTableViewCell *)commentTableViewCell:(UITableView *)tableView {
    static NSString *reuse = @"Comreuse";
    CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[CommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    _peopleImageView.frame = CGRectMake(10 * W, 10 * H, 50 * W, 50 * H);
    _peopleImageView.layer.cornerRadius = 25 * H;
    _peopleImageView.image = [UIImage imageNamed:@"头像"];
    _peopleImageView.backgroundColor = [UIColor orangeColor];
    _peopleImageView.layer.masksToBounds = YES;
    _peopleLabel.frame = CGRectMake(70 * W, 20 * H, 200 * W, 30 * H);
    _peopleLabel.text = @"尹直富";
    _fromLabel.frame = CGRectMake(kScreenWidth * 3 / 4, 40 * H, 200 * W, 30 * H);
    _fromLabel.text = @"👍";
    
    _contentLabel.text = @"评论测试";
    _contentLabel.frame = CGRectMake(10 * W, 80 * H, 200 * W, 30 * H);
    
    
    _timeLabel.frame = CGRectMake(kScreenWidth * 3 / 4, 10 * H, 200 * W, 30 * H);
    _timeLabel.text = @"昨天20:01";
    _timeLabel.font = [UIFont systemFontOfSize:15 * H];
    _timeLabel.textColor = [UIColor grayColor];
    
    
    
    UILabel *grayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 110 * H, kScreenWidth, 10 * H)];
    grayLabel.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:grayLabel];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
