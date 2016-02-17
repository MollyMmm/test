//
//  AddTableViewCell.h
//  MobileSchool
//
//  Created by Apple on 16/2/15.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddDelegate <NSObject>

- (void)addAction:(NSString *)name;

@end

@interface AddTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) id<AddDelegate>delegate;

@end
