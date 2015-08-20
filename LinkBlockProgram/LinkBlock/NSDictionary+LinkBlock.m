//
//  NSDictionary+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"
#import "NSDictionary+LinkBlock.h"
#import "NSObject+LinkBlock.h"

@implementation NSObject(NSDictionaryLinkBlock)


- (id (^)(id<NSCopying>))dictGet
{
    return ^(id<NSCopying> key){
        LinkError_VAL_IF(NSDictionary){
            return (id)nil;
        }
        return _self[key];
    };
}
- (void)setDictGet:(id (^)(id<NSCopying>))dictGet{};

- (id (^)(id<NSCopying>))dictGetNoNSNull
{
    return ^(id<NSCopying> key){
        LinkError_VAL_IF(NSDictionary){
            return (id)nil;
        }
        if(!_self[key] || [_self[key] isKindOfClass:[NSNull class]] ){
            return (id)nil;
        }
        return _self[key];
    };
}
- (void)setDictGetNoNSNull:(id (^)(id<NSCopying>))dictGetNoNSNull{};

- (NSDictionary *(^)(id<NSCopying>))dictGetDictNoNullType
{
    return ^(id<NSCopying> key){
        LinkError_REF_AUTO_IF(NSDictionary, NSDictionary);
        if(![_self[key] isKindOfClass:[NSDictionary class]]){
            return [NSDictionary dictionary];
        }
        return (NSDictionary*)_self[key];
    };
}
- (void)setDictGetDictNoNullType:(NSDictionary *(^)(id<NSCopying>))dictGetDictValueNoNullType{}

- (NSArray *(^)(id<NSCopying>))dictGetArrNoNullType
{
    return ^(id<NSCopying> key){
        LinkError_REF_AUTO_IF(NSArray, NSDictionary);
        if(![_self[key] isKindOfClass:[NSArray class]])
            return [NSArray array];
        return (NSArray*)_self[key];
    };
}
- (void)setDictGetArrNoNullType:(NSArray *(^)(id<NSCopying>))dictGetArrValueNoNullType{};

- (BOOL (^)(id<NSCopying>))dictGetBOOLNoNullType
{
    return ^(id<NSCopying> key){
        LinkError_VAL_IF(NSDictionary){
            return NO;
        }
        if(_self[key] && ![_self[key] isKindOfClass:[NSNull class]]){//@(0),@"1",arr,dict,... ...
            if([_self[key] isKindOfClass:[NSNumber class]] || [_self[key] isKindOfClass:[NSString class]])
            {
                return [_self[key] boolValue];//@(0),@"1"
            }else{//arr,dict,... ...
                return NO;
            }
        }else{//nil,NSNull
            return NO;
        }
        return [_self[key] boolValue];
    };
}
- (void)setDictGetBOOLNoNullType:(BOOL (^)(id<NSCopying>))dictGetBOOLValueNoNullType{}

- (BOOL (^)(id<NSCopying>))dictContainerKey
{
    return ^(id<NSCopying> key){
        LinkError_VAL_IF(NSDictionary){
            return NO;
        }
        return [[_self allKeys] containsObject:key];
    };
}
- (void)setDictContainerKey:(BOOL (^)(id<NSCopying>))blockContainerKey{};

- (BOOL (^)(id))dictContainerValue
{
    return ^(id value){
        LinkError_VAL_IF(NSDictionary){
            return NO;
        }
        return [[_self allValues] containsObject:value];
    };
}
- (void)setDictContainerValue:(BOOL (^)(id))blockContainerValue{};

- (NSArray *(^)(id))dictKeysForValue
{
    return ^(id value){
        LinkError_REF_AUTO_IF(NSArray, NSDictionary);
        return [_self allKeysForObject:value];
    };
}
- (void)setDictKeysForValue:(NSArray *(^)(id))blockKeysForValue{};

- (NSArray *(^)())dictAllKeys
{
    return ^(){
        LinkError_REF_AUTO_IF(NSArray, NSDictionary);
        return [_self allKeys];
    };
}
- (void)setDictAllKeys:(NSArray *(^)())blockAllKeys{};
- (NSArray *(^)())dictAllValues
{
    return ^(){
        LinkError_REF_AUTO_IF(NSArray, NSDictionary);
        return [_self allValues];
    };
}
- (void)setDictAllValues:(NSArray *(^)())blockAllValues{};


@end
