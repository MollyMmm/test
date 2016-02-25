//
//  MyHomePageViewController.m
//  MobileSchool
//
//  Created by Apple on 16/1/29.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "MyHomePageViewController.h"
#import "dailyRecodTableViewCell.h"
#import "DetailDailyRecodViewController.h"
#import "MyselfInformationViewController.h"

@interface MyHomePageViewController ()<UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,dailyRecodDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *header;

@end

@implementation MyHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的主页";
    
    self.tabBarController.tabBar.hidden = YES;
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight + 49)];
    _tableView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
#pragma mark 头视图
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150 * H)];
    backView.backgroundColor = [UIColor whiteColor];
#pragma mark
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"背景图片"]];
    _imageView.frame = CGRectMake(0, 0, kScreenWidth, 100 * H);
    _imageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseImage:)];
    tap.numberOfTapsRequired=1;
    [_imageView addGestureRecognizer:tap];
#pragma mark
    _header = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"个人头像"]];
    _header.frame = CGRectMake(0, 0, 60 * H, 60 * H);
    _header.layer.cornerRadius = 30 * H;
    _header.layer.masksToBounds = YES;
    _header.center = CGPointMake(kScreenWidth / 2, 100 * H);
    _header.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *headtap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headAction)];
    headtap.numberOfTapsRequired=1;
    
    [_header addGestureRecognizer:headtap];
    
    [_imageView addSubview:_header];
    [backView addSubview:_imageView];
    _tableView.tableHeaderView = backView;
    _tableView.rowHeight = 250 * H;

}
- (void)getNumber:(int)number {
    DetailDailyRecodViewController *detailrecod = [[DetailDailyRecodViewController alloc] init];
    [self.navigationController pushViewController:detailrecod animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuse = @"reuse";
    dailyRecodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[dailyRecodTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailDailyRecodViewController *detailrecod = [[DetailDailyRecodViewController alloc] init];
    [self.navigationController pushViewController:detailrecod animated:YES];
}
- (void)chooseImage:(id)sender {
    
    UIActionSheet *sheet;
    
    //判断是否支持相机
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        sheet = [[UIActionSheet alloc] initWithTitle:@"选择"delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消"otherButtonTitles:@"拍照",@"从相册选择", nil];
        
    } else {
        
        sheet = [[UIActionSheet alloc] initWithTitle:@"选择"delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消"otherButtonTitles:@"从相册选取", nil];
        
    }
    
    sheet.tag = 255;
    
    [sheet showInView:self.view];
    
    
    
}

#pragma mark actionsheet delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickeonAtIndex:(NSInteger)buttonIndex {
    
    if (actionSheet.tag == 255) {
        
        NSUInteger sourceType = 0;
        
        //判断是否支持相机
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            switch (buttonIndex) {
                    
                case 0:
                    
                    //取消
                    
                    return;
                    
                case 1:
                    
                    //相机
                    
                    sourceType = UIImagePickerControllerSourceTypeCamera;
                    
                    break;
                    
                case 2:
                    
                    //相册
                    
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    
                    break;
                    
                    
                    
                default:
                    
                    break;
                    
            }
            
        } else {
            
            if (buttonIndex == 0) {
                
                return;
                
            } else {
                
                sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                
            }
            
        }
        
        //跳转到相机或相册页面
        
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        
        imagePickerController.delegate = self;
        
        imagePickerController.allowsEditing = YES;
        
        imagePickerController.sourceType = sourceType;
        
        [self presentViewController:imagePickerController  animated:YES completion:^{
            
            
            
        }];
        
    }
    
}

#pragma mark 保存图片到沙盒

- (void)saveImage:(UIImage *)currentImage withName:(NSString *)imageName {
    
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
    
    //获取沙盒目录
    
    NSString *fullPath = [[NSHomeDirectory()stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    
    //将图片写入文件
    
    [imageData writeToFile:fullPath atomically:NO];
    
}

#pragma mark -image picker delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [self saveImage:image withName:@"currentImage.png"];
    
    
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"];
    
    UIImage *saveImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    
    
    [self.imageView setImage:saveImage];
    
    self.imageView.tag = 100;
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        
        
    }];
    
}
- (void)headAction {
    MyselfInformationViewController *my = [[MyselfInformationViewController alloc] init];
    [self.navigationController pushViewController:my animated:YES];
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
