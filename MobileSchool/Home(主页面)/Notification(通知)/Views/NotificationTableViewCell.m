//
//  NotificationTableViewCell.m
//  MobileSchool
//
//  Created by Apple on 16/2/3.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "NotificationTableViewCell.h"

@implementation NotificationTableViewCell

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
    _whoCanSeeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_whoCanSeeLabel];
    _whoCanSeeLabel.text = @"◎全员可见";
    _whoCanSeeLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_whoCanSeeLabel];
    
    _haveReadedButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_haveReadedButton setTitle:@"已读2" forState:UIControlStateNormal];
    [_haveReadedButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_haveReadedButton addTarget:self action:@selector(haveReadedAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_haveReadedButton];
    
    
    _notReadButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_notReadButton setTitle:@"未读2" forState:UIControlStateNormal];
    [_notReadButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_notReadButton addTarget:self action:@selector(notReadAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_notReadButton];
    }
- (void)layoutSubviews {
    [super layoutSubviews];
    _peopleImageView.frame = CGRectMake(10 * W, 10 * H, 50 * W, 50 * H);
    _peopleImageView.layer.cornerRadius = 25 * H;
    _peopleImageView.image = [UIImage imageNamed:@"头像"];
    _peopleImageView.backgroundColor = [UIColor orangeColor];
    _peopleImageView.layer.masksToBounds = YES;
    _peopleLabel.frame = CGRectMake(70 * W, 10 * H, 200 * W, 30 * H);
    _peopleLabel.text = @"尹直富";
    _fromLabel.frame = CGRectMake(70 * W, 30 * H, 200 * W, 30 * H);
    _fromLabel.text = @"发表于开心乐园";
    _fromLabel.textColor = [UIColor redColor];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_fromLabel.text];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 3)];
    _fromLabel.font = [UIFont systemFontOfSize:15 * H];
    _fromLabel.attributedText = attributedString;
    _contentLabel.frame = CGRectMake(10 * W, 80 * H, kScreenWidth - 20 * W, 100 * H);
    _contentLabel.text = @"反对是非得失个地方不符合德国的方法";
    _whoCanSeeLabel.frame = CGRectMake(10 * W, 150 * H, kScreenWidth, 40 * H);
    _haveReadedButton.frame = CGRectMake(0, 190 * H, kScreenWidth / 4, 40 * H);
    UILabel *passLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth / 4, 200 * H, 1 * W, 20 * H)];
    [self.contentView addSubview:passLineLabel];
    passLineLabel.backgroundColor = [UIColor grayColor];
    _notReadButton.frame = CGRectMake(kScreenWidth / 4, 190 * H, kScreenWidth / 4, 40 * H);
    UILabel *commentLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth * 2 / 4, 200 * H, 1 * W, 20 * H)];
    [self.contentView addSubview:commentLineLabel];
        _timeLabel.frame = CGRectMake(kScreenWidth * 3 / 4, 10 * H, 200 * W, 30 * H);
    _timeLabel.text = @"昨天20:01";
    _timeLabel.font = [UIFont systemFontOfSize:15 * H];
    _timeLabel.textColor = [UIColor grayColor];
    
    UILabel *grayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 230 * H, kScreenWidth, 10 * H)];
    grayLabel.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:grayLabel];
}
- (void)haveReadedAction {
    NSLog(@"已读");
//    [_notReadButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [_haveReadedButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.Delegate readOrNot:YES];
    
}
- (void)notReadAction {
    NSLog(@"未读");
//    [_notReadButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [_haveReadedButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.Delegate readOrNot:NO];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
