//
//  TokenIdTool.h
//  MobileSchool
//
//  Created by Molly on 16/2/26.
//  Copyright © 2016年 Molly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TokenIdTool : NSObject

@property (strong, nonatomic) NSString *tokenId;

- (void)requestTokenId;

@end
