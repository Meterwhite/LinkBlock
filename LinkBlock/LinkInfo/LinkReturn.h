//
//  LinkReturn.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/9/23.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkInfo.h"

@interface LinkReturn : LinkInfo
@property (nonatomic,strong) id returnValue;

- (instancetype)initWithReturnValue:(id)returnValue;
@end
