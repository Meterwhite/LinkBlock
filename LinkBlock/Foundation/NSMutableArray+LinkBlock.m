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
        LinkGroupHandle_REF(m_arrAddObj , obj)
        if(!obj)goto END;
        [_self addObject:obj];
    END:
        return _self;
    };
}

- (NSMutableArray *(^)(NSArray *))m_arrAddObjs
{
    return ^id(NSArray *arr){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        LinkGroupHandle_REF(m_arrAddObjs,arr)
        if(!arr || ![arr isKindOfClass:[NSArray class]])goto END;
        [_self addObjectsFromArray:arr];
    END:
        return _self;
    };
}

- (NSMutableArray *(^)(id, NSUInteger))m_arrInsertObjAt
{
    return ^id(id obj, NSUInteger index){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        LinkGroupHandle_REF(m_arrInsertObjAt,obj,index)
        if(!obj || index>_self.count)
            return _self;
        if(!_self.count){
           [_self addObject:obj];
        }
        [_self insertObject:obj atIndex:index];
        return _self;
    };
}

- (NSMutableArray *(^)(NSArray *, NSUInteger))m_arrInsertArrayAt
{
    return ^id(NSArray * arr, NSUInteger index){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        LinkGroupHandle_REF(m_arrInsertArrayAt,arr,index)
        if(!_self.count || ![arr isKindOfClass:[NSArray class]] || index>_self.count-1)goto END;
        [_self insertObjects:arr atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(index, arr.count)]];
    END:
        return _self;
    };
}

- (NSMutableArray *(^)(id, id))m_arrInsertBefore
{
    return ^id(id obj, id beforObj){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        LinkGroupHandle_REF(m_arrInsertBefore,obj,beforObj)
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

- (NSMutableArray *(^)(id, id))m_arrInsertBehind
{
    return ^id(id obj, id behindObj){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        LinkGroupHandle_REF(m_arrInsertBehind,obj,behindObj)
        if(!obj || !behindObj) goto END;
        NSUInteger idx= [_self indexOfObject:behindObj];
        if(idx != NSNotFound){
            [_self insertObject:obj atIndex:idx];
        }
    END:
        return _self;
    };
}

- (NSMutableArray *(^)(id))m_arrRemoveObj
{
    return ^id(id obj){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        LinkGroupHandle_REF(m_arrRemoveObj,obj)
        if(!obj)goto END;
        [_self removeObject:obj];
    END:
        return _self;
    };
}

- (NSMutableArray *(^)(NSUInteger))m_arrRemoveAt
{
    return ^id(NSUInteger index){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        LinkGroupHandle_REF(m_arrRemoveAt,index)
        if(index>_self.count)goto END;
        [_self removeObjectAtIndex:index];
    END:
        return _self;
    };
}

- (NSMutableArray *(^)(NSUInteger, NSUInteger))m_arrRemoveObjsFromTo
{
    return ^id(NSUInteger from, NSUInteger to){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        LinkGroupHandle_REF(m_arrRemoveObjsFromTo,from,to)
        if( to>_self.count || from>to )goto END;
        [_self removeObjectsInRange:NSMakeRange(from, to - from + 1)];
    END:
        return _self;
    };
}

- (NSMutableArray *(^)())m_arrRemoveAll
{
    return ^id(){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        LinkGroupHandle_REF(m_arrRemoveAll)
        [_self removeAllObjects];
        return _self;
    };
}

- (NSMutableArray *(^)(id, id))m_arrReplaceObjWith
{
    return ^id(id obj, id withObj){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        LinkGroupHandle_REF(m_arrReplaceObjWith,obj,withObj)
        if(!obj|| !withObj)goto END;
        NSInteger idx= [_self indexOfObject:obj];
        if(idx != NSNotFound){
            [_self replaceObjectAtIndex:idx withObject:withObj];
        }
    END:
        return _self;
    };
}

- (NSObject* (^)(NSUInteger))m_arrAt
{
    return ^id(NSUInteger idx){
        return self.arrAt(idx);
    };
}

- (BOOL (^)(NSString *))m_arrIsContainerStr
{
    return ^(NSString* str){
        return self.arrIsContainerStr(str);
    };
}

- (BOOL (^)(id))m_arrContain
{
    return ^(id obj){
        return self.arrIsContainer(obj);
    };
}

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

- (NSDictionary *(^)())m_arrToDictByKeyNumber
{
    return ^id(){
        return self.arrToDictByKeyNumber();
    };
}

- (NSDictionary *(^)())m_arrToDictByKeyString
{
    return ^id(){
        return self.arrToDictByKeyString();
    };
}



- (NSMutableArray *(^)(NSString *, BOOL))m_arrSortByKey
{
    return ^id(NSString* key , BOOL ascending){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        LinkGroupHandle_REF(m_arrSortByKey,key,ascending)
        NSSortDescriptor* sort = [NSSortDescriptor sortDescriptorWithKey:key
                                                               ascending:ascending];
        [_self sortUsingDescriptors:@[sort]];
        return _self;
    };
}

- (NSMutableArray *(^)(id, NSString *))m_arrAddOrReplaceObjByKey
{
    return ^id(id obj , NSString* key){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        LinkGroupHandle_REF(m_arrAddOrReplaceObjByKey,obj,key)
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

- (NSMutableArray *(^)(NSString *))m_arrFilter
{
    return ^id(NSString* predicateFormat){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        LinkGroupHandle_REF(m_arrFilter,predicateFormat)
        [_self filterUsingPredicate:[NSPredicate predicateWithFormat:predicateFormat]];
        return _self;
    };
}

- (NSMutableArray *(^)(id, NSString *, NSUInteger))m_arrInsertOrReplaceObjByKeyAt
{
    return ^id(id obj , NSString* key , NSUInteger idx){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        LinkGroupHandle_REF(m_arrInsertOrReplaceObjByKeyAt,obj,key,idx)
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

- (NSMutableArray *(^)(id, NSString *))m_arrTryReplaceObjByKey
{
    return ^id(id obj , NSString* key){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        LinkGroupHandle_REF(m_arrTryReplaceObjByKey,obj,key)
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

- (NSMutableArray *(^)(NSArray *, NSString *))m_arrTryReplaceObjsByKey
{
    return ^id(NSArray* objs , NSString* key){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        LinkGroupHandle_REF(m_arrTryReplaceObjsByKey,objs,key)
        [objs enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            _self.m_arrTryReplaceObjByKey(obj, key);
        }];
        return _self;
    };
}

- (NSMutableArray *(^)(NSUInteger))m_arrSubFrom
{
    return ^id(NSUInteger idx){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        LinkGroupHandle_REF(m_arrSubFrom,idx)
        NSUInteger count = _self.count;
        if(idx >= count ) return _self;
        NSIndexSet* idxSet = [[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(idx, count - idx)];
        [_self objectsAtIndexes:idxSet];
        return _self;
    };
}

- (NSMutableArray *(^)(NSUInteger))m_arrSubTo
{
    return ^id(NSUInteger idx){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        LinkGroupHandle_REF(m_arrSubTo,idx)
        NSUInteger count = _self.count;
        if(idx >= count ) return _self;
        NSIndexSet* idxSet = [[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(0, idx)];
        [_self objectsAtIndexes:idxSet];
        return _self;
    };
}

- (NSMutableArray *(^)(__unsafe_unretained Class))m_arrObjsOfType
{
    return ^id(__unsafe_unretained Class typeClass){
        LinkHandle_REF(NSMutableArray, NSMutableArray)
        LinkGroupHandle_REF(m_arrObjsOfType,typeClass)
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

- (NSMutableArray *(^)(id<NSCopying>, id<NSCopying>))m_arrReplaceKeyInDict
{
    return ^id(id<NSCopying> replaceKey,id<NSCopying> withKey){
        return self.arrReplaceKeyInDict(replaceKey, withKey);
    };
}

- (NSMutableArray *(^)(id<NSCopying>, id<NSCopying>))m_arrReplaceKeyInDictWithoutDeep
{
    return ^id(id<NSCopying> replaceKey,id<NSCopying> withKey){
        return self.arrReplaceKeyInDictWithoutDeep(replaceKey, withKey);
    };
}

- (NSObject* (^)())m_arrAny
{
    return ^id(){
        LinkHandle_REF(NSObject, NSArray)
        LinkGroupHandle_REF(m_arrAny)
        return _self[arc4random_uniform((u_int32_t)_self.count)];
    };
}

- (NSMutableArray<NSValue *> *(^)(BOOL, BOOL))m_arrSortRange
{
    return ^id(BOOL ascending, BOOL isCombine){
        LinkHandle_REF(NSMutableArray<NSValue *>, NSMutableArray<NSValue *>)
        LinkGroupHandle_REF(m_arrSortRange,ascending,isCombine)
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

@end