//
//  HotViewController.m
//  MobileSchool
//
//  Created by 李公博 on 16/1/27.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "HotViewController.h"
#import "HotViewCell.h"
@interface HotViewController ()

@end

@implementation HotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"热门话题";
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(pressCancleBtn:)];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftBar;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    //设置cell之间无线
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellName = @"cell";
    
    
    HotViewCell *hotViewCell = [tableView dequeueReusableCellWithIdentifier:cellName];
    
    if(hotViewCell == nil)
    {
        hotViewCell = [[[NSBundle mainBundle] loadNibNamed:@"HotViewCell" owner:self options:nil] lastObject];
    }
    hotViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    hotViewCell.timeLabel.text = @"ohehe" ;
    
    hotViewCell.contentLabel.text = @"ahaha";
    
    
    
    UIImage *image = [UIImage imageNamed:@""];
   // hotViewCell.cellImage.image = image;
    
    
    return hotViewCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 525;
    
}



-(void)pressCancleBtn:(UIButton *)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
