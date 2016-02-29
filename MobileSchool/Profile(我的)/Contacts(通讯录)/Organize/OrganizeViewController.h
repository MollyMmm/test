//
//  OrganizeViewController.h
//  MobileSchool
//
//  Created by Molly on 16/2/26.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Node;

@protocol TreeTableCellDelegate <NSObject>

-(void)cellClick : (Node *)node;

@end


@interface OrganizeViewController : UIViewController

@property (nonatomic , weak) id<TreeTableCellDelegate> treeTableCellDelegate;

@end
