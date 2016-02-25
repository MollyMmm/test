//
//  Node.m
//  MobileSchool
//
//  Created by Molly on 16/2/25.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import "Node.h"

@implementation Node

- (instancetype)initWithParentId : (int)parentId nodeId : (int)nodeId name : (NSString *)name deapth : (int)depth expand : (BOOL)expand{
    self = [self init];
    if (self) {
        self.parentId = parentId;
        self.nodeId = nodeId;
        self.name = name;
        self.deapth = depth;
        self.expand = expand;
    }
    return self;
}
@end
