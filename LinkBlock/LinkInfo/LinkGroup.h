//
//  LinkGroup.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/7/12.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, LinkGroupHandleType) {
    LinkGroupHandleTypeNone                 = 0,
    LinkGroupHandleTypeLoopOriginCount      = 1 << 0
};

@interface LinkGroup : LinkInfo
@property (nonatomic,strong) NSMutableArray<NSObject*>* linkObjects;

+ (LinkGroup*)group;
+ (LinkGroup*)groupWithObjs:(id)obj,...;
+ (LinkGroup*)groupWithArr:(NSArray*)obj;
@end
