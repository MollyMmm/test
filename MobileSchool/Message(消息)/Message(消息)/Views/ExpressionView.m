//
//  ExpressionView.m
//  MobileSchool
//
//  Created by Molly on 16/2/20.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "ExpressionView.h"
@interface ExpressionView(){

}
@end
@implementation ExpressionView

+(ExpressionView *)instanceView{

    ExpressionView *expressinView = [[NSBundle mainBundle] loadNibNamed:@"ExpressionView" owner:nil options:nil][0];
    return expressinView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
