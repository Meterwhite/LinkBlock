//
//  NSArray+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "NSArray+LinkBlock.h"
#import "NSObject+LinkBlock.h"
#import "LinkBlock.h"

@implementation NSArray(LinkBlock)
- (BOOL (^)(NSString *))blockContainerStr
{
    return ^(NSString* str){
        __block BOOL re= NO;
        [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if([obj isKindOfClass:[NSString class]] && [obj isEqualToString:str]){
                re= YES;
                *stop= YES;
            }
        }];
        return re;
    };
}
- (void)setBlockContainerStr:(BOOL (^)(NSString *))blockContainerStr{};

- (NSMutableArray *(^)())blockMutableCopy
{
    return ^(){
        return [self mutableCopy];
    };
}
- (void)setBlockMutableCopy:(NSMutableArray *(^)())blockMutableCopy{}

- (BOOL (^)(NSUInteger))blockIsIndexInRange
{
    return ^(NSUInteger index){
        return (BOOL)(index<self.count);
    };
}
- (void)setBlockIsIndexInRange:(BOOL (^)(NSUInteger))blockIsIndexInRange{};


- (NSArray *(^)(NSInteger, NSInteger))blockObjsFromIndexTo
{
    return ^(NSInteger index1, NSInteger index2){
        if(index1>index2 || index1>self.count-1 || index2<0)
            return (NSArray *)(nil);
        if(index1<0)
            index1 = 0;
        if(index2> self.count-1)
            index2= self.count - 1;
        NSUInteger loc = index1;
        NSUInteger len = index2 - index1 + 1;
        return [self subarrayWithRange:NSMakeRange(loc, len)];
    };
}
- (void)setBlockObjsFromIndexTo:(NSArray *(^)(NSInteger, NSInteger))blockObjsFromIndexTo{};

- (NSDictionary *(^)())blockArrToDictByNumberKey
{
    return ^(){
        NSMutableDictionary* reIsDictM= [NSMutableDictionary dictionary];
        [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [reIsDictM setObject:obj forKey:@(idx)];
        }];
        return [reIsDictM copy];
    };
}
- (void)setBlockArrToDictByNumberKey:(NSDictionary *(^)())blockArrToDictByNumberKey{};
- (NSDictionary *(^)())blockArrToDictByStringKey
{
    return ^(){
        NSMutableDictionary* reIsDictM= [NSMutableDictionary dictionary];
        [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [reIsDictM setObject:obj forKey:[NSString stringWithFormat:@"%lu", (unsigned long)idx]];
        }];
        return [reIsDictM copy];
    };
}
- (void)setBlockArrToDictByStringKey:(NSDictionary *(^)())blockArrToDictByStringKey{};

- (BOOL (^)(id))blockContainer
{
    return ^(id obj){
        return [self containsObject:obj];
    };
}
- (void)setBlockContainer:(BOOL (^)(id))blockContainer{};
@end
