//
//  NSDictionary+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"
#import "NSDictionary+LinkBlock.h"
#import "NSObject+LinkBlock.h"

@implementation NSDictionary(LinkBlock)


- (id (^)(id<NSCopying>))blockGetValue
{
    return ^(id<NSCopying> key){
        return self[key];
    };
}
- (id (^)(id<NSCopying>))blockGetValueNoNSNull
{
    return ^(id<NSCopying> key){
        if(!self[key] || [self[key] isKindOfClass:[NSNull class]] ){
            return (id)nil;
        }
        return self[key];
    };
}

- (NSDictionary *(^)(id<NSCopying>))blockGetDictValueNoNullType
{
    return ^(id<NSCopying> key){
        if(![self[key] isKindOfClass:[NSDictionary class]]){
            return [NSDictionary dictionary];
        }
        return (NSDictionary*)self[key];
    };
}

- (NSArray *(^)(id<NSCopying>))blockGetArrValueNoNullType
{
    return ^(id<NSCopying> key){
        if(![self[key] isKindOfClass:[NSArray class]]){
            return [NSArray array];
        }
        return (NSArray*)self[key];
    };
}

- (BOOL (^)(id<NSCopying>))blockGetBOOLValueNoNullType
{
    return ^(id<NSCopying> key){
        if(self[key] && ![self[key] isKindOfClass:[NSNull class]]){//@(0),@"1",arr,dict,... ...
            if([self[key] isKindOfClass:[NSNumber class]] || [self[key] isKindOfClass:[NSString class]])
            {
                return [self[key] boolValue];//@(0),@"1"
            }else{//arr,dict,... ...
                return NO;
            }
        }else{//nil,NSNull
            return NO;
        }
        return [self[key] boolValue];
    };
}
- (BOOL (^)(id<NSCopying>))blockContainerKey
{
    return ^(id<NSCopying> key){
        return [[self allKeys] containsObject:key];
    };
}
- (void)setBlockContainerKey:(BOOL (^)(id<NSCopying>))blockContainerKey{};

- (BOOL (^)(id))blockContainerValue
{
    return ^(id value){
        return [[self allValues] containsObject:value];
    };
}
- (void)setBlockContainerValue:(BOOL (^)(id))blockContainerValue{};

- (NSArray *(^)(id))blockKeysForValue
{
    return ^(id value){
        return [self allKeysForObject:value];
    };
}
- (void)setBlockKeysForValue:(NSArray *(^)(id))blockKeysForValue{};

- (NSArray *(^)())blockAllKeys
{
    return ^(){
        return [self allKeys];
    };
}
- (void)setBlockAllKeys:(NSArray *(^)())blockAllKeys{};
- (NSArray *(^)())blockAllValues
{
    return ^(){
        return [self allValues];
    };
}
- (void)setBlockAllValues:(NSArray *(^)())blockAllValues{};


- (void)setBlockGetValue:(id (^)(id<NSCopying>))blockGetValue{};
- (void)setBlockGetValueNoNSNull:(id (^)(id<NSCopying>))blockGetValueNoNullType{};
- (void)setBlockGetDictValueNoNullType:(NSDictionary *(^)(id<NSCopying>))blockGetDictValueNoNullType{};
- (void)setBlockGetArrValueNoNullType:(NSArray *(^)(id<NSCopying>))blockGetArrValueNoNullType{};
- (void)setBlockGetBOOLValueNoNullType:(BOOL (^)(id<NSCopying>))blockGetBOOLValueNoNullType{};
@end
