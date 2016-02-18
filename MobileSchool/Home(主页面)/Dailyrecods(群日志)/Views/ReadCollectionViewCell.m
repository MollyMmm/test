//
//  ReadCollectionViewCell.m
//  MobileSchool
//
//  Created by Apple on 16/2/18.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "ReadCollectionViewCell.h"

@implementation ReadCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, (kScreenWidth - 30 * W - 30 * H) / 5 - 20 * W, (kScreenWidth - 30 * W - 30 * H) / 5 - 20 * W)];
        _imageView.layer.cornerRadius = ((kScreenWidth - 30 * W - 30 * H) / 5 - 20 * W ) / 2;
        _imageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_imageView];
        _imageView.image = [UIImage imageNamed:@"头像"];
    }
    return self;
}
@end
