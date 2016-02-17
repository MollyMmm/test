//
//  AddViewController.h
//  MobileSchool
//
//  Created by Apple on 16/1/27.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AddViewControllerDelegate
- (void)getaddArr:(NSMutableArray *)arr;

@end
@interface AddViewController: UIViewController
@property (nonatomic,assign)id addArrDelegate;
@property (nonatomic, strong)NSMutableArray *addArr;
@property (nonatomic, strong)NSMutableArray *noAddArr;

@end
