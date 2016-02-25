//
//  HomeCollectionViewCell.m
//  MobileSchool
//
//  Created by Apple on 16/1/27.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "HomeCollectionViewCell.h"



@implementation HomeCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth / 3, (kScreenHeight - 64 - 49)/ 4)];
        [self.contentView addSubview:backView];
        _titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60 * W, 60 * H)];
        _titleImageView.layer.cornerRadius = 30 * H;
        _titleImageView.layer.masksToBounds = YES;
        _titleImageView.backgroundColor = [UIColor yellowColor];
        [backView addSubview:_titleImageView];
        _titleImageView.center = CGPointMake(backView.frame.size.width / 2, backView.frame.size.height / 2);
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _titleImageView.frame.size.height + 35 * H, kScreenWidth / 3, 40 * H)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
        _cancelImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10 * H, 10 * H, 30 * H, 30 * H)];
        _cancelImageView.image = [UIImage imageNamed:@"删除"];;
        [self.contentView addSubview:_cancelImageView];
        _cancelImageView.hidden = YES;
        _cancelImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelAction)];
        [_cancelImageView addGestureRecognizer:tap];

    }
    return self;
    
}
- (void)cancelAction {
    if (_cancelImageView.hidden) {
        
    } else {
    NSLog(@"删除");
        [self.delegate cancelName:_titleLabel.text];
    }
}

@end
