//
//  LinkGroup.m
//  LinkBlockProgram
//
//  Created by NOVO on 16/7/12.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkGroup.h"

@implementation LinkGroup

- (NSMutableArray *)linkObjs
{
    if(!_linkObjs){
        _linkObjs = [NSMutableArray new];
    }
    return _linkObjs;
}

- (NSMutableArray *)linkReturns
{
    if(!_linkReturns){
        _linkReturns = [NSMutableArray new];
    }
    return _linkReturns;
}

+ (LinkGroup *)group
{
    return [LinkGroup new];
}

@end
