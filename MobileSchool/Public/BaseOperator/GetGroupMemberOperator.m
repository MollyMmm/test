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
        self.action = @"";
        self.groupMemberArr = [NSMutableArray array];
    }
    
    return self;
}

- (void)parseJson:(BaseModel*) baseModel{


}
@end
