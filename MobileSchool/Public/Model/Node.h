//
//  Node.h
//  MobileSchool
//
//  Created by Molly on 16/2/25.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (assign, nonatomic) int parentId;
@property (assign, nonatomic) int nodeId;
@property (assign, nonatomic) int deapth;
@property (assign, nonatomic) BOOL expand;//1展开, 0 未展开
@property (strong, nonatomic) NSString *name;

- (instancetype)initWithParentId : (int)parentId nodeId : (int)nodeId name : (NSString *)name deapth : (int)depth expand : (BOOL)expand;

@end
