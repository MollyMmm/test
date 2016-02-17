//
//  RemindViewController.m
//  MobileSchool
//
//  Created by Apple on 16/1/29.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "RemindViewController.h"
#import "RTLabel.h"
#import "RemindTableViewCell.h"
@interface RemindViewController ()<UITableViewDataSource,UITableViewDelegate,RTLabelDelegate>
@property (nonatomic, strong) UISegmentedControl *segmentControl;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITableView *notReadTableView;


@end

@implementation RemindViewController
- (void)viewWillAppear:(BOOL)animated {
#pragma mark
    NSArray *segmentArr = [NSArray arrayWithObjects:@"全部消息",@"待处理", nil];
    _segmentControl = [[UISegmentedControl alloc] initWithItems:segmentArr];
    _segmentControl.frame = CGRectMake(0, 0, 150 * W, 30 * H);
    _segmentControl.selectedSegmentIndex = 0;
    _segmentControl.tintColor = [UIColor blueColor];
    _segmentControl.layer.borderWidth = 1;
    _segmentControl.layer.borderColor = [UIColor blueColor].CGColor;
    [_segmentControl addTarget:self action:@selector(segmentControlAction:) forControlEvents:UIControlEventValueChanged];
    [self.navigationItem setTitleView:_segmentControl];
    _segmentControl.layer.cornerRadius = 10 * H;
    _segmentControl.layer.masksToBounds = YES;
    
    self.hidesBottomBarWhenPushed = YES;
    
}
- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [_segmentControl removeFromSuperview];
    
    
}
- (void)segmentControlAction:(id)sender {
    NSInteger selectedIndex = [_segmentControl selectedSegmentIndex];
    if (selectedIndex == 0) {
        _tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        _notReadTableView.frame = CGRectMake(0, 0, 0, 0);
    } else {
        _notReadTableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        _tableView.frame = CGRectMake(0, 0, 0, 0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _tableView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 100 * H;
    _notReadTableView = [[UITableView alloc] init];
    _notReadTableView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_notReadTableView];
    _notReadTableView.delegate = self;
    _notReadTableView.dataSource = self;
    _notReadTableView.rowHeight = 100 * H;


}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _tableView) {
    static NSString *reuse = @"reuse";
    RemindTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[RemindTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
        cell.rtLabel.delegate = self;
    }
#pragma mark 
    cell.rtLabel.text = @"<font face='HelveticaNeue-CondensedBold' color=blue><a href='http://store.apple.com'><u color=blue>@理工波</u></a> </font>赞了你的日志:呵呵。。。。。。<font face='HelveticaNeue-CondensedBold' color=blue><a href='http://store.apple.com'><u color=blue>http://store.apple.com</u></a> </font>";
    cell.rtLabel.font = [UIFont systemFontOfSize:16 * H];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    } else {
        static NSString *reuse = @"noreuse";
        RemindTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
        if (!cell) {
            cell = [[RemindTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
            cell.rtLabel.delegate = self;
        }
#pragma mark
        cell.rtLabel.text = @"<font face='HelveticaNeue-CondensedBold' color=blue><a href='http://store.apple.com'><u color=blue>@理工波</u></a> </font>赞了你的日志:未读。。。。。。<font face='HelveticaNeue-CondensedBold' color=blue><a href='http://store.apple.com'><u color=blue>http://store.apple.com</u></a> </font>";

        cell.rtLabel.font = [UIFont systemFontOfSize:16 * H];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }
}
#pragma mark RTLabel delegate

- (void)rtLabel:(id)rtLabel didSelectLinkWithURL:(NSURL*)url
{
    NSLog(@"did select url %@", url);
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
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
