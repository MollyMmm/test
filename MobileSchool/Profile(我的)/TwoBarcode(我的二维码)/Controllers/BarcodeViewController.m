//
//  BarcodeViewController.m
//  MobileSchool
//
//  Created by 李公博 on 16/2/20.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "BarcodeViewController.h"
#import "JSDropmenuView.h"
@interface BarcodeViewController ()<JSDropmenuViewDelegate>

@property(nonatomic,strong) NSArray *menuArray;//菜单

@end

@implementation BarcodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"我的二维码";
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"leftBtn"] style:UIBarButtonItemStyleDone target:self action:@selector(pressCancleBtn:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    //导航栏右侧按钮
    UIImage *image = [[UIImage imageNamed:@"moreUnselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(open:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    self.menuArray = @[@{@"imageName":@"SaoMiao", @"title":@"扫描二维码"},@{@"imageName":@"qunhome_createQun", @"title":@"保存照片"}];

    
    
    
    

}

//导航栏右侧按钮点击方法
-(void)open:(UIBarButtonItem *)btn
{
    JSDropmenuView *dropmenuView = [[JSDropmenuView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-150, 64-12, 140, 44*3+12)];
    dropmenuView.delegate = self;
    
    [dropmenuView showViewInView:self.navigationController.view];
}

//导航栏左侧按钮代理方法
#pragma mark - JSDropmenuViewDelegate

- (NSArray *)dropmenuDataSource {
    return self.menuArray;
}

- (void)dropmenuView:(JSDropmenuView *)dropmenuView didSelectedRow:(NSInteger)index {
    
    if (index == 1) {
        NSLog(@"图片");
    }
    if (index == 0) {
        NSLog(@"二维码");
    }
    
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
