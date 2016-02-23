//
//  ParseJson.h
//  QiMingPian
//
//  Created by Molly on 16/2/21.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseModel.h"

@protocol ParseJson <NSObject>

- (void)parseJson:(BaseModel *)BaseModel;

@end