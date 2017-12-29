//
//  NSArray+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"
#import <stdarg.h>

@implementation NSObject(NSArraryLinkBlock)

- (NSObject *(^)(id, NSString *))linkArgumentsEvalCode
{
    return ^id(id origin , NSString* code){
        LinkHandle_REF(NSArray)
        
        
//        va_list list;
//        
////        ( ap = (va_list)&v + _INTSIZEOF(v) )
//        id firstObject = _self.firstObject;
//        list = ((__builtin_va_list)&firstObject + sizeof(firstObject));
        
        return nil;
    };
}

- (NSObject *)makeLinkObjs
{
    LinkHandle_REF(NSArray)
    if([self isKindOfClass:[LinkGroup class]]){
        LinkGroup* group = (id)_self;
        LinkGroup* newGroup = [LinkGroup groupWithArr:group.linkObjects];
        newGroup.userInfo = [group.userInfo mutableCopy];
        newGroup.throwCount = group.throwCount;
        return newGroup;
    }
    return [LinkGroup groupWithArr:_self];
}

- (BOOL (^)(NSUInteger))arrContainIndex
{
    return ^BOOL(NSUInteger index){
        LinkHandle_VAL_IFNOT(NSArray){
            return NO;
        }
        LinkGroupHandle_VAL(arrContainIndex,index)
        return index< _self.count;
    };
}

- (NSNumber* (^)(NSUInteger))arrContainIndex_n
{
    return ^id(NSUInteger index){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrContainIndex_n,index)
        return @(index< _self.count);
    };
}

- (NSUInteger (^)(id))arrIndexOfObj
{
    return ^NSUInteger(id obj){
        LinkHandle_VAL_IFNOT(NSArray){
            return NSNotFound;
        }
        LinkGroupHandle_VAL(arrIndexOfObj, obj)
        return [_self indexOfObject:obj];
    };
}

- (NSNumber *(^)(id))arrIndexOfObj_n
{
    return ^id(id obj){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrIndexOfObj_n, obj)
        return @([_self indexOfObject:obj]);
    };
}

- (NSMutableArray *(^)(NSMutableArray *))arrAddToArr
{
    return ^id(NSMutableArray* arr){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrAddToArr,arr)
        [arr addObjectsFromArray:_self];
        return linkObj(arr);
    };
}

- (NSArray *(^)(NSUInteger, NSUInteger))arrObjsFromIndexTo
{
    return ^id(NSUInteger idx1, NSUInteger idx2){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrObjsFromIndexTo,idx1,idx2)
        if(!_self.count ||idx1>idx2 || idx1> _self.count-1) return [NSArray new];
        if(idx2> _self.count-1) idx2= _self.count - 1;
        return [_self subarrayWithRange:NSMakeRange(idx1, idx2 - idx1 + 1)];
    };
}

- (NSMutableString *(^)(NSString *))arrJoin
{
    return ^id(NSString* split){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrJoin,split)
        NSMutableString* re = [NSMutableString new];
        [_self enumerateObjectsUsingBlock:^(id  _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
            if(![item isKindOfClass:[NSString class]]){
                [re appendString:[item description]];
            }else{
                [re appendString:item];
            }
            if(split && idx!=_self.count-1){
                [re appendString:split];
            }
        }];
        return re;
    };
}

- (NSMutableArray *(^)())arrJoinArr
{
    return ^id(){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrJoinArr)
        NSMutableArray* re = [NSMutableArray new];
        [_self enumerateObjectsUsingBlock:^(id  _Nonnull arrItem, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if([arrItem isKindOfClass:[NSArray class]]){
                [re addObjectsFromArray:arrItem];
            }
        }];
        return re;
    };
}

- (NSMutableDictionary *(^)())arrJoinDict
{
    return ^id(){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrJoinDict)
        NSMutableDictionary* re = [NSMutableDictionary new];
        [_self enumerateObjectsUsingBlock:^(id  _Nonnull dictItem, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if([dictItem isKindOfClass:[NSDictionary class]]){
                [re addEntriesFromDictionary:dictItem];
            }
        }];
        return re;
    };
}

- (NSMutableArray *(^)(NSUInteger))arrSplitWithCount
{
    return ^id(NSUInteger count){
        if(!count) return self;
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrSplitWithCount,count)
        NSMutableArray* re = [NSMutableArray new];
        if(_self.count){
            
            [_self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                NSUInteger groupIdx = idx / count;
                NSMutableArray* group;
                if(re.count > groupIdx ){
                    
                    group = [re objectAtIndex:groupIdx];
                }else{
                    
                    group = [NSMutableArray new];
                    [re addObject:group];
                }
                [group addObject:obj];
            }];
        }
        return re;
    };
}

- (__kindof NSArray *(^)(id, NSString *))arrSetValueForKey
{
    return ^id(id value , NSString* key){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrSetValueForKey,value,key)
        [_self setValue:value forKeyPath:key];
        return _self;
    };
}

- (NSDictionary *(^)())arrToDictByKeyNumber
{
    return ^id(){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrToDictByKeyNumber)
        NSMutableDictionary* re= [NSMutableDictionary dictionary];
        [_self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [re setObject:obj forKey:@(idx)];
        }];
        return [re copy];
    };
}

- (NSDictionary *(^)())arrToDictByKeyString
{
    return ^id(){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrToDictByKeyString)
        NSMutableDictionary* re= [NSMutableDictionary dictionary];
        [_self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [re setObject:obj forKey:[NSString stringWithFormat:@"%lu", (unsigned long)idx]];
        }];
        return [re copy];
    };
}

- (NSIndexPath *(^)())arrToNSIndexPath
{
    return ^id(){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrToNSIndexPath)
        if(!_self.count) return [NSNull null];
        NSUInteger* idxs = malloc(sizeof(NSUInteger)*_self.count);
        for (NSUInteger i = 0; i<_self.count; i++) {
            idxs[i] = [_self[i] unsignedIntegerValue];
        }
        return [NSIndexPath indexPathWithIndexes:idxs length:_self.count];
    };
}

- (BOOL (^)(id))arrContain
{
    return ^(id obj){
        LinkHandle_VAL_IFNOT(NSArray){
            return NO;
        }
        LinkGroupHandle_VAL(arrContain,obj)
        return [_self containsObject:obj];
    };
}

- (NSNumber* (^)(id))arrContain_n
{
    return ^id(id obj){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrContain_n,obj)
        return @([_self containsObject:obj]);
    };
}

- (NSMutableArray *(^)(NSUInteger))arrSubFrom
{
    return ^id(NSUInteger idx){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrSubFrom,idx)
        NSUInteger count = _self.count;
        if(idx >= count ) return _self;
        return [[_self subarrayWithRange:NSMakeRange(idx, count - idx)] mutableCopy];
    };
}

- (NSMutableArray *(^)(NSUInteger))arrSubTo
{
    return ^id(NSUInteger idx){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrSubTo,idx)
        NSUInteger count = _self.count;
        if(idx >= count ) return _self;
        return [[_self subarrayWithRange:NSMakeRange(0, idx)] mutableCopy];
    };
}

- (NSObject* (^)())arrAny
{
    return ^id(){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_VAL(arrAny)
        if(_self.count)
            return _self[arc4random_uniform((u_int32_t)_self.count)];
        return [NSNull null];
    };
}

- (NSObject* (^)(NSUInteger))arrAt
{
    return ^id(NSUInteger idx){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_VAL(arrAt,idx)
        if(idx>_self.count-1){
            return [[LinkError errorWithCustomDescription:[NSString stringWithFormat:@"数组%p越界",_self]] logError];
        }
        return [_self objectAtIndex:idx];
    };
}

- (NSMutableArray *(^)(NSString * , ...))arrFilter
{
    return ^id(NSString* predicateFormat , ...){
        
        LinkHandle_REF(NSArray)
        ///////////////////////
        //LinkGroupHandle_REF
        if([self isKindOfClass:[LinkGroup class]]){
            LinkGroup* group = (LinkGroup*)self;
            NSMutableArray* returnObjs = [NSMutableArray new];
            
            va_list args;
            va_start(args, predicateFormat);
            for (int i=0; i<group.linkObjects.count; i++) {
                
                id re = [(id)group.linkObjects[i]
                         filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:predicateFormat arguments:args]];
                [returnObjs addObject:[re mutableCopy]];
            }
            va_end(args);
            [group.linkObjects setArray:returnObjs];
            return group;
        }
        //LinkGroupHandle_VAL
        ///////////////////////
        
        va_list args;
        va_start(args, predicateFormat);
        NSPredicate* predicate = [NSPredicate predicateWithFormat:predicateFormat arguments:args];
        va_end(args);
        return [[_self filteredArrayUsingPredicate:predicate] mutableCopy];
    };
}

- (NSIndexSet *(^)(id))arrIndexSetOfValue
{
    return ^id(id value){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrIndexSetOfValue,value)
        return  [_self indexesOfObjectsPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if([obj isEqual:value]) return YES;
            return NO;
        }];
    };
}

- (NSNumber *(^)())arrMaxNumber
{
    return ^id(){
        LinkHandle_REF(NSArray)
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
        LinkHandle_REF(NSArray)
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
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrLast)
        return [_self lastObject];
    };
}

- (NSObject *(^)())arrFirst
{
    return ^id(){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrFirst)
        return [_self firstObject];
    };
}

- (NSMutableArray *(^)(id<NSCopying>, id<NSCopying>))arrReplaceKeyInDict
{
    return ^id(id<NSCopying> replaceKey,id<NSCopying> withKey){
        LinkHandle_REF(NSArray)
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
        LinkHandle_REF(NSArray)
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

- (NSMutableArray *(^)())arrObjsValueRandom
{
    return ^id(){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrObjsValueRandom)
        
        [_self enumerateObjectsUsingBlock:^(NSObject*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.objValuesRandom();
        }];
        return [_self mutableCopy];
    };
}

- (NSMutableArray *(^)(__unsafe_unretained Class))arrObjsOfType
{
    return ^id(__unsafe_unretained Class typeClass){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrObjsOfType,typeClass)
        if(!typeClass)
            return _self;
        NSMutableArray* re = [NSMutableArray array];
        [_self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if([obj isKindOfClass:typeClass]){
                [re addObject:obj];
            }
        }];
        return re;
    };
}

- (NSMutableArray *(^)(BOOL))arrSort
{
    return ^id(BOOL ascending){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrSort,ascending)
        
        if([self isKindOfClass:[NSMutableArray class]]){
            [_self sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                return [obj1 compare:obj2]*(ascending?1:-1);
            }];
            return _self;
        }else{
            return [_self sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                return [obj1 compare:obj2]*(ascending?1:-1);
            }];
        }
    };
}

- (NSMutableArray *(^)(NSString *, BOOL))arrSortByKey
{
    return ^id(NSString* key , BOOL ascending){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrSortByKey,key,ascending)
        NSSortDescriptor* sort = [NSSortDescriptor sortDescriptorWithKey:key
                                                               ascending:ascending];
        if([_self isKindOfClass:[NSMutableArray class]]){
            [_self sortUsingDescriptors:@[sort]];
            return _self;
        }else{
            return [_self sortedArrayUsingDescriptors:@[sort]];
        }
    };
}

- (NSMutableArray *(^)())arrReversed
{
    return ^id(){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrReversed)
        return [[[_self reverseObjectEnumerator] allObjects] mutableCopy];
    };
}

- (NSMutableArray *(^)(NSArray *, NSString *))arrMinusArrByKey
{
    return ^id(NSArray* arr, NSString* key){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrMinusArrByKey,arr,key)
        NSMutableArray* re = [NSMutableArray new];
        __block BOOL hasItem;
        [_self enumerateObjectsUsingBlock:^(id fromItem, NSUInteger i, BOOL * stopI) {
            hasItem = NO;
            [arr enumerateObjectsUsingBlock:^(id toItem, NSUInteger j, BOOL * stopJ) {
                
                if(linkObj((NSObject*)[fromItem valueForKeyPath:key]).objIsEqual([toItem valueForKeyPath:key])){
                    hasItem = YES; *stopJ = YES;
                }
            }];
            if(!hasItem){
                [re addObject:fromItem];
            }
        }];
        return re;
    };
}

- (NSMutableArray *(^)(NSArray *, NSString *))arrUnionArrByKey
{
    return ^id(NSArray* arr, NSString* key){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrMinusArrByKey,arr,key)
        NSMutableArray* re = [NSMutableArray arrayWithArray:_self];
        __block BOOL hasItem;
        [_self enumerateObjectsUsingBlock:^(id fromItem, NSUInteger i, BOOL * stopI) {
            hasItem = NO;
            [arr enumerateObjectsUsingBlock:^(id toItem, NSUInteger j, BOOL * stopJ) {
                
                if(linkObj((NSObject*)[fromItem valueForKeyPath:key]).objIsEqual([toItem valueForKeyPath:key])){
                    hasItem = YES; *stopJ = YES;
                }
            }];
            if(!hasItem){
                [re addObject:fromItem];
            }
        }];
        return re;
    };
}

- (NSMutableArray *(^)(NSArray *, NSString *))arrInterectArrByKey
{
    return ^id(NSArray* arr, NSString* key){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrMinusArrByKey,arr,key)
        NSMutableArray* re = [NSMutableArray new];
        __block BOOL hasItem;
        [_self enumerateObjectsUsingBlock:^(id fromItem, NSUInteger i, BOOL * stopI) {
            hasItem = NO;
            [arr enumerateObjectsUsingBlock:^(id toItem, NSUInteger j, BOOL * stopJ) {
                
                if(linkObj((NSObject*)[fromItem valueForKeyPath:key]).objIsEqual([toItem valueForKeyPath:key])){
                    hasItem = YES; *stopJ = YES;
                }
            }];
            if(hasItem){
                [re addObject:fromItem];
            }
        }];
        return re;
    };
}

- (BOOL (^)(NSString *, id))arrKeyValueContain
{
    return ^(NSString* key , id eqValue){
        LinkHandle_VAL_IFNOT(NSArray){
            return NO;
        }
        LinkGroupHandle_VAL(arrKeyValueContain,key,eqValue)
        return [[_self valueForKeyPath:key] containsObject:eqValue];
    };
}

- (NSNumber *(^)(NSString *, id))arrKeyValueContain_n
{
    return ^id(NSString* key , id eqValue){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrKeyValueContain_n,key,eqValue)
        return @((BOOL)[[_self valueForKeyPath:key] containsObject:eqValue]);
    };
}

- (NSMutableArray *(^)(NSString *, id))arrKeyValueMatchObjs
{
    return ^id(NSString* key , id eqValue){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrKeyValueMatchObjs,key,eqValue)
        NSMutableArray* re = [NSMutableArray new];
        [_self enumerateObjectsUsingBlock:^(id  _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if([[item valueForKeyPath:key] isEqual:eqValue]) [re addObject:item];
        }];
        return re;
    };
}

- (NSMutableArray *(^)(NSDictionary<NSString*,id>*))arrKeyValuesMatchObjs
{
    return ^id(NSDictionary<NSString*,id>* kv){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrKeyValuesMatchObjs,kv)
        NSMutableArray* re = [NSMutableArray new];
        [_self enumerateObjectsUsingBlock:^(id  _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
            
            __block BOOL match = YES;
            [kv enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id  _Nonnull value, BOOL * _Nonnull stop) {
                
                if(![[item valueForKeyPath:key] isEqual:value]){
                    match = NO; *stop = YES;
                }
            }];
            [re addObject:item];
        }];
        return re;
    };
}

- (NSMutableArray *(^)(id))arrAddObj
{
    return ^id(id obj){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrAddObj , obj)
        if(![_self isKindOfClass:[NSMutableArray class]]){
            _self = [_self mutableCopy];
        }
        return _self.m_arrAddObj(obj);
    };
}

- (NSMutableArray *(^)(id))arrAddObjNotContain
{
    return ^id(id obj){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrAddObjNotContain , obj)
        if(![_self isKindOfClass:[NSMutableArray class]]){
            _self = [_self mutableCopy];
        }
        return _self.m_arrAddObjNotContain(obj);
    };
}

- (NSMutableArray *(^)(NSArray *))arrAddObjs
{
    return ^id(NSArray *arr){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrAddObjs,arr)
        if(![_self isKindOfClass:[NSMutableArray class]]){
            _self = [_self mutableCopy];
        }
        return _self.m_arrAddObjs(arr);
    };
}

- (NSMutableArray *(^)(id, NSUInteger))arrInsertObjAt
{
    return ^id(id obj, NSUInteger index){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrInsertObjAt,obj,index)
        if(![_self isKindOfClass:[NSMutableArray class]]){
            _self = [_self mutableCopy];
        }
        return _self.m_arrInsertObjAt(obj,index);
    };
}

- (NSMutableArray *(^)(NSArray *, NSUInteger))arrInsertArrayAt
{
    return ^id(NSArray * arr, NSUInteger index){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrInsertArrayAt,arr,index)
        if(![_self isKindOfClass:[NSMutableArray class]]){
            _self = [_self mutableCopy];
        }
        return _self.m_arrInsertArrayAt(arr,index);
    };
}

- (NSMutableArray *(^)(id, id))arrInsertBefore
{
    return ^id(id obj, id beforObj){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrInsertBefore,obj,beforObj)
        if(![_self isKindOfClass:[NSMutableArray class]]){
            _self = [_self mutableCopy];
        }
        return _self.m_arrInsertBefore(obj,beforObj);
    };
}

- (NSMutableArray *(^)(id, id))arrInsertNext
{
    return ^id(id obj, id nextObj){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrInsertNext,obj,nextObj)
        if(![_self isKindOfClass:[NSMutableArray class]]){
            _self = [_self mutableCopy];
        }
        return _self.m_arrInsertNext(obj,nextObj);
    };
}

- (NSObject *(^)(id))arrBefore
{
    return ^id(id obj){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrBefore,obj)
        return linkObj_id(obj).objBeforeInArr(_self);
    };
}

- (NSObject *(^)(id))arrNext
{
    return ^id(id obj){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrNext,obj)
        return linkObj_id(obj).objNextInArr(_self);
    };
}

- (NSMutableArray *(^)(id))arrRemoveObj
{
    return ^id(id obj){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrRemoveObj,obj)
        if(![_self isKindOfClass:[NSMutableArray class]]){
            _self = [_self mutableCopy];
        }
        return _self.m_arrRemoveObj(obj);
    };
}

- (NSMutableArray *(^)(NSUInteger))arrRemoveAt
{
    return ^id(NSUInteger index){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrRemoveAt,index)
        if(![_self isKindOfClass:[NSMutableArray class]]){
            _self = [_self mutableCopy];
        }
        return _self.m_arrRemoveAt(index);
    };
}
- (NSMutableArray *(^)(NSUInteger, NSUInteger))arrRemoveObjsFromTo
{
    return ^id(NSUInteger from, NSUInteger to){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrRemoveObjsFromTo,from,to)
        if(![_self isKindOfClass:[NSMutableArray class]]){
            _self = [_self mutableCopy];
        }
        return _self.m_arrRemoveObjsFromTo(from,to);
    };
}

- (NSMutableArray *(^)())arrRemoveAll
{
    return ^id(){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrRemoveAll)
        if(![_self isKindOfClass:[NSMutableArray class]]){
            _self = [_self mutableCopy];
        }
        return _self.m_arrRemoveAll();
    };
}

- (NSMutableArray *(^)(id, id))arrReplaceObjWith
{
    return ^id(id obj, id withObj){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrReplaceObjWith,obj,withObj)
        if(![_self isKindOfClass:[NSMutableArray class]]){
            _self = [_self mutableCopy];
        }
        return _self.m_arrReplaceObjWith(obj,withObj);
    };
}

- (NSMutableArray<NSValue *> *(^)(BOOL, BOOL))arrSortRange
{
    return ^id(BOOL ascending, BOOL isCombine){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrSortRange,ascending,isCombine)
        if(![_self isKindOfClass:[NSMutableArray class]]){
            _self = [_self mutableCopy];
        }
        return _self.m_arrSortRange(ascending,isCombine);
    };
}

- (NSMutableArray *(^)(id, NSString *))arrAddOrReplaceObjByKey
{
    return ^id(id obj , NSString* key){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrAddOrReplaceObjByKey,obj,key)
        if(![_self isKindOfClass:[NSMutableArray class]]){
            _self = [_self mutableCopy];
        }
        return _self.m_arrAddOrReplaceObjByKey(obj,key);
    };
}

- (NSMutableArray *(^)(id, NSString *, NSUInteger))arrInsertOrReplaceObjByKeyAt
{
    return ^id(id obj , NSString* key , NSUInteger idx){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrInsertOrReplaceObjByKeyAt,obj,key,idx)
        if(![_self isKindOfClass:[NSMutableArray class]]){
            _self = [_self mutableCopy];
        }
        return _self.m_arrInsertOrReplaceObjByKeyAt(obj,key,idx);
    };
}

- (NSMutableArray *(^)(id, NSString *))arrTryReplaceObjByKey
{
    return ^id(id obj , NSString* key){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrTryReplaceObjByKey,obj,key)
        if(![_self isKindOfClass:[NSMutableArray class]]){
            _self = [_self mutableCopy];
        }
        return _self.m_arrTryReplaceObjByKey(obj,key);
    };
}

- (NSMutableArray *(^)(NSArray *, NSString *))arrTryReplaceObjsByKey
{
    return ^id(NSArray* objs , NSString* key){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrTryReplaceObjsByKey,objs,key)
        if(![_self isKindOfClass:[NSMutableArray class]]){
            _self = [_self mutableCopy];
        }
        return _self.m_arrTryReplaceObjsByKey(objs,key);
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
            block([string substringWithRange:range], range , isCustom , &stop);
        }
    }
}
@end
