//
//  LinkGroup.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/7/12.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkInfo.h"

@interface LinkGroup : LinkInfo
@property (nonatomic,strong) NSMutableArray* linkObjs;
@property (nonatomic,strong) NSMutableArray* linkReturns;

+ (LinkGroup*)group;
@end
