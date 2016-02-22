//
//  OtherPeopleSendWorkTableViewCell.m
//  MobileSchool
//
//  Created by Apple on 16/2/22.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "OtherPeopleSendWorkTableViewCell.h"

@implementation OtherPeopleSendWorkTableViewCell

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
    _peopleImageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OtherPeopleDetailAction)];
    
    [_peopleImageView addGestureRecognizer:ges];
    
    _peopleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_peopleLabel];
    _timeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_timeLabel];
    _fromLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_fromLabel];
    _fromLabel.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ToGroupAction)];
    [_fromLabel addGestureRecognizer:tap];
    _contentLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_contentLabel];
    _whoCanSeeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_whoCanSeeLabel];
    _whoCanSeeLabel.text = @"◎全员可见";
    _whoCanSeeLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_whoCanSeeLabel];
    
}
- (void)OtherPeopleDetailAction {
    
    [self.delegate pushToDetail:_peopleLabel.text];
}
- (void)ToGroupAction {
    [self.groupDelegate pushToOtherGroup:_fromLabel.text];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    _peopleImageView.frame = CGRectMake(10 * W, 10 * H, 50 * W, 50 * H);
    _peopleImageView.layer.cornerRadius = 25 * H;
    _peopleImageView.image = [UIImage imageNamed:@"用户头像"];
    _peopleImageView.backgroundColor = [UIColor orangeColor];
    _peopleImageView.layer.masksToBounds = YES;
    _peopleLabel.frame = CGRectMake(70 * W, 10 * H, 200 * W, 30 * H);
    _peopleLabel.text = @"某某某";
    _fromLabel.frame = CGRectMake(70 * W, 30 * H, 200 * W, 30 * H);
    _fromLabel.text = @"发表于让梦起飞";
    _fromLabel.textColor = [UIColor redColor];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_fromLabel.text];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 3)];
    _fromLabel.font = [UIFont systemFontOfSize:15 * H];
    _fromLabel.attributedText = attributedString;
    _contentLabel.frame = CGRectMake(10 * W, 60 * H, kScreenWidth - 20 * W, 100 * H);
    _contentLabel.text = @"测试：别人发表的通知";
    _whoCanSeeLabel.frame = CGRectMake(10 * W, 150 * H, kScreenWidth, 40 * H);
    UILabel *commentLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth * 2 / 4, 200 * H, 1 * W, 20 * H)];
    [self.contentView addSubview:commentLineLabel];
    _timeLabel.frame = CGRectMake(kScreenWidth * 3 / 4, 10 * H, 200 * W, 30 * H);
    _timeLabel.text = @"昨天20:01";
    _timeLabel.font = [UIFont systemFontOfSize:15 * H];
    _timeLabel.textColor = [UIColor grayColor];
    
    UILabel *grayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 190 * H, kScreenWidth, 10 * H)];
    grayLabel.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:grayLabel];
}
+ (OtherPeopleSendWorkTableViewCell *)tableViewCell:(UITableView *)otherTableView {
    static NSString *reuse = @"otherUse";
    OtherPeopleSendWorkTableViewCell *cell = [otherTableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[OtherPeopleSendWorkTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
