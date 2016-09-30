//
//  NSDictionary+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(NSDictionaryLinkBlock)


- (NSObject* (^)(id<NSCopying>))dictGet
{
    return ^id(id<NSCopying> key){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictGet,key)
        return _self[key];
    };
}

- (NSObject* (^)(id<NSCopying>))dictGetNoNSNull
{
    return ^id(id<NSCopying> key){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictGetNoNSNull,key)
        if(!_self[key] || [_self[key] isKindOfClass:[NSNull class]] ){
            return (id)nil;
        }
        return _self[key];
    };
}


- (BOOL (^)(id<NSCopying>))dictGetBOOL
{
    return ^(id<NSCopying> key){
        LinkHandle_VAL_IFNOT(NSDictionary){
            return NO;
        }
        LinkGroupHandle_VAL(dictGetBOOL,key)
        if(_self[key] && ![_self[key] isKindOfClass:[NSNull class]]){//@(0),@"1",...
            if([_self[key] isKindOfClass:[NSNumber class]] || [_self[key] isKindOfClass:[NSString class]])
            {
                return [_self[key] boolValue];//@(0),@"0"
            }else{
                return NO;
            }
        }else{//nil,NSNull
            return NO;
        }
        return [_self[key] boolValue];
    };
}

- (NSNumber* (^)(id<NSCopying>))dictGetBOOL_n
{
    return ^id(id<NSCopying> key){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictGetBOOL_n,key)
        if(_self[key] && ![_self[key] isKindOfClass:[NSNull class]]){//@(0),@"1",...
            if([_self[key] isKindOfClass:[NSNumber class]] || [_self[key] isKindOfClass:[NSString class]])
            {
                return @([_self[key] boolValue]);//@(0),@"0"
            }else{
                return @NO;
            }
        }else{//nil,NSNull
            return @NO;
        }
        return @([_self[key] boolValue]);
    };
}

- (BOOL (^)(id<NSCopying>))dictContainerKey
{
    return ^(id<NSCopying> key){
        LinkHandle_VAL_IFNOT(NSDictionary){
            return NO;
        }
        LinkGroupHandle_VAL(dictContainerKey,key)
        return [[_self allKeys] containsObject:key];
    };
}

- (NSNumber* (^)(id<NSCopying>))dictContainerKey_n
{
    return ^id(id<NSCopying> key){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictContainerKey_n,key)
        return @([[_self allKeys] containsObject:key]);
    };
}

- (BOOL (^)(id))dictContainerValue
{
    return ^(id value){
        LinkHandle_VAL_IFNOT(NSDictionary){
            return NO;
        }
        LinkGroupHandle_VAL(dictContainerValue,value)
        return [[_self allValues] containsObject:value];
    };
}

- (NSNumber* (^)(id))dictContainerValue_n
{
    return ^id(id value){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictContainerValue_n,value)
        return @([[_self allValues] containsObject:value]);
    };
}

- (NSArray *(^)(id))dictKeysForValue
{
    return ^id(id value){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictKeysForValue,value)
        return [_self allKeysForObject:value];
    };
}

- (NSArray *(^)())dictAllKeys
{
    return ^id(){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictAllKeys)
        return [_self allKeys];
    };
}

- (NSArray *(^)())dictAllValues
{
    return ^id(){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictAllValues)
        return [_self allValues];
    };
}

- (NSMutableDictionary *(^)(id<NSCopying>, id<NSCopying>))dictReplaceKey
{
    return ^id(id<NSCopying> replaceKey, id<NSCopying> withKey){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictReplaceKey,replaceKey,withKey)
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

- (NSMutableDictionary *(^)(id<NSCopying>, id<NSCopying>))dictReplaceKeyWithoutDeep
{
    return ^id(id<NSCopying> replaceKey, id<NSCopying> withKey){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictReplaceKeyWithoutDeep,replaceKey,withKey)
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

- (NSDictionary *(^)())dictObjsValueRandom
{
    return ^id(){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictObjsValueRandom)
        [_self.allValues enumerateObjectsUsingBlock:^(NSObject*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.objValueRandom();
        }];
        return _self;
    };
}
@end
