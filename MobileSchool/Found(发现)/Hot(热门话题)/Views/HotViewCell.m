//
//  HotViewCell.m
//  MobileSchool
//
//  Created by 李公博 on 16/2/1.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "HotViewCell.h"
#import "MoreTableViewCell.h"
@implementation HotViewCell

- (void)awakeFromNib {
    // Initialization code
    _moreTableView.delegate = self;
    _moreTableView.dataSource = self;
    _moreTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (IBAction)clickButton:(id)sender {
    
    NSLog(@"点击按钮了");
}

#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellName = @"cell";
    
    
    MoreTableViewCell *moreViewCell = [tableView dequeueReusableCellWithIdentifier:cellName];
    
    if(moreViewCell == nil)
    {
        moreViewCell = [[[NSBundle mainBundle] loadNibNamed:@"MoreTableViewCell" owner:self options:nil] lastObject];
    }
    moreViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
   // moreViewCell.timeLabel.text = @"ohehe" ;
    
    moreViewCell.contentLabel.text = @"ahaha";
    
    moreViewCell.newsImage.image = [UIImage imageNamed:@"001"];

    
    return moreViewCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"ohehehehehehe");
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
