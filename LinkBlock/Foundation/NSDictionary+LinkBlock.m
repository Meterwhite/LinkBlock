//
//  NSDictionary+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(NSDictionaryLinkBlock)


- (id (^)(id<NSCopying>))dictGet
{
    return ^id(id<NSCopying> key){
        LinkHandle_VAL_IF(NSDictionary){
            return (id)nil;
        }
        return _self[key];
    };
}
- (void)setDictGet:(id (^)(id<NSCopying>))dictGet{};

- (id (^)(id<NSCopying>))dictGetNoNSNull
{
    return ^id(id<NSCopying> key){
        LinkHandle_VAL_IF(NSDictionary){
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
    return ^id(id<NSCopying> key){
        LinkHandle_REF(NSDictionary, NSDictionary)
        if(![_self[key] isKindOfClass:[NSDictionary class]]){
            return [NSDictionary dictionary];
        }
        return (NSDictionary*)_self[key];
    };
}
- (void)setDictGetDictNoNullType:(NSDictionary *(^)(id<NSCopying>))dictGetDictValueNoNullType{}

- (NSArray *(^)(id<NSCopying>))dictGetArrNoNullType
{
    return ^id(id<NSCopying> key){
        LinkHandle_REF(NSArray, NSDictionary)
        if(![_self[key] isKindOfClass:[NSArray class]])
            return [NSArray array];
        return (NSArray*)_self[key];
    };
}
- (void)setDictGetArrNoNullType:(NSArray *(^)(id<NSCopying>))dictGetArrValueNoNullType{};

- (UIView *(^)(id<NSCopying>))dictGetViewNoNullType
{
    return ^id(id<NSCopying> key){
        LinkHandle_REF(UIView, NSDictionary)
        if(![_self[key] isKindOfClass:[UIView class]])
            return [UIView new];
        return (UIView*)_self[key];
    };
}
- (void)setDictGetViewNoNullType:(UIView *(^)(id<NSCopying>))dictGetViewNoNullType{};

- (BOOL (^)(id<NSCopying>))dictGetBOOLNoNullType
{
    return ^(id<NSCopying> key){
        LinkHandle_VAL_IF(NSDictionary){
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
        LinkHandle_VAL_IF(NSDictionary){
            return NO;
        }
        return [[_self allKeys] containsObject:key];
    };
}
- (void)setDictContainerKey:(BOOL (^)(id<NSCopying>))blockContainerKey{};

- (BOOL (^)(id))dictContainerValue
{
    return ^(id value){
        LinkHandle_VAL_IF(NSDictionary){
            return NO;
        }
        return [[_self allValues] containsObject:value];
    };
}
- (void)setDictContainerValue:(BOOL (^)(id))blockContainerValue{};

- (NSArray *(^)(id))dictKeysForValue
{
    return ^id(id value){
        LinkHandle_REF(NSArray, NSDictionary)
        return [_self allKeysForObject:value];
    };
}
- (void)setDictKeysForValue:(NSArray *(^)(id))blockKeysForValue{};

- (NSArray *(^)())dictAllKeys
{
    return ^id(){
        LinkHandle_REF(NSArray, NSDictionary)
        return [_self allKeys];
    };
}
- (void)setDictAllKeys:(NSArray *(^)())blockAllKeys{};
- (NSArray *(^)())dictAllValues
{
    return ^id(){
        LinkHandle_REF(NSArray, NSDictionary)
        return [_self allValues];
    };
}
- (void)setDictAllValues:(NSArray *(^)())blockAllValues{};

- (NSMutableDictionary *(^)(id<NSCopying>, id<NSCopying>))dictReplaceKey
{
    return ^id(id<NSCopying> replaceKey, id<NSCopying> withKey){
        LinkHandle_REF(NSMutableDictionary, NSDictionary)
        NSMutableDictionary* result = [NSMutableDictionary dictionaryWithDictionary:_self];
        
        [[result allKeys] enumerateObjectsUsingBlock:^(id  _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
            
            id value = result[key];
            if([value isKindOfClass:[NSDictionary class]]){//层次遍历字典
                
                result[key] = ((NSDictionary*)value).dictReplaceKey(replaceKey , withKey);
            }
            if([value isKindOfClass:[NSArray class]]){//层次遍历数组
                
                result[key] = ((NSArray*)value).arrReplaceKeyInDict(replaceKey, withKey);
            }
            
            if([[result allKeys] containsObject:replaceKey]){//替换键
                
                result[withKey] = result[replaceKey];
                [result removeObjectForKey:replaceKey];
            }
        }];
        
        return result;
    };
}
- (void)setDictReplaceKey:(NSMutableDictionary *(^)(id<NSCopying>, id<NSCopying>))dictReplaceKey{};

- (NSMutableDictionary *(^)(id<NSCopying>, id<NSCopying>))dictReplaceKeyWithoutDeep
{
    return ^id(id<NSCopying> replaceKey, id<NSCopying> withKey){
        LinkHandle_REF(NSMutableDictionary, NSDictionary)
        NSMutableDictionary* result = [NSMutableDictionary dictionaryWithDictionary:_self];
        [[result allKeys] enumerateObjectsUsingBlock:^(id  _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if([[result allKeys] containsObject:replaceKey]){
                result[withKey] = result[replaceKey];
                [result removeObjectForKey:replaceKey];
            }
        }];
        return result;
    };
}
- (void)setDictReplaceKeyWithoutDeep:(NSMutableDictionary *(^)(id<NSCopying>, id<NSCopying>))dictReplaceKeyWithoutDeep{};

@end
