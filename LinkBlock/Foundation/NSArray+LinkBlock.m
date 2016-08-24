//
//  NSArray+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(NSArraryLinkBlock)

- (NSObject *)makeLinkObjs
{
    LinkHandle_REF(NSObject, NSArray)
    if([self isKindOfClass:[LinkGroup class]]){
        LinkGroup* group = (id)_self;
        LinkGroup* newGroup = [LinkGroup groupWithArr:group.linkObjects];
        newGroup.userInfo = [group.userInfo mutableCopy];
        newGroup.throwCount = group.throwCount;
        return newGroup;
    }
    return [LinkGroup groupWithArr:_self];
}

- (BOOL (^)(NSString *))arrIsContainerStr
{
    return ^(NSString* str){
        LinkHandle_VAL_IFNOT(NSArray){
            return NO;
        }
        LinkGroupHandle_VAL(arrIsContainerStr,str);
        
        __block BOOL re= NO;
        [_self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if([obj isKindOfClass:[NSString class]] && [obj isEqualToString:str]){
                re= YES;
                *stop= YES;
            }
        }];
        return re;
    };
}

- (BOOL (^)(NSUInteger))arrcontainIndex
{
    return ^(NSUInteger index){
        LinkHandle_VAL_IFNOT(NSArray){
            return NO;
        }
        LinkGroupHandle_VAL(arrcontainIndex,index)
        return (BOOL)(index< _self.count);
    };
}



- (NSArray *(^)(NSUInteger, NSUInteger))arrObjsFromIndexTo
{
    return ^id(NSUInteger idx1, NSUInteger idx2){
        LinkHandle_REF(NSArray, NSArray)
        LinkGroupHandle_REF(arrObjsFromIndexTo,idx1,idx2)
        if(!_self.count ||idx1>idx2 || idx1> _self.count-1)
            return @[];
        
        if(idx2> _self.count-1)
            idx2= _self.count - 1;

        NSUInteger loc = idx1;
        NSUInteger len = idx2 - idx1 + 1;
        return [_self subarrayWithRange:NSMakeRange(loc, len)];
    };
}

- (NSDictionary *(^)())arrToDictByKeyNumber
{
    return ^id(){
        LinkHandle_REF(NSDictionary, NSArray)
        LinkGroupHandle_REF(arrToDictByKeyNumber)
        NSMutableDictionary* reIsDictM= [NSMutableDictionary dictionary];
        [_self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [reIsDictM setObject:obj forKey:@(idx)];
        }];
        return (NSDictionary*)[reIsDictM copy];
    };
}

- (NSDictionary *(^)())arrToDictByKeyString
{
    return ^id(){
        LinkHandle_REF(NSDictionary, NSArray)
        LinkGroupHandle_REF(arrToDictByKeyString)
        NSMutableDictionary* reIsDictM= [NSMutableDictionary dictionary];
        [_self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [reIsDictM setObject:obj forKey:[NSString stringWithFormat:@"%lu", (unsigned long)idx]];
        }];
        return (NSDictionary*)[reIsDictM copy];
    };
}

- (BOOL (^)(id))arrIsContainer
{
    return ^(id obj){
        LinkHandle_VAL_IFNOT(NSArray){
            return NO;
        }
        LinkGroupHandle_VAL(arrIsContainer,obj)
        return [_self containsObject:obj];
    };
}

- (id (^)())arrAny
{
    return ^id(){
        LinkHandle_VAL_IFNOT(NSArray){
            return (id)nil;
        }
        LinkGroupHandle_VAL(arrAny)
        return _self[arc4random_uniform((u_int32_t)_self.count)];
    };
}

- (id (^)(NSUInteger))arrAt
{
    return ^id(NSUInteger idx){
        LinkHandle_VAL_IFNOT(NSArray){
            return (id)nil;
        }
        LinkGroupHandle_VAL(arrAt,idx)
        id re;
        if(_self.arrcontainIndex(idx)){
            re = [_self objectAtIndex:idx];
        }else{
            re = nil;
        }
        return re;
    };
}



- (NSArray *(^)(__unsafe_unretained Class))arrValuesOfType
{
    return ^id(__unsafe_unretained Class typeClass){
        LinkHandle_REF(NSArray, NSArray)
        LinkGroupHandle_VAL(arrValuesOfType,typeClass)
        if(!typeClass)
            return _self;
        NSMutableArray* re = [NSMutableArray array];
        [_self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if([obj isKindOfClass:typeClass]){
                [re addObject:obj];
            }
        }];
        return (NSArray*)re.objCopy();
    };
}

- (NSArray *(^)(NSString *))arrFilter
{
    return ^id(NSString* predicateFormat){
        LinkHandle_REF(NSArray, NSArray)
        LinkGroupHandle_REF(arrFilter,predicateFormat)
        return [_self filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:predicateFormat]];
    };
}

- (NSIndexSet *(^)(id))arrIndexSetOfValue
{
    return ^id(id value){
        LinkHandle_REF(NSIndexSet, NSArray)
        LinkGroupHandle_REF(arrIndexSetOfValue,value)
        return  [_self indexesOfObjectsPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if([obj isEqual:value])
                return YES;
            return NO;
        }];
    };
}

- (NSNumber *(^)())arrMaxNumber
{
    return ^id(){
        LinkHandle_REF(NSNumber, NSArray)
        LinkGroupHandle_REF(arrMaxNumber)
        __block NSNumber* max = _self[0];
        [_self enumerateObjectsUsingBlock:^(NSNumber* num, NSUInteger idx, BOOL *stop) {
            if([num isKindOfClass:[NSNumber class]])
                if(max.doubleValue < num.doubleValue)
                    max = num;
        }];
        return max;
    };
}

- (NSNumber *(^)())arrMinNumber
{
    return ^id(){
        LinkHandle_REF(NSNumber, NSArray)
        LinkGroupHandle_REF(arrMinNumber)
        __block NSNumber* min = _self[0];
        [_self enumerateObjectsUsingBlock:^(NSNumber* num, NSUInteger idx, BOOL *stop) {
            if([num isKindOfClass:[NSNumber class]])
                if(min.doubleValue > num.doubleValue)
                    min = num;
        }];
        return min;
    };
}

- (NSObject *(^)())arrLast
{
    return ^id(){
        LinkHandle_REF(NSObject, NSArray)
        LinkGroupHandle_REF(arrLast)
        return [_self lastObject];
    };
}

- (NSObject *(^)())arrFirst
{
    return ^id(){
        LinkHandle_REF(NSObject, NSArray)
        LinkGroupHandle_REF(arrFirst)
        return [_self firstObject];
    };
}

- (NSMutableArray *(^)(id<NSCopying>, id<NSCopying>))arrReplaceKeyInDict
{
    return ^id(id<NSCopying> replaceKey,id<NSCopying> withKey){
        LinkHandle_REF(NSMutableArray, NSArray)
        LinkGroupHandle_REF(arrReplaceKeyInDict,replaceKey,withKey)
        NSMutableArray* re = [NSMutableArray arrayWithArray:_self];
        [re enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull dict, NSUInteger idx, BOOL * _Nonnull stop) {
            if([dict isKindOfClass:[NSDictionary class]]){
                dict = dict.dictReplaceKey(replaceKey, withKey);
                re[idx] = dict;
            }
        }];
        return re;
    };
}

- (NSMutableArray *(^)(id<NSCopying>, id<NSCopying>))arrReplaceKeyInDictWithoutDeep
{
    return ^id(id<NSCopying> replaceKey,id<NSCopying> withKey){
        LinkHandle_REF(NSMutableArray, NSArray)
        LinkGroupHandle_REF(arrReplaceKeyInDictWithoutDeep,replaceKey,withKey)
        NSMutableArray* re = [NSMutableArray arrayWithArray:_self];
        [re enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull dict, NSUInteger idx, BOOL * _Nonnull stop) {
            if([dict isKindOfClass:[NSDictionary class]]){
                dict = dict.dictReplaceKeyWithoutDeep(replaceKey, withKey);
                re[idx] = dict;
            }
        }];
        return re;
    };
}


@end

@implementation NSArray(NSArraryLinkBlock)

- (NSMutableArray *)arrFindUsingBlock:(BOOL (^)(id, NSUInteger, BOOL *))block
{
    NSMutableArray* reArr = [NSMutableArray new];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if(block(obj,idx,stop)){
            [reArr addObject:obj];
        }
    }];
    return reArr;
}

- (void)arrEnumerateWithPredicateFormat:(NSString *)predicateFormat
                             usingBlock:(void (^)(id, NSUInteger, BOOL *))block
{
    NSMutableArray* re= [NSMutableArray new];
    NSPredicate* predicate = [NSPredicate predicateWithFormat:predicateFormat];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if([predicate evaluateWithObject:obj]){
            [re addObject:obj];
            if(block) block(obj, idx, stop);
        }
    }];
}

- (void)arrStringEnumerateComposedInString:(NSString *)string usingBlock:(void (^)(NSString *, NSRange,BOOL , BOOL *))block
{
    if(block){
        
        NSMutableArray<NSValue*>* rangeRules = [NSMutableArray new];
        [self enumerateObjectsUsingBlock:^(NSString*  _Nonnull ruleString, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if(![ruleString isKindOfClass:[NSString class]]){*stop = YES;return;}
            NSRange range;
            for (int i =0 ; i<string.length; i+=(range.location + range.length)) {
                
                range = [string rangeOfString:ruleString options:0 range:NSMakeRange(i, string.length-i)];
                if(range.length==0) break;
                [rangeRules addObject:[NSValue valueWithRange:range]];
            }
        }];
        rangeRules.m_arrSortRange(YES,YES);
        
        NSRange range; BOOL isCustom = NO; BOOL stop = NO;
        for(int i=0; (i<string.length && !stop); i+=range.length){
            
            if(rangeRules.count && [rangeRules firstObject].rangeValue.location == i){
                //当前起始点是一个规则起点
                range = [rangeRules firstObject].rangeValue;
                [rangeRules removeObjectAtIndex:0];
                isCustom = YES;
            }else{
                //普通元字符
                range = [string rangeOfComposedCharacterSequenceAtIndex:i];
                isCustom = NO;
            }
            block([string substringWithRange:range], range, isCustom , &stop);
        }
    }
}
@end