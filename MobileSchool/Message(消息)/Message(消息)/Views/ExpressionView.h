//
//  ExpressionView.h
//  MobileSchool
//
//  Created by Molly on 16/2/20.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpressionView : UIView
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

+ (ExpressionView *)instanceView;
@end
