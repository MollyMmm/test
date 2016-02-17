//
//  MyselfInformationViewController.m
//  MobileSchool
//
//  Created by Apple on 16/2/4.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "MyselfInformationViewController.h"
#import "NameViewController.h"
#import "PhoneViewController.h"
#import "EmailViewController.h"

@interface MyselfInformationViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *header;
@property (nonatomic, strong) NSMutableArray *titleArr;
@property (nonatomic, strong) NSMutableArray *cotentArr;

@end

@implementation MyselfInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _titleArr = [NSMutableArray arrayWithObjects:@"用户名",@"手机",@"邮箱",@"性别",@"地区",@"简介", nil];
    _cotentArr = [NSMutableArray arrayWithObjects:@"尹直富",@"13756310470",@"1694740860@qq.com",@"男",@"重庆市—重庆市",@"呵呵", nil];
    self.view.backgroundColor = [UIColor grayColor];
    self.title = @"个人信息";
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    self.tabBarController.tabBar.hidden = YES;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10 * W, 0, kScreenWidth - 20 * W, kScreenHeight) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor grayColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 8;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0 || section == 7) {
        return 10 * H;
    }
    return 1 * H;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0 || section == 7) {
        return 10 * H;
    }
    return 1 * H;

    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 70 * H;
    }
    return 40 * H;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuse = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuse];
    }
    if (indexPath.section == 0) {
#pragma mark
        _header = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"个人头像"]];
        _header.frame = CGRectMake(10 * W, 10 * H, 50 * H, 50 * H);
        _header.layer.cornerRadius = 30 * H;
        _header.layer.masksToBounds = YES;
        _header.userInteractionEnabled = YES;
        [cell.contentView addSubview:_header];
    } else if (indexPath.section == 7) {
        cell.textLabel.text = @"修改密码";
    } else {
    cell.textLabel.text = _titleArr[indexPath.section - 1];
    cell.detailTextLabel.text = _cotentArr[indexPath.section - 1];
    cell.detailTextLabel.textColor = [UIColor blackColor];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        [self chooseImage];
    }
    if (indexPath.section == 1) {
        NameViewController *name = [[NameViewController alloc] init];
        [self.navigationController pushViewController:name animated:YES];
        name.name = _cotentArr[indexPath.section - 1];
    }
    if (indexPath.section == 2) {
        PhoneViewController *phone = [[PhoneViewController alloc] init];
        [self.navigationController pushViewController:phone animated:YES];
    }
    if (indexPath.section == 3) {
        EmailViewController *email = [[EmailViewController alloc] init];
        [self.navigationController pushViewController:email animated:YES];
    }
}
- (void)chooseImage {
    
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
    
    
    [self.header setImage:saveImage];
    
    self.header.tag = 100;
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        
        
    }];
    
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
