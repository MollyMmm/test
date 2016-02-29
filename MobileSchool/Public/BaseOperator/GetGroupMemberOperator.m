//
//  GetGroupMemberOperator.m
//  MobileSchool
//
//  Created by Molly on 16/2/26.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "GetGroupMemberOperator.h"

@implementation GetGroupMemberOperator

- (id)initWithParamsDic:(NSDictionary *)params{
    
    if (self = [self init]) {
        self.action = @"ms/api/user_ser/groupmembers";
        self.groupMemberArr = [NSMutableArray array];
    }
    
    return self;
}

- (void)parseJson:(BaseModel*) baseModel{
    NSDictionary *dataDict = [baseModel.data objectForKey:@"result"];
    
    NSDictionary *groupheadDict = [dataDict objectForKey:@"grouphead"];
    _headUser = [[UserModel alloc] init];
    _headUser.username = [groupheadDict objectForKey:@"username"];
    _headUser.email = [groupheadDict objectForKey:@"email"];
    _headUser.img = [NSString stringWithFormat:@"http://123.56.17.198:8180/ms/%@",[groupheadDict objectForKey:@"img"]];
    _headUser.password = [groupheadDict objectForKey:@"password"];
    _headUser.name = [groupheadDict objectForKey:@"phone"];
    _headUser.tokenid = [groupheadDict objectForKey:@"tokenid"];

    NSArray *membersArr = [dataDict objectForKey:@"members"];
    for (NSDictionary *memberDict in membersArr) {
        
        UserModel *user = [[UserModel alloc] init];
        user.username = [memberDict objectForKey:@"username"];
        user.email = [memberDict objectForKey:@"email"];
        user.img = [NSString stringWithFormat:@"http://123.56.17.198:8180/ms/%@",[memberDict objectForKey:@"img"]];
        user.password = [memberDict objectForKey:@"password"];
        user.name = [memberDict objectForKey:@"phone"];
        user.tokenid = [memberDict objectForKey:@"tokenid"];

        [_groupMemberArr addObject:user];
    }
}
@end

