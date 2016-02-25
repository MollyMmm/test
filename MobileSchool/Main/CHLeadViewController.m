//
//  CHLeadViewController.m
//  CarHorizon
//
//  Created by dllo on 15/10/26.
//  Copyright © 2015年 luo. All rights reserved.
//

#import "CHLeadViewController.h"

@interface CHLeadViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *page;

@end

@implementation CHLeadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createView];
}
- (void)createView{
#warning 创建scrollView
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:self.scrollView];
    self.scrollView.contentSize = CGSizeMake(kScreenWidth * 4, 0);
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.userInteractionEnabled = YES;

    
#warning 创建page
    _page = [[UIPageControl alloc] init];
    [self.view addSubview:_page];
    _page.numberOfPages = 4;
    _page.frame = CGRectMake(0, kScreenHeight - 50 * H, kScreenWidth, 50 * H);
    _page.currentPageIndicatorTintColor = [UIColor blackColor];
    _page.pageIndicatorTintColor = [UIColor grayColor];
    _page.userInteractionEnabled = NO;
    
#warning 创建imageView
    for (NSInteger i = 0; i < 4; i++) {
        
        NSString *name = [NSString stringWithFormat:@"%ld",(long)i+1];
        UIImageView *imagei = [[UIImageView alloc] initWithImage:[UIImage imageNamed:name]];
        imagei.frame = CGRectMake(kScreenWidth *i, 0, kScreenWidth , kScreenHeight  );
        [self.scrollView addSubview:imagei];
        imagei.userInteractionEnabled = YES;
        
        
    }
    
#warning 创建button
    UIButton *enterButton = [UIButton buttonWithType:UIButtonTypeSystem];
    enterButton.frame = CGRectMake(kScreenWidth *3+ 120/375.0 * kScreenWidth, kScreenHeight - 90 * H, 150 /375.0 *kScreenWidth, 40 / 667.0 *kScreenHeight);
    enterButton.backgroundColor = [UIColor whiteColor];
    enterButton.alpha = 0.9;
    enterButton.layer.borderWidth = 1;
    enterButton.layer.cornerRadius = 5;
    [self.scrollView addSubview:enterButton];
    [enterButton setTitle:@"进入应用" forState:UIControlStateNormal];
    enterButton.titleLabel.font = [UIFont systemFontOfSize:20 / 375.0 *kScreenWidth];
    [enterButton addTarget:self action:@selector(enterAction:) forControlEvents:UIControlEventTouchUpInside];
    
#warning 创建跳过按钮
    for (NSInteger i = 0; i < 4; i++) {
        UIButton *jumpButton = [UIButton buttonWithType:UIButtonTypeSystem];
        jumpButton.frame=CGRectMake(kScreenWidth *i +300 / 375.0 * kScreenWidth, 40 /667.0 *kScreenHeight, 50/ 375.0 * kScreenWidth, 30 /667.0 *kScreenHeight);
        jumpButton.layer.borderWidth = 1;
        jumpButton.layer.cornerRadius = 5;
        jumpButton.backgroundColor = [UIColor whiteColor];
        jumpButton.alpha = 0.5;
        [self.scrollView addSubview:jumpButton];
        [jumpButton setTitle:@"跳过" forState:UIControlStateNormal];
        [jumpButton addTarget:self action:@selector(enterAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _page.currentPage = _scrollView.contentOffset.x / kScreenWidth;
    if (_scrollView.contentOffset.x / kScreenWidth > 2) {
        _scrollView.bounces = YES;
    }
    if (_scrollView.contentOffset.x / kScreenWidth > 3) {
        self.block();
    }
}

// 进入应用
- (void)enterAction:(UIButton *)button{
    
    self.block();
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
