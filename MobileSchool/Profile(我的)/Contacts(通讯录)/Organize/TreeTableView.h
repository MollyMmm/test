//
//  TreeTableView.h
//  MobileSchool
//
//  Created by Molly on 16/2/25.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Node;
@protocol TreeTableCellDelegate <NSObject>

- (void)cellClick : (Node *)node;

@end

@interface TreeTableView : UITableView

@property (weak, nonatomic) id<TreeTableCellDelegate>  treeTableCellDelegate;

- (instancetype)initWithFrame:(CGRect)frame withData:(NSArray *)data;

@end
