//
//  HeaderView.h
//  MobileSchool
//
//  Created by Apple on 16/2/17.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ToGroupDelegate

- (void)pushToGroup:(NSString *)groupName;



@end
@interface HeaderView : UIView
@property (nonatomic, strong) UIImageView *peopleImageView;
@property (nonatomic, strong) UILabel *peopleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *fromLabel;

@property (nonatomic, strong) UILabel *homeWorkTimeLabel;
@property (nonatomic, strong) UILabel *subjectLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UILabel *whoCanSeeLabel;

@property (nonatomic, strong) id<ToGroupDelegate>toGroupDelegate;

@end
