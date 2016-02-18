//
//  HeaderView.m
//  MobileSchool
//
//  Created by Apple on 16/2/17.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}
- (void)createView {
    _peopleImageView = [[UIImageView alloc] init];
    [self addSubview:_peopleImageView];
    _peopleLabel = [[UILabel alloc] init];
    [self addSubview:_peopleLabel];
    _timeLabel = [[UILabel alloc] init];
    [self addSubview:_timeLabel];
    _fromLabel = [[UILabel alloc] init];
    [self addSubview:_fromLabel];
    _homeWorkTimeLabel = [[UILabel alloc] init];
    [self addSubview:_homeWorkTimeLabel];
    _subjectLabel = [[UILabel alloc] init];
    [self addSubview:_subjectLabel];
    _contentLabel = [[UILabel alloc] init];
    [self addSubview:_contentLabel];
    _whoCanSeeLabel = [[UILabel alloc] init];
    [self addSubview:_whoCanSeeLabel];
    _whoCanSeeLabel.text = @"◎全员可见";
    _whoCanSeeLabel.textColor = [UIColor grayColor];
    [self addSubview:_whoCanSeeLabel];
    
    _peopleImageView.frame = CGRectMake(10 * W, 10 * H, 50 * W, 50 * H);
    _peopleImageView.layer.cornerRadius = 25 * H;
    _peopleImageView.image = [UIImage imageNamed:@"头像"];
    _peopleImageView.backgroundColor = [UIColor orangeColor];
    _peopleImageView.layer.masksToBounds = YES;
    _peopleLabel.frame = CGRectMake(70 * W, 10 * H, 200 * W, 30 * H);
    _peopleLabel.text = @"尹直富";
    _fromLabel.frame = CGRectMake(70 * W, 30 * H, 200 * W, 30 * H);
    _fromLabel.text = @"发表于开心乐园";
    
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
    _subjectLabel.text = @"语文";
    _contentLabel.frame = CGRectMake(10 * W, 70 * H, kScreenWidth - 20 * W, 100 * H);
    _contentLabel.text = @"反对是非得失个地方不符合德国的方法";
    _whoCanSeeLabel.frame = CGRectMake(10 * W, 150 * H, kScreenWidth, 40 * H);
    _timeLabel.frame = CGRectMake(kScreenWidth * 3 / 4, 10 * H, 200 * W, 30 * H);
    _timeLabel.text = @"昨天20:01";
    _timeLabel.font = [UIFont systemFontOfSize:15 * H];
    _timeLabel.textColor = [UIColor grayColor];
    
}
- (void)ToGroupAction {
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
