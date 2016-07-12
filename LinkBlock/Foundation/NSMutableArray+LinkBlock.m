//
//  NSMutableArray+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(NSMutableArrayLinkBlock)

- (NSMutableArray *(^)(id))m_arrAddObj
{
    return ^id(id obj){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        LinkGroupHandle(m_arrAddObj , obj)
        if(!obj)goto END;
        [_self addObject:obj];
    END:
        return _self;
    };
}
- (void)setM_arrAddObj:(NSMutableArray *(^)(id))m_arrAddObj{};

- (NSMutableArray *(^)(NSArray *))m_arrAddObjs
{
    return ^id(NSArray *arr){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        if(!arr || ![arr isKindOfClass:[NSArray class]])goto END;
        [_self addObjectsFromArray:arr];
    END:
        return _self;
    };
}
- (void)setM_arrAddObjs:(NSMutableArray *(^)(NSArray *))m_arrAddObjs{};

- (NSMutableArray *(^)(id, NSUInteger))m_arrInsertObjAt
{
    return ^id(id obj, NSUInteger index){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        if(!obj || index>_self.count)
            return _self;
        if(!_self.count){
           [_self addObject:obj];
        }
        [_self insertObject:obj atIndex:index];
        return _self;
    };
}
- (void)setM_arrInsertObjAt:(NSMutableArray *(^)(id, NSUInteger))m_arrInsertObjAt{};

- (NSMutableArray *(^)(NSArray *, NSUInteger))m_arrInsertArrayAt
{
    return ^id(NSArray * arr, NSUInteger index){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        if(!_self.count || ![arr isKindOfClass:[NSArray class]] || index>_self.count-1)goto END;
        [_self insertObjects:arr atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(index, arr.count)]];
    END:
        return _self;
    };
}
- (void)setM_arrInsertArrayAt:(NSMutableArray *(^)(NSArray *, NSUInteger))m_arrInsertArrayAt{};

- (NSMutableArray *(^)(id, id))m_arrInsertBefore
{
    return ^id(id obj, id beforObj){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        if(!obj || !beforObj) goto END;
        long idx= [_self indexOfObject:beforObj];
        if(idx != NSNotFound){
            idx= idx-1<0 ? 0: idx;
            [_self insertObject:obj atIndex:idx];
        }
    END:
        return _self;
    };
}
- (void)setM_arrInsertBefore:(NSMutableArray *(^)(id, id))m_arrInsertBefore{};

- (NSMutableArray *(^)(id, id))m_arrInsertBehind
{
    return ^id(id obj, id behindObj){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        if(!obj || !behindObj) goto END;
        long idx= [_self indexOfObject:behindObj];
        if(idx != NSNotFound){
            [_self insertObject:obj atIndex:idx];
        }
    END:
        return _self;
    };
}
- (void)setM_arrInsertBehind:(NSMutableArray *(^)(id, id))m_arrInsertBehind{};

- (NSMutableArray *(^)(id))m_arrRemoveObj
{
    return ^id(id obj){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        if(!obj)goto END;
        [_self removeObject:obj];
    END:
        return _self;
    };
}
- (void)setM_arrRemoveObj:(NSMutableArray *(^)(id))m_arrRemoveObj{};

- (NSMutableArray *(^)(NSUInteger))m_arrRemoveAt
{
    return ^id(NSUInteger index){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        if(index>_self.count)goto END;
        [_self removeObjectAtIndex:index];
    END:
        return _self;
    };
}
- (void)setM_arrRemoveAt:(NSMutableArray *(^)(NSUInteger))m_arrRemoveAt{};

- (NSMutableArray *(^)(NSUInteger, NSUInteger))m_arrRemoveObjsFromTo
{
    return ^id(NSUInteger from, NSUInteger to){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        if( to>_self.count || from>to )goto END;
        [_self removeObjectsInRange:NSMakeRange(from, to - from + 1)];
    END:
        return _self;
    };
}
- (void)setM_arrRemoveObjsFromTo:(NSMutableArray *(^)(NSUInteger, NSUInteger))m_arrRemoveObjsFromTo{};

- (NSMutableArray *(^)())m_arrRemoveAll
{
    return ^id(){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        [_self removeAllObjects];
        return _self;
    };
}
- (void)setM_arrRemoveAll:(NSMutableArray *(^)())m_arrRemoveAll{};

- (NSMutableArray *(^)(id, id))m_arrReplaceObjWith
{
    return ^id(id obj, id withObj){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        if(!obj|| !withObj)goto END;
        NSInteger idx= [_self indexOfObject:obj];
        if(idx != NSNotFound){
            [_self replaceObjectAtIndex:idx withObject:withObj];
        }
    END:
        return _self;
    };
}
- (void)setM_arrReplaceObjWith:(NSMutableArray *(^)(id, id))m_arrReplaceObjWith{};

- (id (^)(NSUInteger))m_arrAt
{
    return ^id(NSUInteger idx){
        return self.arrAt(idx);
    };
}
- (void)setM_arrAt:(id (^)(NSUInteger))m_arrValueAt{};

- (BOOL (^)(NSString *))m_arrIsContainerStr
{
    return ^(NSString* str){
        return self.arrIsContainerStr(str);
    };
}
- (void)setM_arrIsContainerStr:(BOOL (^)(NSString *))m_arrIsContainerStr{};

- (BOOL (^)(id))m_arrContain
{
    return ^(id obj){
        return self.arrIsContainer(obj);
    };
}
- (void)setM_arrContain:(BOOL (^)(id))m_arrContain{};

- (NSArray *(^)(NSUInteger, NSUInteger))m_arrObjsFromIndexTo
{
    return ^id(NSUInteger from, NSUInteger to){
        return self.arrObjsFromIndexTo(from , to);
    };
}
- (void)setM_arrObjsFromIndexTo:(NSArray *(^)(NSUInteger, NSUInteger))m_arrObjsFromIndexTo
{};

- (BOOL (^)(NSUInteger))m_arrContainIndex
{
    return ^(NSUInteger idx){
        return self.arrcontainIndex(idx);
    };
}
- (void)setM_arrContainIndex:(BOOL (^)(NSUInteger))m_arrContainIndex{};

- (NSDictionary *(^)())m_arrToDictByKeyNumber
{
    return ^id(){
        return self.arrToDictByKeyNumber();
    };
}
- (void)setM_arrToDictByKeyNumber:(NSDictionary *(^)())m_arrToDictByKeyNumber{};

- (NSDictionary *(^)())m_arrToDictByKeyString
{
    return ^id(){
        return self.arrToDictByKeyString();
    };
}
- (void)setM_arrToDictByKeyString:(NSDictionary *(^)())m_arrToDictByKeyString{};


- (NSMutableArray *(^)(NSString *, BOOL))m_arrSortByKey
{
    return ^id(NSString* key , BOOL ascending){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        NSSortDescriptor* sort = [NSSortDescriptor sortDescriptorWithKey:key
                                                               ascending:ascending];
        [_self sortUsingDescriptors:@[sort]];
        return _self;
    };
}
- (void)setM_arrSortByKey:(NSMutableArray *(^)(NSString *, BOOL))m_arrSortByKey{};

- (NSMutableArray *(^)(id, NSString *))m_arrAddOrReplaceObjByKey
{
    return ^id(id obj , NSString* key){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        id uniqueValue = [obj valueForKey:key];
        NSArray* values = [_self valueForKey:key];
        NSIndexSet* idxSet = [values indexesOfObjectsPassingTest:^BOOL(id  _Nonnull val, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if([val isEqual:uniqueValue])
                return YES;
            return NO;
        }];
        if(idxSet.count){
            
            [idxSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
                _self[idx] = obj;
            }];
            return _self;
        }
        
        [_self addObject:obj];
        return _self;
    };
}
- (void)setM_arrAddOrReplaceObjByKey:(NSMutableArray *(^)(id, NSString *))m_arrAddOrReplaceObjByKey{};

- (NSMutableArray *(^)(NSString *))m_arrFilter
{
    return ^id(NSString* predicateFormat){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        [_self filterUsingPredicate:[NSPredicate predicateWithFormat:predicateFormat]];
        return _self;
    };
}
- (void)setM_arrFilter:(NSMutableArray *(^)(NSString *))m_arrFilter{};

- (NSMutableArray *(^)(id, NSString *, NSUInteger))m_arrInsertOrReplaceObjByKeyAt
{
    return ^id(id obj , NSString* key , NSUInteger idx){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        id uniqueValue = [obj valueForKey:key];
        NSArray* values = [_self valueForKey:key];
        NSIndexSet* idxSet = [values indexesOfObjectsPassingTest:^BOOL(id  _Nonnull val, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if([val isEqual:uniqueValue])
                return YES;
            return NO;
        }];
        if(idxSet.count){
            
            [idxSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
                _self[idx] = obj;
            }];
            return _self;
        }
        
        [_self insertObject:obj atIndex:idx];
        return _self;
    };
}
- (void)setM_arrInsertOrReplaceObjByKeyAt:(NSMutableArray *(^)(id, NSString *, NSUInteger))m_arrInsertOrReplaceObjByKeyAt{};

- (NSMutableArray *(^)(id, NSString *))m_arrTryReplaceObjByKey
{
    return ^id(id obj , NSString* key){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        
        id uniqueValue = [obj valueForKey:key];
        NSArray* values = [_self valueForKey:key];
        NSIndexSet* idxSet = [values indexesOfObjectsPassingTest:^BOOL(id  _Nonnull val, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if([val isEqual:uniqueValue])
                return YES;
            return NO;
        }];
        if(idxSet.count){
            
            [idxSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
                _self[idx] = obj;
            }];
        }
        return _self;
    };
}
- (void)setM_arrTryReplaceObjByKey:(NSMutableArray *(^)(id, NSString *))m_arrTryReplaceObjByKey{};

- (NSMutableArray *(^)(NSArray *, NSString *))m_arrTryReplaceObjsByKey
{
    return ^id(NSArray* objs , NSString* key){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        [objs enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            _self.m_arrTryReplaceObjByKey(obj, key);
        }];
        return _self;
    };
}
- (void)setM_arrTryReplaceObjsByKey:(NSMutableArray *(^)(NSArray *, NSString *))m_arrTryReplaceObjsByKey{};

- (NSMutableArray *(^)(NSUInteger))m_arrSubFrom
{
    return ^id(NSUInteger idx){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        NSUInteger count = _self.count;
        if(idx >= count ) return _self;
        NSIndexSet* idxSet = [[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(idx, count - idx)];
        [_self objectsAtIndexes:idxSet];
        return _self;
    };
}
- (void)setM_arrSubFrom:(NSMutableArray *(^)(NSUInteger))m_arrSubFrom{};

- (NSMutableArray *(^)(NSUInteger))m_arrSubTo
{
    return ^id(NSUInteger idx){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        NSUInteger count = _self.count;
        if(idx >= count ) return _self;
        NSIndexSet* idxSet = [[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(0, idx)];
        [_self objectsAtIndexes:idxSet];
        return _self;
    };
}
- (void)setM_arrSubTo:(NSMutableArray *(^)(NSUInteger))m_arrSubTo{};

- (NSMutableArray *(^)(__unsafe_unretained Class))m_arrObjsOfType
{
    return ^id(__unsafe_unretained Class typeClass){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
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
- (void)setM_arrObjsOfType:(NSMutableArray *(^)(__unsafe_unretained Class))m_arrObjsOfType{};

- (NSMutableArray *(^)(id<NSCopying>, id<NSCopying>))m_arrReplaceKeyInDict
{
    return ^id(id<NSCopying> replaceKey,id<NSCopying> withKey){
        return self.arrReplaceKeyInDict(replaceKey, withKey);
    };
}
- (void)setM_arrReplaceKeyInDict:(NSMutableArray *(^)(id<NSCopying>, id<NSCopying>))m_arrReplaceKeyInDict{};

- (NSMutableArray *(^)(id<NSCopying>, id<NSCopying>))m_arrReplaceKeyInDictWithoutDeep
{
    return ^id(id<NSCopying> replaceKey,id<NSCopying> withKey){
        return self.arrReplaceKeyInDictWithoutDeep(replaceKey, withKey);
    };
}
- (void)setM_arrReplaceKeyInDictWithoutDeep:(NSMutableArray *(^)(id<NSCopying>, id<NSCopying>))m_arrReplaceKeyInDictWithoutDeep{};

- (id (^)())m_arrAny
{
    return ^id(){
        LinkHandle_VAL_IF(NSArray){
            return (id)nil;
        }
        return _self[arc4random_uniform((u_int32_t)_self.count)];
    };
}
- (void)setM_arrAny:(id (^)())m_arrAny{};

- (NSMutableArray<NSValue *> *(^)(BOOL, BOOL))m_arrSortRange
{
    return ^id(BOOL ascending, BOOL isCombine){
        LinkHandle_REF(NSMutableArray<NSValue *>, NSMutableArray<NSValue *>)
        
        NSMutableSet<NSValue*>* combineArr = [NSMutableSet new];
        NSInteger flagDirection = ascending?1:-1;
        [_self sortUsingComparator:^NSComparisonResult(NSValue*  _Nonnull obj1, NSValue*  _Nonnull obj2) {
            
            if([obj1 rangeValue].location < [obj2 rangeValue].location){
                
                return NSOrderedAscending*flagDirection;
            }else if ([obj1 rangeValue].location > [obj2 rangeValue].location){
                
                return NSOrderedDescending*flagDirection;
            }else{
                //location相同
                if([obj1 rangeValue].length < [obj2 rangeValue].length){
                    
                    if(isCombine)[combineArr addObject:obj1];
                    return NSOrderedAscending*flagDirection;
                }else if ([obj1 rangeValue].length > [obj2 rangeValue].length){
                    
                    if(isCombine)[combineArr addObject:obj2];
                    return NSOrderedDescending*flagDirection;
                }else{
                    
                    if(isCombine)[combineArr addObject:obj1];
                    return NSOrderedSame;
                }
            }
        }];
        if(isCombine){
            
            [combineArr enumerateObjectsUsingBlock:^(NSValue * _Nonnull combindItem, BOOL * _Nonnull stop) {
                
                [_self removeObjectAtIndex:[_self indexOfObject:combindItem]];
            }];
        }
        return _self;
    };
}
- (void)setM_arrSortRange:(NSMutableArray<NSValue *> *(^)(BOOL, BOOL))m_arrSortRange{};
@end