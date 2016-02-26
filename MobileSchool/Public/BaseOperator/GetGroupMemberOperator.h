//
//  GetGroupMemberOperator.h
//  MobileSchool
//
//  Created by Molly on 16/2/26.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "BaseOperator.h"

#import "UserModel.h"

@interface GetGroupMemberOperator : BaseOperator

@property (strong ,nonatomic) UserModel *headUser;
@property (strong ,nonatomic) NSMutableArray *groupMemberArr;

@end
