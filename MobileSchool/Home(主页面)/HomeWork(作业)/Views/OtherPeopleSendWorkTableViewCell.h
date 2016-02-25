//
//  OtherPeopleSendWorkTableViewCell.h
//  MobileSchool
//
//  Created by Apple on 16/2/22.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol OtherPeopleDetailInformationDelegate <NSObject>

- (void)pushToDetail:(NSString *)name;

@end

@protocol OtherToGroupDelegate <NSObject>

- (void)pushToOtherGroup:(NSString *)Group;

@end

@interface OtherPeopleSendWorkTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *peopleImageView;
@property (nonatomic, strong) UILabel *peopleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *fromLabel;

@property (nonatomic, strong) UILabel *homeWorkTimeLabel;
@property (nonatomic, strong) UILabel *subjectLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UILabel *passButton;

@property (nonatomic, strong) UIButton *signButton;


@property (nonatomic, strong) UILabel *whoCanSeeLabel;
@property (nonatomic, strong) id<OtherPeopleDetailInformationDelegate>delegate;
@property (nonatomic, strong) id<OtherToGroupDelegate>groupDelegate;

+ (OtherPeopleSendWorkTableViewCell *)tableViewCell:(UITableView *)otherTableView;

@end
