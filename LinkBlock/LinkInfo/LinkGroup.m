//
//  LinkGroup.m
//  LinkBlockProgram
//
//  Created by NOVO on 16/7/12.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkGroup.h"
#import <objc/runtime.h>

@implementation LinkGroup

- (NSMutableArray<NSObject*> *)linkObjects
{
    if(!_linkObjects){
        _linkObjects = [NSMutableArray new];
    }
    return _linkObjects;
}

+ (LinkGroup *)groupWithObjs:(NSArray *)objs
{
    LinkGroup* re = [LinkGroup new];
    [re.linkObjects addObjectsFromArray:objs];
    return re;
}

- (LinkGroup *)groupLinkName:(NSString *)blockName, ...
{
    LinkGroup* group = self;
    NSMutableArray* returnObjs = [NSMutableArray new];
    for (int i=0; i<group.linkObjects.count; i++) {
        id re = group.linkObjects[i].arrLast();
        [returnObjs addObject:re];
    }
    [group.linkObjects removeAllObjects];
    [group.linkObjects addObjectsFromArray:returnObjs];
    return group;
    return nil;
}
@end
