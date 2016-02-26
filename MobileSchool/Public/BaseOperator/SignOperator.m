//
//  SignOperator.m
//  MobileSchool
//
//  Created by Molly on 16/2/23.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "SignOperator.h"

@implementation SignOperator

- (id)initWithParamsDic:(NSDictionary *)params{
    
    if (self = [super initWithParamsDic:params]) {
        self.action = @"ms/api/user_ser/login";
    }
    
    return self;
}

- (void)parseJson:(BaseModel*) baseModel{

    NSDictionary *dataDict = baseModel.data;
    if([[dataDict objectForKey:@"result"] isEqualToString:@"1"]){
    
        _userModel = [[UserModel alloc] init];
        _userModel.username = [dataDict objectForKey:@"username"];
        _userModel.email = [dataDict objectForKey:@"email"];
        //http://123.56.17.198:8180/ms/img/images.jpg
        _userModel.img = [NSString stringWithFormat:@"http://123.56.17.198:8180/ms/%@",[dataDict objectForKey:@"img"]];
        _userModel.password = [dataDict objectForKey:@"password"];
        _userModel.name = [dataDict objectForKey:@"name"];
        _userModel.phone = [dataDict objectForKey:@"phone"];
        _userModel.tokenid = [dataDict objectForKey:@"tokenid"];
    }
}

@end
