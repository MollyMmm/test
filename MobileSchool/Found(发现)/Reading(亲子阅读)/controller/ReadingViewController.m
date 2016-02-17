//
//  ReadingViewController.m
//  MobileSchool
//
//  Created by 李公博 on 16/1/27.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ReadingViewController.h"
#import "ReadingCell.h"
#import "LongReadingCell.h"
@interface ReadingViewController()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@end

@implementation ReadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"亲子阅读";
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(pressCancleBtn:)];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftBar;
    

    
    [self createTableview];
}

-(void)createTableview
{
    _tableView.delegate = self;
    _tableView.dataSource = self;
    //设置cell之间无线
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

}
-(void)pressCancleBtn:(UIButton *)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
//    
//    if (indexPath.section == 0) {
//        ReadingCell *readingCell = [tableView dequeueReusableCellWithIdentifier:cellName];
//        if(!readingCell)
//        {
//            readingCell = [[[NSBundle mainBundle] loadNibNamed:@"ReadingCell" owner:self options:nil] lastObject];
//        }
//        readingCell.selectionStyle = UITableViewCellSelectionStyleNone;
//        readingCell.cellLabel.text = @"ohehe";
//        NSString* date;
//        NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
//        [formatter setDateFormat:@"hh:mm"];
//        date = [formatter stringFromDate:[NSDate date]];
//        readingCell.timeLabel.layer.cornerRadius = 30;
//        readingCell.timeLabel.text = date;
//        return readingCell;

   // }else{
    LongReadingCell *longCell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if(!longCell)
    {
        longCell = [[[NSBundle mainBundle] loadNibNamed:@"LongReadingCell" owner:self options:nil] lastObject];
        
    }
    longCell.selectionStyle = UITableViewCellSelectionStyleNone;
    longCell.timeLabel.text = @"ohehe";

    return longCell;
   // }
    
    
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
