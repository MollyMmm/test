//
//  HomeCollectionViewCell.h
//  MobileSchool
//
//  Created by Apple on 16/1/27.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol cancelDelegate

- (void)cancelName:(NSString *)name;

@end
@interface HomeCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *titleImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *cancelImageView;
@property (nonatomic, strong) id<cancelDelegate>delegate;

@end
