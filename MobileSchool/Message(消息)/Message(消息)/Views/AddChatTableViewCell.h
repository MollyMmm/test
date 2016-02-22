//
//  AddChatTableViewCell.h
//  MobileSchool
//
//  Created by Molly on 16/2/22.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddChatTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *chooseImg;
@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;

@property(nonatomic) bool selectd;

@end
