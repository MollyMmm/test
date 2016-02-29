//
//  GetOrganizeOperator.m
//  MobileSchool
//
//  Created by Molly on 16/2/26.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "GetOrganizeOperator.h"

#import "Node.h"

@implementation GetOrganizeOperator

- (id)initWithParamsDic:(NSDictionary *)params{
    
    if (self = [super initWithParamsDic:params]) {
        
        self.action = @"ms/api/user_ser/nodes";
        self.dataArr = [NSMutableArray array];
    }
    
    return self;
}

- (void)parseJson:(BaseModel *)BaseModel{

    NSArray *dataArr = [BaseModel.data objectForKey:@"result"];
    
    for (NSDictionary * ppDict in dataArr) {
        
        Node *node = [self getNodeFromDict:ppDict setDeep:0];
        [_dataArr addObject:node];
        
        NSArray *pArr = [ppDict objectForKey:@"sons"];
        for (NSDictionary * pDict in pArr) {
            
            Node *node = [self getNodeFromDict:pDict setDeep:1];
            [_dataArr addObject:node];
            
            NSArray *sonArr = [ppDict objectForKey:@"sons"];
            for (NSDictionary * sonDict in sonArr) {
                
                Node *node = [self getNodeFromDict:sonDict setDeep:2];
                [_dataArr addObject:node];
            }
        }
    }
}

- (Node *)getNodeFromDict:(NSDictionary *)dict setDeep:(int)deepth{
 
    Node *node = [[Node alloc] init];
    node.nodeId = [dict objectForKey:@"node_id"];
    node.nodeName = [dict objectForKey:@"node_name"];
    node.parentId = [dict objectForKey:@"parent_id"];
    node.leaf = [dict objectForKey:@"leaf"];
    node.deepth = deepth;
    node.expand = NO;
    
    return node;
}
@end