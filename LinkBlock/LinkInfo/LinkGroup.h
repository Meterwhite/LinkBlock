//
//  LinkGroup.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/7/12.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@interface LinkGroup : LinkInfo
@property (nonatomic,strong) NSMutableArray<NSObject*>* linkObjects;

+ (LinkGroup*)groupWithObjs:(NSArray*)objs;
@end
