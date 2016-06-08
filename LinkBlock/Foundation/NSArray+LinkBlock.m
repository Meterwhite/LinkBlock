//
//  NSArray+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(NSArraryLinkBlock)
- (BOOL (^)(NSString *))arrIsContainerStr
{
    return ^(NSString* str){
        LinkError_VAL_IF(NSArray){
            return NO;
        }
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
- (void)setArrIsContainerStr:(BOOL (^)(NSString *))blockContainerStr{};

- (BOOL (^)(NSUInteger))arrcontainIndex
{
    return ^(NSUInteger index){
        LinkError_VAL_IF(NSArray){
            return NO;
        }
        return (BOOL)(index< _self.count);
    };
}
- (void)setArrcontainIndex:(BOOL (^)(NSUInteger))arrcontainIndex{};


- (NSArray *(^)(NSUInteger, NSUInteger))arrObjsFromIndexTo
{
    return ^(NSUInteger idx1, NSUInteger idx2){
        LinkError_REF_AUTO(NSArray, NSArray);
        if(!_self.count ||idx1>idx2 || idx1> _self.count-1)
            return @[];

        if(idx2> _self.count-1)
            idx2= _self.count - 1;

        NSUInteger loc = idx1;
        NSUInteger len = idx2 - idx1 + 1;
        return [_self subarrayWithRange:NSMakeRange(loc, len)];
    };
}
- (void)setArrObjsFromIndexTo:(NSArray *(^)(NSUInteger, NSUInteger))blockObjsFromIndexTo{};

- (NSDictionary *(^)())arrToDictByKeyNumber
{
    return ^(){
        LinkError_REF_AUTO(NSDictionary, NSArray);
        NSMutableDictionary* reIsDictM= [NSMutableDictionary dictionary];
        [_self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [reIsDictM setObject:obj forKey:@(idx)];
        }];
        return (NSDictionary*)[reIsDictM copy];
    };
}
- (void)setArrToDictByKeyNumber:(NSDictionary *(^)())blockArrToDictByNumberKey{};

- (NSDictionary *(^)())arrToDictByKeyString
{
    return ^(){
        LinkError_REF_AUTO(NSDictionary, NSArray);
        NSMutableDictionary* reIsDictM= [NSMutableDictionary dictionary];
        [_self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [reIsDictM setObject:obj forKey:[NSString stringWithFormat:@"%lu", (unsigned long)idx]];
        }];
        return (NSDictionary*)[reIsDictM copy];
    };
}
- (void)setArrToDictByKeyString:(NSDictionary *(^)())blockArrToDictByStringKey{};

- (BOOL (^)(id))arrIsContainer
{
    return ^(id obj){
        LinkError_VAL_IF(NSArray){
            return NO;
        }
        return [_self containsObject:obj];
    };
}
- (void)setArrIsContainer:(BOOL (^)(id))blockContainer{};

- (id (^)())arrAny
{
    return ^(){
        LinkError_VAL_IF(NSArray){
            return (id)nil;
        }
        return _self[arc4random_uniform((u_int32_t)_self.count)];
    };
}
- (void)setArrAny:(id(^)())arrAny{};

- (id (^)(NSUInteger))arrAt
{
    return ^(NSUInteger idx){
        LinkError_VAL_IF(NSArray){
            return (id)nil;
        }
        id re;
        if(_self.arrcontainIndex(idx)){
            re = [_self objectAtIndex:idx];
        }else{
            re = nil;
        }
        return re;
    };
}
- (void)setArrAt:(id (^)(NSUInteger))arrAt{};


- (NSArray *(^)(__unsafe_unretained Class))arrValuesOfType
{
    return ^(__unsafe_unretained Class typeClass){
        LinkError_REF_AUTO(NSArray, NSArray);
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
- (void)setArrValuesOfType:(NSArray *(^)(__unsafe_unretained Class))blockValuesOfType{};

- (NSArray *(^)(NSString *))arrFilter
{
    return ^(NSString* predicateFormat){
        LinkError_REF_AUTO(NSArray, NSArray);
        return [_self filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:predicateFormat]];
    };
}
- (void)setArrFilter:(NSArray *(^)(NSString *))arrFilter{};

- (NSIndexSet *(^)(id))arrIndexSetOfValue
{
    return ^(id value){
        LinkError_REF_AUTO(NSIndexSet, NSArray);
        return  [_self indexesOfObjectsPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if([obj isEqual:value])
                return YES;
            return NO;
        }];
    };
}
- (void)setArrIndexSetOfValue:(NSIndexSet *(^)(id))arrIndexSetOfValue{};

- (NSNumber *(^)())arrMaxNumber
{
    return ^(){
        LinkError_REF_AUTO(NSNumber, NSArray);
        __block NSNumber* max = _self[0];
        [_self enumerateObjectsUsingBlock:^(NSNumber* num, NSUInteger idx, BOOL *stop) {
            if([num isKindOfClass:[NSNumber class]])
                if(max.doubleValue < num.doubleValue)
                    max = num;
        }];
        return max;
    };
}
- (void)setArrMaxNumber:(NSNumber *(^)())arrValueNumberMax{};

- (NSNumber *(^)())arrMinNumber
{
    return ^(){
        LinkError_REF_AUTO(NSNumber, NSArray);
        __block NSNumber* min = _self[0];
        [_self enumerateObjectsUsingBlock:^(NSNumber* num, NSUInteger idx, BOOL *stop) {
            if([num isKindOfClass:[NSNumber class]])
                if(min.doubleValue > num.doubleValue)
                    min = num;
        }];
        return min;
    };
}
- (void)setArrMinNumber:(NSNumber *(^)())arrMinNumberFind{};

- (NSObject *(^)())arrLast
{
    return ^(){
        LinkError_REF_AUTO(NSObject, NSArray);
        return (NSObject*)[_self lastObject];
    };
}
- (void)setArrLast:(NSObject *(^)())arrLast{};

- (NSObject *(^)())arrFirst
{
    return ^(){
        LinkError_REF_AUTO(NSObject, NSArray);
        return (NSObject*)[_self firstObject];
    };
}
- (void)setArrFirst:(NSObject *(^)())arrFirst{};

- (NSMutableArray *(^)(id<NSCopying>, id<NSCopying>))arrReplaceKeyInDict
{
    return ^(id<NSCopying> replaceKey,id<NSCopying> withKey){
        LinkError_REF_AUTO(NSMutableArray, NSArray);
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
- (void)setArrReplaceKeyInDict:(NSMutableArray *(^)(id<NSCopying>, id<NSCopying>))arrReplaceKeyInDict{};

- (NSMutableArray *(^)(id<NSCopying>, id<NSCopying>))arrReplaceKeyInDictWithoutDeep
{
    return ^(id<NSCopying> replaceKey,id<NSCopying> withKey){
        LinkError_REF_AUTO(NSMutableArray, NSArray);
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
- (void)setArrReplaceKeyInDictWithoutDeep:(NSMutableArray *(^)(id<NSCopying>, id<NSCopying>))arrReplaceKeyInDictWithoutDeep{};

@end

@implementation NSArray(NSArraryLinkBlock)

- (void)arrEnumerateWithPredicateFormat:(NSString *)predicateFormat
                             usingBlock:(void (^)(id, NSUInteger, BOOL *))block
{
    LinkError_VAL_IF(NSArray){
        return;
    }
    NSMutableArray* re= [NSMutableArray new];
    NSPredicate* predicate = [NSPredicate predicateWithFormat:predicateFormat];
    [_self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if([predicate evaluateWithObject:obj]){
            [re addObject:obj];
            if(block) block(obj, idx, &*stop);
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