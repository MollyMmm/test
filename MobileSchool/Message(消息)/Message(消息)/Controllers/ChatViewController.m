//
//  ChatViewController.m
//  MobileSchool
//
//  Created by Molly on 16/2/18.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()<UITableViewDataSource,UITableViewDelegate>{
    int _position;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray* timeArr;
@property(nonatomic,strong)NSArray *chatArr;
@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    self.title = @"校内外小助手";
    
    //导航栏按钮
    UIBarButtonItem* rightBarBtnItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"chat_setting"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(pressSettingBtn:)];
    self.navigationItem.rightBarButtonItem  = rightBarBtnItem;
    UIBarButtonItem* leftBarBtnItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"leftBtn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(pressCancleBtn:)];
    self.navigationItem.leftBarButtonItem = leftBarBtnItem;
   
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [[UIColor alloc] initWithRed:240/255.0 green:240/250.0 blue:240/250.0 alpha:1.0];
    
    _position = 65;
    _timeArr = [[NSArray alloc] init];
    _chatArr = [[NSMutableArray alloc] init];
    _timeArr = @[@"01-16 13:01",@"3分钟前"];
    NSDictionary *dict0 = [NSDictionary dictionaryWithObjectsAndKeys:@"left",@"id",@"schoolHelper",@"photo",@"hello",@"content", nil];
    NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"right",@"id",@"头像",@"photo",@"哈哈哈哈哈",@"content", nil];
    NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:@"left",@"id",@"schoolHelper",@"photo",@"你好啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊",@"content", nil];
    NSDictionary *dict3 = [NSDictionary dictionaryWithObjectsAndKeys:@"right",@"id",@"头像",@"photo",@"0",@"content", nil];
    NSDictionary *dict4 = [NSDictionary dictionaryWithObjectsAndKeys:@"left",@"id",@"schoolHelper",@"photo",@"哈哈哈哈哈哈哈哈哈哈哈哈哈,哈哈哈哈哈哈哈哈哈哈哈哈哈,哈哈哈哈哈哈哈哈哈哈哈哈哈,哈哈哈哈哈哈哈哈哈哈哈哈哈",@"content", nil];
    
    _chatArr = @[@[dict0],@[dict1,dict2,dict3,dict4]];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    UIImageView *headImgView;
    NSString *idStr = [[[_chatArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"id"];
    NSString *contentStr = [[[_chatArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"content"];
    NSString *photoStr = [[[_chatArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"photo"];
    
    if ([idStr isEqualToString:@"left"]) {
        headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 0, 40,40)];
       
    }
    if ([idStr isEqualToString:@"right"]) {
        headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth - 48, 0, 40,40)];
        
    }
    
    [headImgView.layer setCornerRadius:20.f];
    headImgView.layer.masksToBounds = YES;
    headImgView.image = [UIImage imageNamed:photoStr];
    [cell addSubview:headImgView];
    
    UIView* view = [self textView:contentStr from:YES withPosition:idStr];
    [cell addSubview:view];
    
    cell.backgroundColor = [[UIColor alloc] initWithRed:240.0/255.0 green:240.0/250.0 blue:240.0/250.0 alpha:1.0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
   
    return 44.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //根据文字长度计算
    return 88.f;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return [_timeArr count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return [[_chatArr objectAtIndex:section] count];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    UILabel* timeLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    timeLbl.text = [_timeArr objectAtIndex:section];
    timeLbl.textColor = [UIColor grayColor];
    timeLbl.textAlignment = NSTextAlignmentCenter;
    timeLbl.font = [UIFont systemFontOfSize:12.f];
    [headerView addSubview:timeLbl];
    return headerView;
}
#pragma mark - public 
- (UIView *)textView:(NSString *)text from:(BOOL)fromSelf withPosition:(NSString *)idStr{
    
    UIFont *font = [UIFont systemFontOfSize:14.f];
    CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(180.0f, 20000.0f) lineBreakMode:NSLineBreakByWordWrapping];
    
    UIView *returnView = [[UIView alloc] initWithFrame:CGRectZero];
    returnView.backgroundColor = [UIColor clearColor];
    
    UIImage* image;
    if ([idStr isEqualToString:@"left"]) {
        image = [UIImage imageNamed:@"msg_left"];

    }
    if ([idStr isEqualToString:@"right"]) {
        image = [UIImage imageNamed:@"msg_right"];

    }
    UIImageView* textImgView = [[UIImageView alloc] initWithImage:[image stretchableImageWithLeftCapWidth:floorf(image.size.width/2) topCapHeight:floorf(image.size.height/2)]];
    [returnView addSubview:textImgView];
    
    //添加文本信息
    UILabel *bubbleText = [[UILabel alloc] initWithFrame:CGRectMake(fromSelf?15.0f:22.0f, 20.0f, size.width+10, size.height+10)];
    bubbleText.backgroundColor = [UIColor clearColor];
    bubbleText.font = font;
    bubbleText.numberOfLines = 0;
    bubbleText.lineBreakMode = NSLineBreakByWordWrapping;
    bubbleText.text = text;
    
    textImgView.frame = CGRectMake(0.0f, 14.0f, bubbleText.frame.size.width+30.0f, bubbleText.frame.size.height+20.0f);
    
    if(fromSelf)
        returnView.frame = CGRectMake(kScreenWidth-_position-(bubbleText.frame.size.width+30.0f), 0.0f, bubbleText.frame.size.width+30.0f, bubbleText.frame.size.height+30.0f);
    else
        returnView.frame = CGRectMake(_position, 0.0f, bubbleText.frame.size.width+30.0f, bubbleText.frame.size.height+30.0f);
    
    [returnView addSubview:textImgView];
    [returnView addSubview:bubbleText];
    
    return returnView;
}
- (UIView *)yuyinView:(NSInteger)logntime from:(BOOL)fromSelf withIndexRow:(NSInteger)indexRow  withPosition:(int)position{
    return nil;
}
- (void)pressSettingBtn:(id)sender{
    
}
- (void)pressCancleBtn:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
