//
//  NSMutableArray+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"
#import "NSMutableArray+LinkBlock.h"
#import "NSObject+LinkBlock.h"

@implementation NSMutableArray(LinkBlock)
- (NSArray *(^)())blockCopy
{
    return ^(){
        return [self copy];
    };
}
- (NSMutableArray *(^)(id))blockAddObj
{
    return ^(id obj){
        if(!obj)goto END;
        [self addObject:obj];
    END:
        return self;
    };
}
- (NSMutableArray *(^)(NSArray *))blockAddObjs
{
    return ^(NSArray *arr){
        if(!arr || ![arr isKindOfClass:[NSArray class]])goto END;
        [self addObjectsFromArray:arr];
    END:
        return self;
    };
}
- (NSMutableArray *(^)(id, NSUInteger))blockInsertObjAtIndex
{
    return ^(id obj, NSUInteger index){
        if(!obj || index>self.count)goto END;
        [self insertObject:obj atIndex:index];
    END:
        return self;
    };
}
- (NSMutableArray *(^)(NSArray *, NSUInteger))blockInsertArrayAtIndex
{
    return ^(NSArray * arr, NSUInteger index){
        if(!arr || ![arr isKindOfClass:[NSArray class]] || index>self.count)goto END;
        [self insertObjects:arr atIndexes:[NSIndexSet indexSetWithIndex:index]];
    END:
        return self;
    };
}

- (NSMutableArray *(^)(id, id))blockInsertObjBeforeObj
{
    return ^(id obj, id beforObj){
        if(!obj || !beforObj) goto END;
        long idx= [self indexOfObject:beforObj];
        if(idx != NSNotFound){
            idx= idx-1<0 ? 0: idx;
            [self insertObject:obj atIndex:idx];
        }
    END:
        return self;
    };
}

- (NSMutableArray *(^)(id, id))blockInsertObjBehindObj
{
    return ^(id obj, id behindObj){
        if(!obj || !behindObj) goto END;
        long idx= [self indexOfObject:behindObj];
        if(idx != NSNotFound){
            [self insertObject:obj atIndex:idx];
        }
    END:
        return self;
    };
}

- (NSMutableArray *(^)(id))blockRemoveObj
{
    return ^(id obj){
        if(!obj)goto END;
        [self removeObject:obj];
    END:
        return self;
    };
}
- (NSMutableArray *(^)(NSUInteger))blockRemoveObjAtIndex
{
    return ^(NSUInteger index){
        if(index>self.count)goto END;
        [self removeObjectAtIndex:index];
    END:
        return self;
    };
}
- (NSMutableArray *(^)(NSUInteger, NSUInteger))blockRemoveObjsFromIndexToIndex
{
    return ^(NSUInteger from, NSUInteger to){
        if( to>self.count || from>to )goto END;
        [self removeObjectsInRange:NSMakeRange(from, to - from + 1)];
    END:
        return self;
    };
}

- (NSMutableArray *(^)())blockRemoveAllObjs
{
    return ^(){
        [self removeAllObjects];
        return self;
    };
}

- (NSMutableArray *(^)(id, id))blockReplaceObjWithObj
{
    return ^(id obj, id withObj){
        if(!obj|| !withObj)goto END;
        NSInteger idx= [self indexOfObject:obj];
        if(idx != NSNotFound){
            [self replaceObjectAtIndex:idx withObject:withObj];
        }
    END:
        return self;
    };
}
- (void)setBlockCopy:(NSArray *(^)())blockCopy{};
- (void)setBlockAddObj:(NSMutableArray *(^)(id))blockAddObj{};
- (void)setBlockAddObjs:(NSMutableArray *(^)(NSArray *))blockAddObjs{};
- (void)blockInsertObjAtIndex:(NSMutableArray *(^)(id, NSUInteger))blockInsertObj_Index{};
- (void)setBlockInsertArrayAtIndex:(NSMutableArray *(^)(NSArray *, NSUInteger))blockInsertObjs_Index{};
- (void)setBlockInsertObjBeforeObj:(NSMutableArray *(^)(id, id))blockInsertObjBeforeObj{};
- (void)setBlockInsertObjBehindObj:(NSMutableArray *(^)(id, id))blockInsertObjBehindObj{};
- (void)setBlockRemoveObj:(NSMutableArray *(^)(id))blockRemoveObj{};
- (void)setBlockRemoveObjAtIndex:(NSMutableArray *(^)(NSUInteger))blockRemoveObjAtIndex{};
- (void)setBlockRemoveObjsFromIndexToIndex:(NSMutableArray *(^)(NSUInteger, NSUInteger))blockRemoveObjsFromIndex_toIndex{};
- (void)setBlockRemoveAllObjs:(NSMutableArray *(^)())blockRemoveAllObjs{};
- (void)setBlockReplaceObjWithObj:(NSMutableArray *(^)(id, id))blockReplaceObjWithObj{};
- (void)setBlockInsertObjAtIndex:(NSMutableArray *(^)(id, NSUInteger))blockInsertObjAtIndex{};
@end
