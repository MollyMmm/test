//
//  RemindTableViewCell.h
//  MobileSchool
//
//  Created by Apple on 16/2/3.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RTLabel.h"

@interface RemindTableViewCell : UITableViewCell
@property (nonatomic, strong) RTLabel *rtLabel;
+ (RTLabel*)textLabel;

@end
