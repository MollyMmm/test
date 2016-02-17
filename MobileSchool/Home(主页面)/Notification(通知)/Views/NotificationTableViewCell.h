//
//  NotificationTableViewCell.h
//  MobileSchool
//
//  Created by Apple on 16/2/3.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol notificationDelegate
- (void)readOrNot:(int)sender;

@end
@interface NotificationTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *peopleImageView;
@property (nonatomic, strong) UILabel *peopleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *fromLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *whoCanSeeLabel;
@property (nonatomic, strong) UIButton *haveReadedButton;
@property (nonatomic, strong) UIButton *notReadButton;
@property (nonatomic, assign) id<notificationDelegate> Delegate;

@end
