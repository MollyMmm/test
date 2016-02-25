//
//  AddFriendsTableViewCell.h
//  MobileSchool
//
//  Created by Apple on 16/2/25.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CancelAddFriendsDelegate

- (void)cancelAddFriends:(NSString *)name;

@end

@protocol SureAddFriendsDelegate <NSObject>

- (void)sureAddFriends:(NSString *)name;

@end
@interface AddFriendsTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *sureButton;
@property (nonatomic, strong) id<SureAddFriendsDelegate>sureDelegate;
@property (nonatomic, strong) id<CancelAddFriendsDelegate>cancelDelegate;

@end
