//
//  GetFriendListOperator.m
//  MobileSchool
//
//  Created by Molly on 16/2/23.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "GetFriendListOperator.h"

#import "UserModel.h"

@implementation GetFriendListOperator
- (id)initWithParamsDic:(NSDictionary *)params{

    if (self = [super initWithParamsDic:params]) {
        self.action = @"ms/api/user_ser";
        self.friendArr = [NSMutableArray array];
    }
    return self;
}
- (void)parseJson:(BaseModel*) baseModel{

    NSArray *friendArr = baseModel.retArr;
    for (NSDictionary *dataDict in friendArr) {
        UserModel *userModel = [[UserModel alloc] init];
        userModel.username = [dataDict objectForKey:@"username"];
        userModel.email = [dataDict objectForKey:@"email"];
        //http://123.56.17.198:8180/ms/img/images.jpg
        userModel.img = [NSString stringWithFormat:@"http://123.56.17.198:8180/ms/%@",[dataDict objectForKey:@"img"]];
        userModel.password = [dataDict objectForKey:@"password"];
        userModel.name = [dataDict objectForKey:@"name"];
        userModel.phone = [dataDict objectForKey:@"phone"];
    }
    
}
@end
