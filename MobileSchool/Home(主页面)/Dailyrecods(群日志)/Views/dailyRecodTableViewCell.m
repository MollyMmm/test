//
//  dailyRecodTableViewCell.m
//  MobileSchool
//
//  Created by Apple on 16/2/1.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "dailyRecodTableViewCell.h"


@implementation dailyRecodTableViewCell

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
    
    _passButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_passButton setTitle:@"转发" forState:UIControlStateNormal];
    [_passButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_passButton addTarget:self action:@selector(passAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_passButton];
    
    _commentButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_commentButton setTitle:@"评价" forState:UIControlStateNormal];
    [_commentButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_commentButton addTarget:self action:@selector(commentAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_commentButton];
    
    _supportButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_supportButton setTitle:@"👍赞3" forState:UIControlStateNormal];
    [_supportButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_supportButton addTarget:self action:@selector(supportAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_supportButton];
    
    _readButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_readButton setTitle:@"阅读10＋" forState:UIControlStateNormal];
    [_readButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_readButton addTarget:self action:@selector(readAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_readButton];
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    
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
    _passButton.frame = CGRectMake(0, 190 * H, kScreenWidth / 4, 40 * H);
    UILabel *passLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth / 4, 200 * H, 1 * W, 20 * H)];
    [self.contentView addSubview:passLineLabel];
    passLineLabel.backgroundColor = [UIColor grayColor];
    _commentButton.frame = CGRectMake(kScreenWidth / 4, 190 * H, kScreenWidth / 4, 40 * H);
    UILabel *commentLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth * 2 / 4, 200 * H, 1 * W, 20 * H)];
    [self.contentView addSubview:commentLineLabel];
    commentLineLabel.backgroundColor = [UIColor grayColor];
    _supportButton.frame = CGRectMake(kScreenWidth * 3 / 4, 190 * H, kScreenWidth / 4, 40 * H);
    UILabel *supportLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth * 3 / 4, 200 * H, 1 * W, 20 * H)];
    [self.contentView addSubview:supportLineLabel];
    supportLineLabel.backgroundColor = [UIColor grayColor];
    _readButton.frame = CGRectMake(kScreenWidth / 2, 190 * H, kScreenWidth / 4, 40 * H);
    _timeLabel.frame = CGRectMake(kScreenWidth * 3 / 4, 10 * H, 200 * W, 30 * H);
    _timeLabel.text = @"昨天20:01";
    _timeLabel.font = [UIFont systemFontOfSize:15 * H];
    _timeLabel.textColor = [UIColor grayColor];
    
    UILabel *grayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 230 * H, kScreenWidth, 10 * H)];
    grayLabel.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:grayLabel];
}
- (void)passAction {
    NSLog(@"转发");
    [self.delegate getNumber:1];
//    [_commentButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [_supportButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [_readButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [_passButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
}
- (void)commentAction {
    NSLog(@"评价");
    [self.delegate getNumber:2];
//    [_commentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [_supportButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [_passButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [_readButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
}
- (void)supportAction {
    NSLog(@"赞");
    [self.delegate getNumber:4];
//    [_supportButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [_commentButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [_passButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [_readButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
}
- (void)readAction {
    NSLog(@"阅读");
    [self.delegate getNumber:3];
//    [_commentButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [_passButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [_supportButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [_readButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
