//
//  HotViewController.h
//  MobileSchool
//
//  Created by 李公博 on 16/1/27.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic ,strong)NSMutableArray *dataSource;
@end
