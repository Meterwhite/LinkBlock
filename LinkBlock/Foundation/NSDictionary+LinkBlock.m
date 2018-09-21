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

- (id (^)(id<NSCopying>))dictGetNoNSNull
{
    return ^id(id<NSCopying> key){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictGetNoNSNull,key)
        if(!_self[key] || [_self[key] isKindOfClass:[NSNull class]] ){
            return nil;
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

- (NSNumber* (^)(id<NSCopying>))dictGetBOOLING
{
    return ^id(id<NSCopying> key){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictGetBOOLING,key)
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

- (BOOL (^)(id<NSCopying>))dictContaineKey
{
    return ^(id<NSCopying> key){
        LinkHandle_VAL_IFNOT(NSDictionary){
            return NO;
        }
        LinkGroupHandle_VAL(dictContaineKey,key)
        return [[_self allKeys] containsObject:key];
    };
}

- (NSNumber* (^)(id<NSCopying>))dictContaineKeyING
{
    return ^id(id<NSCopying> key){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictContaineKeyING,key)
        return @([[_self allKeys] containsObject:key]);
    };
}

- (BOOL (^)(id))dictContaineValue
{
    return ^(id value){
        LinkHandle_VAL_IFNOT(NSDictionary){
            return NO;
        }
        LinkGroupHandle_VAL(dictContaineValue,value)
        return [[_self allValues] containsObject:value];
    };
}

- (NSNumber* (^)(id))dictContaineValue_n
{
    return ^id(id value){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictContaineValue_n,value)
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

- (NSArray *(^)(void))dictAllKeys
{
    return ^id(){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictAllKeys)
        return [_self allKeys];
    };
}

- (NSArray *(^)(void))dictAllValues
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

- (NSDictionary *(^)(void))dictObjsValueRandom
{
    return ^id(){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictObjsValueRandom)
        [_self.allValues enumerateObjectsUsingBlock:^(NSObject*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.objValuesRandom();
        }];
        return _self;
    };
}

- (NSMutableDictionary *(^)(id<NSCopying>  , id))dictSetValue
{
    return ^id(id<NSCopying> key  , id value){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictSetValue,key,value)
        if(![_self isKindOfClass:[NSMutableDictionary class]]){
            _self = [_self mutableCopy];
        }
        if(value && key ){
            [_self setObject:value forKey:key];
        }
        return _self;
    };
}

- (NSMutableDictionary *(^)(NSDictionary *))dictUnionDict
{
    return ^id(NSDictionary* dict){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictUnionDict,dict)
        if(![_self isKindOfClass:[NSMutableDictionary class]]){
            _self = [_self mutableCopy];
        }
        return _self.m_dictUnionDict(dict);
    };
}

- (UIImage *(^)(void))dictForUIImagePickerControllerMediaType
{
    return ^id(){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictForUIImagePickerControllerMediaType)
        return _self[UIImagePickerControllerMediaType];
    };
}
- (UIImage *(^)(void))dictForUIImagePickerControllerOriginalImage
{
    return ^id(){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictForUIImagePickerControllerOriginalImage)
        return _self[UIImagePickerControllerOriginalImage];
    };
}
- (UIImage *(^)(void))dictForUIImagePickerControllerEditedImage
{
    return ^id(){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictForUIImagePickerControllerEditedImage)
        return _self[UIImagePickerControllerEditedImage];
    };
}
- (UIImage *(^)(void))dictForUIImagePickerControllerCropRect
{
    return ^id(){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictForUIImagePickerControllerCropRect)
        return _self[UIImagePickerControllerCropRect];
    };
}
- (UIImage *(^)(void))dictForUIImagePickerControllerMediaURL
{
    return ^id(){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictForUIImagePickerControllerMediaURL)
        return _self[UIImagePickerControllerMediaURL];
    };
}
- (UIImage *(^)(void))dictForUIImagePickerControllerReferenceURL
{
    return ^id(){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictForUIImagePickerControllerReferenceURL)
        return _self[UIImagePickerControllerReferenceURL];
    };
}
- (UIImage *(^)(void))dictForUIImagePickerControllerMediaMetadata
{
    return ^id(){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictForUIImagePickerControllerMediaMetadata)
        return _self[UIImagePickerControllerMediaMetadata];
    };
}
- (UIImage *(^)(void))dictForUIImagePickerControllerLivePhoto
{
    return ^id(){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictForUIImagePickerControllerLivePhoto)
        return _self[UIImagePickerControllerLivePhoto];
    };
}
@end
