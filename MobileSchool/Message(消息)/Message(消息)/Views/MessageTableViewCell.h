//
//  MessageTableViewCell.h
//  MobileSchool
//
//  Created by Molly on 16/2/1.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *textLbl;
@property (weak, nonatomic) IBOutlet UILabel *detailTextLbl;
@property (weak, nonatomic) IBOutlet UILabel *timeLbl;

@end
