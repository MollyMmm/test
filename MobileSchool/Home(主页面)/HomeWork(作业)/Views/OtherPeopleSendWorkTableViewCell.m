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
    _peopleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_peopleLabel];
    _timeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_timeLabel];
    _fromLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_fromLabel];
    _homeWorkTimeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_homeWorkTimeLabel];
    _subjectLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_subjectLabel];
    _contentLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_contentLabel];
    _whoCanSeeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_whoCanSeeLabel];
    _whoCanSeeLabel.text = @"◎全员可见";
    _whoCanSeeLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_whoCanSeeLabel];
    
    _passButton = [[UILabel alloc] init];
    _passButton.text = @"不用线上提交";
    _passButton.font = [UIFont systemFontOfSize:17 * H];
    _passButton.textColor = [UIColor grayColor];
    [self.contentView addSubview:_passButton];
    
    _signButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_signButton setTitle:@"☑️未签收" forState:UIControlStateNormal];
    _signButton.tintColor = [UIColor redColor];
    [self.contentView addSubview:_signButton];
    [_signButton addTarget:self action:@selector(signAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    
}
- (void)signAction  {
    [_signButton setTitle:@"☑️已签收" forState:UIControlStateNormal];
    _signButton.tintColor = [UIColor grayColor];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    _peopleImageView.frame = CGRectMake(10 * W, 10 * H, 50 * W, 50 * H);
    _peopleImageView.layer.cornerRadius = 25 * H;
    _peopleImageView.image = [UIImage imageNamed:@"头像"];
    _peopleImageView.backgroundColor = [UIColor yellowColor ];
    _peopleImageView.layer.masksToBounds = YES;
    _peopleImageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapImage = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TODetailInformation)];
    [_peopleImageView addGestureRecognizer:tapImage];

    
    _peopleLabel.frame = CGRectMake(70 * W, 10 * H, 200 * W, 30 * H);
    _peopleLabel.text = @"某某某";
    _fromLabel.frame = CGRectMake(70 * W, 30 * H, 200 * W, 30 * H);
    _fromLabel.text = @"发表于天天向上";
    
    _signButton.frame = CGRectMake(kScreenWidth * 3 / 4, 190 * H, 100 * W, 40 * H);
    
    _fromLabel.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ToGroupAction)];
    [_fromLabel addGestureRecognizer:tap];
    
    
    _fromLabel.textColor = [UIColor redColor];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_fromLabel.text];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 3)];
    _fromLabel.font = [UIFont systemFontOfSize:15 * H];
    _fromLabel.attributedText = attributedString;
    _homeWorkTimeLabel.frame = CGRectMake(10 * W, 70 * H, 250 * W, 40 * H);
    _homeWorkTimeLabel.text = @"交作业时间：2016-02-04 08:00";
    _subjectLabel.frame = CGRectMake(kScreenWidth * 3 / 4, 70 * H, 100 * W, 40 * H);
    _subjectLabel.text = @"乌龙";
    _contentLabel.frame = CGRectMake(10 * W, 70 * H, kScreenWidth - 20 * W, 100 * H);
    _contentLabel.text = @"写一搜故事";
    _whoCanSeeLabel.frame = CGRectMake(10 * W, 150 * H, kScreenWidth, 40 * H);
    _timeLabel.frame = CGRectMake(kScreenWidth * 3 / 4, 10 * H, 200 * W, 30 * H);
    _timeLabel.text = @"昨天20:01";
    _timeLabel.font = [UIFont systemFontOfSize:15 * H];
    _timeLabel.textColor = [UIColor grayColor];
    
    _passButton.frame = CGRectMake(10 * W, 190 * H, kScreenWidth / 3, 40 * H);
    
    UILabel *grayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 230 * H, kScreenWidth, 10 * H)];
    grayLabel.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:grayLabel];
}
- (void)TODetailInformation {
    [self.delegate pushToDetail:_peopleLabel.text];
}
- (void)ToGroupAction {
    [self.groupDelegate pushToOtherGroup:_fromLabel.text];
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
