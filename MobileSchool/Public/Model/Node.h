//
//  Node.h
//  MobileSchool
//
//  Created by Molly on 16/2/25.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (strong, nonatomic) NSString *parentId;
@property (strong, nonatomic) NSString *nodeId;
@property (strong, nonatomic) NSString *leaf;//1叶子节点的用户,0 为机构
@property (assign, nonatomic) BOOL expand;//1展开, 0 未展开
@property (assign, nonatomic) int deepth;
@property (strong, nonatomic) NSString *nodeName;


@end
//"node_id":"4","node_name":"??4","parent_id":"2","leaf":"1","deep":"2"