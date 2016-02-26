//
//  TokenIdTool.m
//  MobileSchool
//
//  Created by Molly on 16/2/26.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "TokenIdTool.h"

#import "SignOperator.h"
#import "NetworkingManager.h"

@implementation TokenIdTool
- (void)requestTokenId{

    NSString *userName = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    NSString *password = [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    
    
    SignOperator *signOperator = [[SignOperator alloc] initWithParamsDic:@{@"username":userName,@"password":password}];
    NetworkingManager *manager = [NetworkingManager sharedInstance];
    
    [manager asyncTaskWithOperator:signOperator withSuccessCallBack:^(BaseModel *model) {
        
        UserModel *userModel = [[UserModel alloc] init];
        userModel = signOperator.userModel;
        
        _tokenId = signOperator.userModel.tokenid;
        NSLog(@"正确");
    
    } andFaildCallBack:^(id response) {
        
    }];

}
@end
