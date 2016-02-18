//
//  OtherPeopleNotificationTableViewCell.h
//  MobileSchool
//
//  Created by Apple on 16/2/18.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OtherPeopleDetailInformationDelegate <NSObject>

- (void)pushToDetail:(NSString *)name;

@end

@protocol ToGroupDelegate <NSObject>

- (void)pushToGroup:(NSString *)Group;

@end
@interface OtherPeopleNotificationTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *peopleImageView;
@property (nonatomic, strong) UILabel *peopleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *fromLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *whoCanSeeLabel;
@property (nonatomic, strong) id<OtherPeopleDetailInformationDelegate>delegate;
@property (nonatomic, strong) id<ToGroupDelegate>groupDelegate;

+ (OtherPeopleNotificationTableViewCell *)otherPeopleNotificationTableViewCell:(UITableView *)tableView;


@end
