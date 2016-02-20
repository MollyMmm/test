//
//  ChatViewController.m
//  MobileSchool
//
//  Created by Molly on 16/2/18.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "ChatViewController.h"

#import <AVOSCloudIM.h>

#import "ExpressionView.h"

@interface ChatViewController ()<UITableViewDataSource,UITableViewDelegate,AVIMClientDelegate,UITextFieldDelegate>{
    
    int _position;
    bool _videoStatus;
}
@property (weak, nonatomic) IBOutlet UIView *tabbarView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *videoBtn;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property(strong, nonatomic) UIButton *sayBtn;

@property(nonatomic,strong)NSMutableArray *timeArr;
@property(nonatomic,strong)NSMutableArray *chatArr;

@property(nonatomic,strong)AVIMClient *client;
@property(nonatomic,strong)AVIMClient *clientTest;

@property(nonatomic,strong)ExpressionView * expressionView;
@end

@implementation ChatViewController

- (ExpressionView *)expressionView{

    if (!_expressionView) {
        _expressionView = [ExpressionView instanceView];
        return _expressionView;
    }
    return _expressionView;
}

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
    _tableView.backgroundColor = [[UIColor alloc] initWithRed:236/255.0 green:236/250.0 blue:236/250.0 alpha:1.0];
    
    _position = 60;
    _timeArr = [NSMutableArray array];
    _chatArr = [NSMutableArray array];
//    _timeArr = [NSMutableArray arrayWithObjects:@"01-16 13:01",@"3分钟前", nil];
//    NSDictionary *dict0 = [NSDictionary dictionaryWithObjectsAndKeys:@"left",@"id",@"schoolHelper",@"photo",@"hello",@"content", nil];
//    NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"right",@"id",@"头像",@"photo",@"哈哈哈哈哈",@"content", nil];
//    NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:@"left",@"id",@"schoolHelper",@"photo",@"你好啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊",@"content", nil];
//    NSDictionary *dict3 = [NSDictionary dictionaryWithObjectsAndKeys:@"right",@"id",@"头像",@"photo",@"0",@"content", nil];
//    NSDictionary *dict4 = [NSDictionary dictionaryWithObjectsAndKeys:@"left",@"id",@"schoolHelper",@"photo",@"哈哈哈哈哈哈哈哈哈哈哈哈哈,哈哈哈哈哈哈哈哈哈哈哈哈哈,哈哈哈哈哈哈哈哈哈哈哈哈哈,哈哈哈哈哈哈哈哈哈哈哈哈哈",@"content", nil];
//    _chatArr = [NSMutableArray arrayWithObjects:@[dict0],@[dict1,dict2,dict3,dict4], nil];
    
    _videoStatus = false;
    //_inputField = [[UITextField alloc] initWithFrame:CGRectMake(40, 4, kScreenWidth - 112, 30)];
    _inputField.delegate = self;
    _inputField.returnKeyType = UIReturnKeyDone;
    [_tabbarView addSubview:_inputField];
    _sayBtn = [[UIButton alloc] init];
    [_sayBtn setImage:[UIImage imageNamed:@"azsh"] forState:UIControlStateNormal];
    [_sayBtn addTarget:self action:@selector(pressSayBtn:) forControlEvents:UIControlEventTouchUpInside];
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
    UIView* view;
    bool fromSelf = true;
    NSString *idStr = [[[_chatArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"id"];
    NSString *contentStr = [[[_chatArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"content"];
    NSString *photoStr = [[[_chatArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"photo"];
    
    if ([idStr isEqualToString:@"left"]) {
        headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 0, 40,40)];
        fromSelf = NO;
    }
    if ([idStr isEqualToString:@"right"]) {
        headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth - 48, 0, 40,40)];
        fromSelf = YES;
    }
    
    [headImgView.layer setCornerRadius:20.f];
    headImgView.layer.masksToBounds = YES;
    headImgView.image = [UIImage imageNamed:photoStr];
    [cell addSubview:headImgView];
    
    if ([contentStr isEqualToString:@"0"]) {
        view = [self videoVidew:3 from:fromSelf withIndexRow:indexPath.row];
    }
    else{
        view = [self textView:contentStr from:fromSelf];
    }
    [cell addSubview:view];
    
    cell.backgroundColor = [[UIColor alloc] initWithRed:236/255.0 green:236/250.0 blue:236/250.0 alpha:1.0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
   
    return 44.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //根据文字长度计算
    NSString *contentStr = [[[_chatArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"content"];
     UIFont *font = [UIFont systemFontOfSize:14.f];
    //CGSize size = [contentStr sizeWithFont:font constrainedToSize:CGSizeMake(180.0f, 20000.0f) lineBreakMode:NSLineBreakByWordWrapping];
    //ios7 及其以上版本
    NSDictionary* attribute = @{NSFontAttributeName:font};
    CGSize size = [contentStr boundingRectWithSize:CGSizeMake(180.f,20000.0f) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin  attributes:attribute context:nil].size;
    return (size.height + 50.f);
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
/**
 *  文字气泡
 *
 *  @param text     聊天内容
 *  @param fromSelf 是否是自己发出
 *
 *  @return
 */
- (UIView *)textView:(NSString *)text from:(BOOL)fromSelf{
    
    UIFont *font = [UIFont systemFontOfSize:14.f];
    //CGSize size = [contentStr sizeWithFont:font constrainedToSize:CGSizeMake(180.0f, 20000.0f) lineBreakMode:NSLineBreakByWordWrapping];
    //ios7 及其以上版本
    NSDictionary* attribute = @{NSFontAttributeName:font};
    CGSize size = [text boundingRectWithSize:CGSizeMake(180.f,20000.0f) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin  attributes:attribute context:nil].size;
    UIView *returnView = [[UIView alloc] initWithFrame:CGRectZero];
    returnView.backgroundColor = [UIColor clearColor];
    
    UIImage* image = [UIImage imageNamed:(fromSelf?@"msg_right":@"msg_left")];
    UIImageView* textImgView = [[UIImageView alloc] initWithImage:[image stretchableImageWithLeftCapWidth:floorf(image.size.width/2) topCapHeight:floorf(image.size.height/2)]];
    
    //添加文本信息
    UILabel *textLbl = [[UILabel alloc] initWithFrame:CGRectMake(fromSelf?15.0f:22.0f, 20.0f, size.width+10, size.height+10)];
    textLbl.backgroundColor = [UIColor clearColor];
    textLbl.font = font;
    textLbl.numberOfLines = 0;
    textLbl.lineBreakMode = NSLineBreakByWordWrapping;
    textLbl.text = text;
    
    textImgView.frame = CGRectMake(0.0f, 14.0f, textLbl.frame.size.width+30.0f, textLbl.frame.size.height+10.0f);
    
    if(fromSelf){
        returnView.frame = CGRectMake(kScreenWidth-_position-(textLbl.frame.size.width+30.0f), 0.0f, textLbl.frame.size.width+30.0f, textLbl.frame.size.height+10.0f);
    }
    else{
        returnView.frame = CGRectMake(_position, 0.0f, textLbl.frame.size.width+30.0f, textLbl.frame.size.height+10.0f);
    }
    
    [returnView addSubview:textImgView];
    [returnView addSubview:textLbl];
    
    return returnView;
}
/**
 *  语音气泡
 *
 *  @param logntime 语音时长
 *  @param fromSelf 是否是自身发出
 *  @param indexRow 语音的tag
 *
 *  @return
 */
- (UIView *)videoVidew:(NSInteger)logntime from:(BOOL)fromSelf withIndexRow:(NSInteger)indexRow{
    
    //根据语音长度
    int videoWidth= 66+(int)logntime;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = indexRow;
    if(fromSelf){
        button.frame =CGRectMake(kScreenWidth-_position-videoWidth, 20, videoWidth, 34);
    }
    else{
        button.frame =CGRectMake(_position, 20, videoWidth, 34);
    }
    //image偏移量
    UIEdgeInsets imageInsert;
    imageInsert.top = -2;
    imageInsert.left = fromSelf?button.frame.size.width/3:-button.frame.size.width/3;
    button.imageEdgeInsets = imageInsert;
    
    [button setImage:[UIImage imageNamed:fromSelf?@"SenderVoiceNodePlaying":@"ReceiverVoiceNodePlaying"] forState:UIControlStateNormal];
    UIImage *backgroundImage = [UIImage imageNamed:(fromSelf?@"msg_right":@"msg_left")];
    backgroundImage = [backgroundImage stretchableImageWithLeftCapWidth:20 topCapHeight:0];
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(fromSelf?-30:button.frame.size.width, 0, 30, button.frame.size.height)];
    label.text = [NSString stringWithFormat:@"%ld''",(long)logntime];
    label.textColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:13];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    [button addSubview:label];
    
    return button;
}
- (void)pressSettingBtn:(id)sender{
    
}
- (void)pressCancleBtn:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
/**
 *  发送消息
 */
- (void)tomSendMessageToJerry {
    // Tom 创建了一个 client，用自己的名字作为 clientId
    self.client = [[AVIMClient alloc] initWithClientId:@"Tom"];
    
    // Tom 打开 client
    [self.client openWithCallback:^(BOOL succeeded, NSError *error) {
        // Tom 建立了与 Jerry 的会话
        [self.client createConversationWithName:@"猫和老鼠" clientIds:@[@"Jerry"] callback:^(AVIMConversation *conversation, NSError *error) {
            // Tom 发了一条消息给 Jerry
            [conversation sendMessage:[AVIMTextMessage messageWithText:@"耗子，起床！" attributes:nil] callback:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    NSLog(@"发送成功！");
                    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"right",@"id",@"头像",@"photo",@"哈哈哈哈哈",@"content", nil];
                    [_chatArr addObject:@[dict]];
                    [_tableView reloadData];
                }
            }];
        }];
    }];
}
- (IBAction)test:(id)sender {
    [self tomSendMessageToJerry];
}
- (IBAction)testR:(id)sender {
    [self jerryReceiveMessageFromTom];
}
/**
 *  接收消息
 */
- (void)jerryReceiveMessageFromTom {
    // Jerry 创建了一个 client，用自己的名字作为 clientId
    self.clientTest = [[AVIMClient alloc] initWithClientId:@"Jerry"];
    
    // 设置 client 的 delegate，并实现 delegate 方法
    self.clientTest.delegate = self;
    
    // Jerry 打开 client
    [self.clientTest openWithCallback:^(BOOL succeeded, NSError *error) {
        // ...
    }];
}

- (IBAction)pressExpressionBtn:(UIButton *)sender {
    
}
- (IBAction)pressAddBtn:(UIButton *)sender {
}
- (IBAction)pressVideoBtn:(UIButton *)sender {
    _videoStatus = !_videoStatus;
    if (_videoStatus) {
        [sender setImage:[UIImage imageNamed:@"jp"] forState:UIControlStateNormal];
        _sayBtn.frame = CGRectMake(40, 4, kScreenWidth - 112, 30);
        [self.tabbarView addSubview:_sayBtn];
        
    }
    else{
        [sender setImage:[UIImage imageNamed:@"message_chat_bg_normal"] forState:UIControlStateNormal];
        [_sayBtn removeFromSuperview];
    }
}
- (void)pressSayBtn:(UIButton *)sender {

}
#pragma mark - AVIMClientDelegate

// 接收消息的回调函数
- (void)conversation:(AVIMConversation *)conversation didReceiveTypedMessage:(AVIMTypedMessage *)message {
    NSLog(@"----------%@", message.text); // 耗子，起床！
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"left",@"id",@"schoolHelper",@"photo",message.text,@"content", nil];
    [_chatArr addObject:@[dict]];
    [_timeArr addObject:@"1"];
    [_tableView reloadData];
    
}
#pragma mark - uitextFiledDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    NSLog(@"----------这里点击键盘的done事件");
    return YES;
}
@end
