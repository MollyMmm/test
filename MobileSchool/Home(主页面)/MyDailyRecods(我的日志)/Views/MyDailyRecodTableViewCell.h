//
//  MyDailyRecodTableViewCell.h
//  MobileSchool
//
//  Created by Apple on 16/2/3.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol mydailyRecodDelegate

- (void)getNumber:(int)number;

@end
@interface MyDailyRecodTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *peopleImageView;
@property (nonatomic, strong) UILabel *peopleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *fromLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIButton *passButton;
@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UIButton *readButton;
@property (nonatomic, strong) UIButton *supportButton;

@property (nonatomic, strong) UILabel *myFromLabel;
@property (nonatomic, strong) UILabel *myTimeLabel;
@property (nonatomic, strong) UILabel *myCommentLabel;

@property (nonatomic, strong) id<mydailyRecodDelegate>delegate;

@end
