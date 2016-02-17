//
//  LongReadingCell.m
//  MobileSchool
//
//  Created by 李公博 on 16/1/30.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LongReadingCell.h"
#import "LongTableViewCell.h"
@implementation LongReadingCell

- (void)awakeFromNib {
    // Initialization code
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    
}

}
-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    self.timeLabel.layer.cornerRadius = 5;
    self.timeLabel.clipsToBounds = YES;
    
    self.imageButton.layer.cornerRadius = 3;
    self.imageButton.clipsToBounds = YES;
    
}
- (IBAction)clickButton:(id)sender {
    
    NSLog(@"点击image按钮");
}


#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellName = @"cell";
    
    
        LongTableViewCell *readingCell = [tableView dequeueReusableCellWithIdentifier:cellName];
        
        if(readingCell == nil)
        {
            readingCell = [[[NSBundle mainBundle] loadNibNamed:@"LongTableViewCell" owner:self options:nil] lastObject];
        }
        readingCell.selectionStyle = UITableViewCellSelectionStyleNone;
   
    readingCell.cellLabel.text = @"ohehe" ;
    //readingCell.cellLabel.text = @"有值";
    UIImage *image = [UIImage imageNamed:@"001"];
    readingCell.cellImage.image = image;
    
    
    return readingCell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
    NSLog(@"点击");
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
