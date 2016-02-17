//
//  InterviewViewController.m
//  MobileSchool
//
//  Created by 李公博 on 16/1/27.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "InterviewViewController.h"
#import "InterviewCell.h"
#import "LongInterviewCell.h"
@interface InterviewViewController ()
@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation InterviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"校外访谈";
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(pressCancleBtn:)];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftBar;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    //设置cell之间无线
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

}


#pragma mark - UITableViewDelegate & DataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //return [self.dataSource[indexPath.row] cellHeight];
    
    return 525;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellName = @"cell";
    
//        if (indexPath.section == 0) {
//            InterviewCell *interViewCell = [tableView dequeueReusableCellWithIdentifier:cellName];
//            if(!interViewCell)
//            {
//                interViewCell = [[[NSBundle mainBundle] loadNibNamed:@"InterviewCell" owner:self options:nil] lastObject];
//                
//            }
//            interViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
//            interViewCell.timeLabel.text = @"ohehe";
//            interViewCell.cellLabel.text = @"ahaha";
//            
//            return interViewCell;
//    
//     }else{
    LongInterviewCell *longInterViewCell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if(!longInterViewCell)
    {
        longInterViewCell = [[[NSBundle mainBundle] loadNibNamed:@"LongInterviewCell" owner:self options:nil] lastObject];
        
    }
    longInterViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    longInterViewCell.timeLabel.text = @"ohehe";
    longInterViewCell.cellLabel.text = @"ahaha";
    
    return longInterViewCell;
//     }
    
    
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
