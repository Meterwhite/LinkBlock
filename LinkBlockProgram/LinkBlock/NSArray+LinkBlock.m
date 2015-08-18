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


- (id (^)(NSUInteger))blockValueAt
{
    return ^(NSUInteger idx){
        id re;
        if(self.blockIsIndexInRange(idx)){
            re =[self objectAtIndex:idx];
        }else{
            re = nil;
        }
        return re;
    };
}
- (void)setBlockValueAt:(id (^)(NSUInteger))blockValue{};

- (id (^)(__unsafe_unretained Class ,NSUInteger))blockValueTypeAt
{
    return ^( Class typeClass, NSUInteger idx){
        id re;
        if(self.blockIsIndexInRange(idx)){
            re = [self objectAtIndex:idx];
            if(!typeClass || ![re isKindOfClass:typeClass]){
                re = [typeClass new];
            }
        }else{
            re = [typeClass new];
        }
        return re;
    };
}
- (void)setBlockValueTypeAt:(id (^)(__unsafe_unretained Class ,NSUInteger))blockValueType{};

- (NSObject *(^)(NSUInteger))blockValueNSObjectAt
{
    return ^(NSUInteger idx){
        return self.blockValueTypeAt([NSObject class],idx);
    };
}
- (void)setBlockValueNSObjectAt:(NSObject *(^)(NSUInteger))blockValueNSObject{};

- (NSString *(^)(NSUInteger))blockValueNSStringAt
{
    return ^(NSUInteger idx){
        return self.blockValueTypeAt([NSString class],idx);
    };
}
- (void)setBlockValueNSStringAt:(NSString *(^)(NSUInteger))blockValueNSString{};

- (NSNumber *(^)(NSUInteger))blockValueNSNumberAt
{
    return ^(NSUInteger idx){
        return self.blockValueTypeAt([NSNumber class],idx);
    };
}
- (void)setBlockValueNSNumberAt:(NSNumber *(^)(NSUInteger))blockValueNSNumber{};

- (NSArray *(^)(NSUInteger))blockValueNSArraryAt
{
    return ^(NSUInteger idx){
        return self.blockValueTypeAt([NSArray class],idx);
    };
}
- (void)setBlockValueNSArraryAt:(NSArray *(^)(NSUInteger))blockValueNSArrary{};

- (NSMutableArray *(^)(NSUInteger))blockValueNSMutableArrayAt
{
    return ^(NSUInteger idx){
        return self.blockValueTypeAt([NSMutableArray class],idx);
    };
}
- (void)setBlockValueNSMutableArrayAt:(NSMutableArray *(^)(NSUInteger))blockValueNSMutableArray{};

- (NSDictionary *(^)(NSUInteger))blockValueNSDictionaryAt
{
    return ^(NSUInteger idx){
        return self.blockValueTypeAt([NSDictionary class],idx);
    };
}
- (void)setBlockValueNSDictionaryAt:(NSDictionary *(^)(NSUInteger))blockValueNSDictionary{};

- (NSMutableDictionary *(^)(NSUInteger))blockValueNSMutableDictionaryAt
{
    return ^(NSUInteger idx){
        return self.blockValueTypeAt([NSMutableDictionary class],idx);
    };
}
- (void)setBlockValueNSMutableDictionaryAt:(NSMutableDictionary *(^)(NSUInteger))blockValueNSMutableDictionary{};

- (UIView *(^)(NSUInteger))blockValueUIVIewAt
{
    return ^(NSUInteger idx){
        return self.blockValueTypeAt([UIView class],idx);
    };
}
- (void)setBlockValueUIVIewAt:(UIView *(^)(NSUInteger))blockValueUIVIew{};

- (NSArray *(^)(__unsafe_unretained Class))blockValuesOfType
{
    return ^(__unsafe_unretained Class typeClass){
        if(!typeClass)
            return self;
        NSMutableArray* reIsMArr = [NSMutableArray array];
        [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if([obj isKindOfClass:typeClass]){
                [reIsMArr addObject:obj];
            }
        }];
        return reIsMArr.blockCopy();
    };
}
- (void)setBlockValuesOfType:(NSArray *(^)(__unsafe_unretained Class))blockValuesOfType{};
@end
