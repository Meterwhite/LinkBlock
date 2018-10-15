//
//  NSMutableArray+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(NSMutableArrayLinkBlock)

//- (NSMutableArray *(^)(id))m_arrAddObj
//{
//    return ^id(id obj){
//        LinkHandle_REF(NSMutableArray)
//        LinkGroupHandle_REF(m_arrAddObj , obj)
//        if(obj){
//            [_self addObject:obj];
//        }
//        return _self;
//    };
//}
//
//- (NSMutableArray *(^)(id))m_arrAddObjOnlyOne
//{
//    return ^id(id obj){
//        LinkHandle_REF(NSMutableArray)
//        LinkGroupHandle_REF(m_arrAddObjOnlyOne , obj)
//
//        if(!obj || [_self containsObject:obj])
//            goto CALL_RET;
//        [_self addObject:obj];
//    CALL_RET:
//        return _self;
//    };
//}
//
//- (NSMutableArray *(^)(NSArray *))m_arrAddObjs
//{
//    return ^id(NSArray *arr){
//        LinkHandle_REF(NSMutableArray)
//        LinkGroupHandle_REF(m_arrAddObjs,arr)
//        if(!arr || ![arr isKindOfClass:[NSArray class]])
//            goto CALL_RET;
//        [_self addObjectsFromArray:arr];
//    CALL_RET:
//        return _self;
//    };
//}
//
//- (NSMutableArray *(^)(id, NSUInteger))m_arrInsertObjAt
//{
//    return ^id(id obj, NSUInteger index){
//        LinkHandle_REF(NSMutableArray)
//        LinkGroupHandle_REF(m_arrInsertObjAt,obj,index)
//        if(!obj || index>_self.count)
//            return _self;
//        if(!_self.count){
//           [_self addObject:obj];
//        }else{
//            [_self insertObject:obj atIndex:index];
//        }
//        return _self;
//    };
//}
//
//
//- (NSMutableArray *(^)(id, id))m_arrInsertObjBeforeTo
//{
//    return ^id(id obj, id beforObj){
//        LinkHandle_REF(NSMutableArray)
//        LinkGroupHandle_REF(m_arrInsertObjBeforeTo,obj,beforObj)
//        if(!obj || !beforObj) goto CALL_RET;
//        NSInteger idx= [_self indexOfObject:beforObj];
//        if(idx != NSNotFound){
//            idx = idx-1<0 ? 0: idx;
//            [_self insertObject:obj atIndex:idx];
//        }
//    CALL_RET:
//        return _self;
//    };
//}
//
//- (NSMutableArray *(^)(id, id))m_arrInsertObjNextTo
//{
//    return ^id(id obj, id nexObj){
//        LinkHandle_REF(NSMutableArray)
//        LinkGroupHandle_REF(m_arrInsertObjNextTo,obj,nexObj)
//        if(!obj || !nexObj) goto CALL_RET;
//        NSUInteger idx= [_self indexOfObject:nexObj];
//        if(idx != NSNotFound){
//            idx = (idx+1 > _self.count-1) ? _self.count-1 : idx+1;
//            [_self insertObject:obj atIndex:idx];
//        }
//    CALL_RET:
//        return _self;
//    };
//}
//
//- (NSMutableArray *(^)(id))m_arrRemoveObj
//{
//    return ^id(id obj){
//        LinkHandle_REF(NSMutableArray)
//        LinkGroupHandle_REF(m_arrRemoveObj,obj)
//        if(!obj)goto CALL_RET;
//        [_self removeObject:obj];
//    CALL_RET:
//        return _self;
//    };
//}
//
//- (NSMutableArray *(^)(NSUInteger))m_arrRemoveAt
//{
//    return ^id(NSUInteger index){
//        LinkHandle_REF(NSMutableArray)
//        LinkGroupHandle_REF(m_arrRemoveAt,index)
//        if(index>_self.count)goto CALL_RET;
//        [_self removeObjectAtIndex:index];
//    CALL_RET:
//        return _self;
//    };
//}
//
//- (NSMutableArray *(^)(NSUInteger, NSUInteger))m_arrRemoveObjsFromTo
//{
//    return ^id(NSUInteger from, NSUInteger to){
//        LinkHandle_REF(NSMutableArray)
//        LinkGroupHandle_REF(m_arrRemoveObjsFromTo,from,to)
//        if( to>_self.count || from>to )goto CALL_RET;
//        [_self removeObjectsInRange:NSMakeRange(from, to - from + 1)];
//    CALL_RET:
//        return _self;
//    };
//}
//
//- (NSMutableArray *(^)(void))m_arrRemoveAll
//{
//    return ^id(){
//        LinkHandle_REF(NSMutableArray)
//        LinkGroupHandle_REF(m_arrRemoveAll)
//        [_self removeAllObjects];
//        return _self;
//    };
//}
//
//- (NSMutableArray *(^)(id, id))m_arrReplaceObjWith
//{
//    return ^id(id obj, id withObj){
//        LinkHandle_REF(NSMutableArray)
//        LinkGroupHandle_REF(m_arrReplaceObjWith,obj,withObj)
//
//        if(!obj || !withObj) return _self;
//
//        NSUInteger idx =[_self indexOfObject:obj];
//        if(idx != NSNotFound){
//            [_self setObject:withObj atIndexedSubscript:idx];
//        }
//        return _self;
//    };
//}
//
//- (NSMutableArray *(^)(NSString *, BOOL))m_arrSortByKey
//{
//    return ^id(NSString* key , BOOL ascending){
//        LinkHandle_REF(NSMutableArray)
//        LinkGroupHandle_REF(m_arrSortByKey,key,ascending)
//        NSSortDescriptor* sort = [NSSortDescriptor sortDescriptorWithKey:key
//                                                               ascending:ascending];
//        [_self sortUsingDescriptors:@[sort]];
//        return _self;
//    };
//}
//
//- (NSMutableArray *(^)(BOOL))m_arrSort
//{
//    return ^id(BOOL ascending){
//        LinkHandle_REF(NSMutableArray)
//        LinkGroupHandle_REF(m_arrSort,ascending)
//        [_self sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
//            return [obj1 compare:obj2]*(ascending?1:-1);
//        }];
//        return _self;
//    };
//}
//
//- (NSMutableArray *(^)(id, NSString *))m_arrAddOrReplaceWhenObjValueMatchedForKey
//{
//    return ^id(id obj , NSString* key){
//        LinkHandle_REF(NSMutableArray)
//        LinkGroupHandle_REF(m_arrAddOrReplaceWhenObjValueMatchedForKey,obj,key)
//        id uniqueValue = [obj valueForKey:key];
//        NSArray* values = [_self valueForKey:key];
//        NSIndexSet* idxSet = [values indexesOfObjectsPassingTest:^BOOL(id  _Nonnull val, NSUInteger idx, BOOL * _Nonnull stop) {
//
//            if([val isEqual:uniqueValue])
//                return YES;
//            return NO;
//        }];
//        if(idxSet.count){
//
//            [idxSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
//                _self[idx] = obj;
//            }];
//            return _self;
//        }
//
//        [_self addObject:obj];
//        return _self;
//    };
//}
//
//- (NSMutableArray *(^)(NSString *,...))m_arrFilter
//{
//    return ^id(NSString* predicateFormat,...){
//        LinkHandle_REF(NSMutableArray)
//        ///////////////////////
//        //LinkGroupHandle_REF
//        if([self isKindOfClass:[LinkGroup class]]){
//            LinkGroup* group = (LinkGroup*)self;
//
//            va_list args;
//            va_start(args, predicateFormat);
//            for (int i=0; i<group.linkObjects.count; i++) {
//
//                [(id)group.linkObjects[i]
//                         filterUsingPredicate:[NSPredicate predicateWithFormat:predicateFormat arguments:args]];
//            }
//            va_end(args);
//            return group;
//        }
//        //LinkGroupHandle_VAL
//        ///////////////////////
//
//        va_list args;
//        va_start(args, predicateFormat);
//        NSPredicate* predicate = [NSPredicate predicateWithFormat:predicateFormat arguments:args];
//        va_end(args);
//        [_self filterUsingPredicate:predicate];
//        return _self;
//    };
//}
//
//- (NSMutableArray *(^)(id, NSString *, NSUInteger))m_arrInsertOrReplaceWhenObjValueMatchedForKeyAt
//{
//    return ^id(id obj , NSString* key , NSUInteger idx){
//        LinkHandle_REF(NSMutableArray)
//        LinkGroupHandle_REF(m_arrInsertOrReplaceWhenObjValueMatchedForKeyAt,obj,key,idx)
//        id uniqueValue = [obj valueForKey:key];
//        NSArray* values = [_self valueForKey:key];
//        NSIndexSet* idxSet = [values indexesOfObjectsPassingTest:^BOOL(id  _Nonnull val, NSUInteger idx, BOOL * _Nonnull stop) {
//
//            if([val isEqual:uniqueValue])
//                return YES;
//            return NO;
//        }];
//        if(idxSet.count){
//
//            [idxSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
//                _self[idx] = obj;
//            }];
//            return _self;
//        }
//
//        [_self insertObject:obj atIndex:idx];
//        return _self;
//    };
//}
//
//- (NSMutableArray *(^)(id, NSString *))m_arrReplaceWhenObjValueMatchedForKey
//{
//    return ^id(id obj , NSString* key){
//        LinkHandle_REF(NSMutableArray)
//        LinkGroupHandle_REF(m_arrReplaceWhenObjValueMatchedForKey,obj,key)
//        id uniqueValue = [obj valueForKey:key];
//        NSArray* values = [_self valueForKey:key];
//        NSIndexSet* idxSet = [values indexesOfObjectsPassingTest:^BOOL(id  _Nonnull val, NSUInteger idx, BOOL * _Nonnull stop) {
//
//            return [val isEqual:uniqueValue];
//        }];
//        if(idxSet.count){
//
//            [idxSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
//                _self[idx] = obj;
//            }];
//        }
//        return _self;
//    };
//}
//
//- (NSMutableArray *(^)(NSArray *, NSString *))m_arrReplaceWhenObjsValueMatchedForKey
//{
//    return ^id(NSArray* objs , NSString* key){
//        LinkHandle_REF(NSMutableArray)
//        LinkGroupHandle_REF(m_arrReplaceWhenObjsValueMatchedForKey,objs,key)
//        [objs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL* stop) {
//            _self.m_arrReplaceWhenObjValueMatchedForKey(obj, key);
//        }];
//        return _self;
//    };
//}
//
//- (NSMutableArray *(^)(id, id))m_arrReplaceKeyForDictionaryItemDepth
//{
//    return ^id(id replaceKey,id withKey){
//        return self.arrReplaceItemKeyForDictionaryItemDepth(replaceKey, withKey);
//    };
//}
//
//- (NSMutableArray *(^)(id, id))m_arrReplaceKeyForDictionaryItem
//{
//    return ^id(id replaceKey,id withKey){
//        return self.arrReplaceItemKeyForDictionaryItem(replaceKey, withKey);
//    };
//}
//
//- (NSMutableArray *(^)(void))m_arrReversed
//{
//    return ^id(){
//        LinkHandle_REF(NSMutableArray)
//        LinkGroupHandle_REF(m_arrReversed);
//
//        NSUInteger i = 0;
//        NSUInteger j = _self.count-1;
//        id temp;
//        while (i<j) {
//            temp = _self[i];
//            _self[i++] = _self[j];
//            _self[j--] = temp;
//        }
//        return _self;
//    };
//}

@end
