//
//  LinkReturn.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/9/23.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkInfo.h"

typedef enum LinkReturnType{
    LinkReturnLink,//返回中断
    LinkReturnCondition,//条件中断...linkIf...linkElse...
}LinkReturnType;
@interface LinkReturn : LinkInfo
@property (nonatomic,strong) id returnValue;
@property (nonatomic,assign) LinkReturnType returnType;
- (instancetype)initWithReturnValue:(id)returnValue;
- (instancetype)initWithReturnValue:(id)returnValue returnType:(LinkReturnType)returnType;
@end
