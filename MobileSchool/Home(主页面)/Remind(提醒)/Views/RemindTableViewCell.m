//
//  RemindTableViewCell.m
//  MobileSchool
//
//  Created by Apple on 16/2/3.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "RemindTableViewCell.h"

@implementation RemindTableViewCell
@synthesize rtLabel = _rtLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
        _rtLabel = [RemindTableViewCell textLabel];
        [self.contentView addSubview:_rtLabel];
        [_rtLabel setBackgroundColor:[UIColor clearColor]];
        
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize optimumSize = [self.rtLabel optimumSize];
    CGRect frame = [self.rtLabel frame];
    frame.size.height = (int)optimumSize.height+5; // +5 to fix height issue, this should be automatically fixed in iOS5
    [self.rtLabel setFrame:frame];
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * W, 15 * H + _rtLabel.frame.size.height, kScreenWidth - 20 * W, 1 * H)];
    lineLabel.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:lineLabel];
    
}

+ (RTLabel*)textLabel
{
    RTLabel *label = [[RTLabel alloc] initWithFrame:CGRectMake(10 * W,10 * H,kScreenWidth - 20 * W,100 * H)];
    //[label setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:20]];
    [label setParagraphReplacement:@""];
    return label;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)awakeFromNib {
    // Initialization code
}

@end
