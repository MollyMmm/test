//
//  RecodesTableViewCell.h
//  MobileSchool
//
//  Created by Apple on 16/2/3.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol recodesDelegate
- (void)getNumber:(int)number;

@end
@interface RecodesTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *peopleImageView;
@property (nonatomic, strong) UILabel *peopleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *fromLabel;

@property (nonatomic, strong) UILabel *homeWorkTimeLabel;
@property (nonatomic, strong) UILabel *subjectLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UILabel *whoCanSeeLabel;

@property (nonatomic, strong) UIButton *passButton;
@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UIButton *readButton;
@property (nonatomic, strong) UIButton *supportButton;

@property (nonatomic, strong) id<recodesDelegate>delegate;


@end
