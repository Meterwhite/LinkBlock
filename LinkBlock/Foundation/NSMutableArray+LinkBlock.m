//
//  NSMutableArray+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"
#import "NSMutableArray+LinkBlock.h"
#import "NSObject+LinkBlock.h"

@implementation NSObject(NSMutableArrayLinkBlock)

- (NSMutableArray *(^)(id))m_arrAddObj
{
    return ^(id obj){
        LinkError_REF_AUTO(NSMutableArray, NSMutableArray);
        if(!obj)goto END;
        [_self addObject:obj];
    END:
        return _self;
    };
}
- (void)setM_arrAddObj:(NSMutableArray *(^)(id))m_arrAddObj{};

- (NSMutableArray *(^)(NSArray *))m_arrAddObjs
{
    return ^(NSArray *arr){
        LinkError_REF_AUTO(NSMutableArray, NSMutableArray);
        if(!arr || ![arr isKindOfClass:[NSArray class]])goto END;
        [_self addObjectsFromArray:arr];
    END:
        return _self;
    };
}
- (void)setM_arrAddObjs:(NSMutableArray *(^)(NSArray *))m_arrAddObjs{};

- (NSMutableArray *(^)(id, NSUInteger))m_arrInsertObjAt
{
    return ^(id obj, NSUInteger index){
        LinkError_REF_AUTO(NSMutableArray, NSMutableArray);
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
    return ^(NSArray * arr, NSUInteger index){
        LinkError_REF_AUTO(NSMutableArray, NSMutableArray);
        if(!_self.count || ![arr isKindOfClass:[NSArray class]] || index>_self.count-1)goto END;
        [_self insertObjects:arr atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(index, arr.count)]];
    END:
        return _self;
    };
}
- (void)setM_arrInsertArrayAt:(NSMutableArray *(^)(NSArray *, NSUInteger))m_arrInsertArrayAt{};

- (NSMutableArray *(^)(id, id))m_arrInsertBefore
{
    return ^(id obj, id beforObj){
        LinkError_REF_AUTO(NSMutableArray, NSMutableArray);
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
    return ^(id obj, id behindObj){
        LinkError_REF_AUTO(NSMutableArray, NSMutableArray);
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
    return ^(id obj){
        LinkError_REF_AUTO(NSMutableArray, NSMutableArray);
        if(!obj)goto END;
        [_self removeObject:obj];
    END:
        return _self;
    };
}
- (void)setM_arrRemoveObj:(NSMutableArray *(^)(id))m_arrRemoveObj{};

- (NSMutableArray *(^)(NSUInteger))m_arrRemoveAt
{
    return ^(NSUInteger index){
        LinkError_REF_AUTO(NSMutableArray, NSMutableArray);
        if(index>_self.count)goto END;
        [_self removeObjectAtIndex:index];
    END:
        return _self;
    };
}
- (void)setM_arrRemoveAt:(NSMutableArray *(^)(NSUInteger))m_arrRemoveAt{};

- (NSMutableArray *(^)(NSUInteger, NSUInteger))m_arrRemoveObjsFromTo
{
    return ^(NSUInteger from, NSUInteger to){
        LinkError_REF_AUTO(NSMutableArray, NSMutableArray);
        if( to>_self.count || from>to )goto END;
        [_self removeObjectsInRange:NSMakeRange(from, to - from + 1)];
    END:
        return _self;
    };
}
- (void)setM_arrRemoveObjsFromTo:(NSMutableArray *(^)(NSUInteger, NSUInteger))m_arrRemoveObjsFromTo{};

- (NSMutableArray *(^)())m_arrRemoveAll
{
    return ^(){
        LinkError_REF_AUTO(NSMutableArray, NSMutableArray);
        [_self removeAllObjects];
        return _self;
    };
}
- (void)setM_arrRemoveAll:(NSMutableArray *(^)())m_arrRemoveAll{};

- (NSMutableArray *(^)(id, id))m_arrReplaceObjWith
{
    return ^(id obj, id withObj){
        LinkError_REF_AUTO(NSMutableArray, NSMutableArray);
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
    return ^(NSUInteger idx){
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
    return ^(NSUInteger from, NSUInteger to){
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
    return ^(){
        return self.arrToDictByKeyNumber();
    };
}
- (void)setM_arrToDictByKeyNumber:(NSDictionary *(^)())m_arrToDictByKeyNumber{};

- (NSDictionary *(^)())m_arrToDictByKeyString
{
    return ^(){
        return self.arrToDictByKeyString();
    };
}
- (void)setM_arrToDictByKeyString:(NSDictionary *(^)())m_arrToDictByKeyString{};


- (NSMutableArray *(^)(NSString *, BOOL))m_arrSortByKey
{
    return ^(NSString* key , BOOL ascending){
        LinkError_REF_AUTO(NSMutableArray, NSMutableArray);
        NSSortDescriptor* sort = [NSSortDescriptor sortDescriptorWithKey:key
                                                               ascending:ascending];
        [_self sortUsingDescriptors:@[sort]];
        return _self;
    };
}
- (void)setM_arrSortByKey:(NSMutableArray *(^)(NSString *, BOOL))m_arrSortByKey{};

- (NSMutableArray *(^)(id, NSString *))m_arrAddOrReplaceObjByKey
{
    return ^(id obj , NSString* key){
        LinkError_REF_AUTO(NSMutableArray, NSMutableArray);
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
    return ^(NSString* predicateFormat){
        LinkError_REF_AUTO(NSMutableArray, NSMutableArray);
        [_self filterUsingPredicate:[NSPredicate predicateWithFormat:predicateFormat]];
        return _self;
    };
}
- (void)setM_arrFilter:(NSMutableArray *(^)(NSString *))m_arrFilter{};

- (NSMutableArray *(^)(id, NSString *, NSUInteger))m_arrInsertOrReplaceObjByKeyAt
{
    return ^(id obj , NSString* key , NSUInteger idx){
        LinkError_REF_AUTO(NSMutableArray, NSMutableArray);
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
    return ^(id obj , NSString* key){
        LinkError_REF_AUTO(NSMutableArray, NSMutableArray);
        
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
    return ^(NSArray* objs , NSString* key){
        LinkError_REF_AUTO(NSMutableArray, NSMutableArray);
        [objs enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            _self.m_arrTryReplaceObjByKey(obj, key);
        }];
        return _self;
    };
}
- (void)setM_arrTryReplaceObjsByKey:(NSMutableArray *(^)(NSArray *, NSString *))m_arrTryReplaceObjsByKey{};

- (NSMutableArray *(^)(NSUInteger))m_arrSubFrom
{
    return ^(NSUInteger idx){
        LinkError_REF_AUTO(NSMutableArray, NSMutableArray);
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
    return ^(NSUInteger idx){
        LinkError_REF_AUTO(NSMutableArray, NSMutableArray);
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
    return ^(__unsafe_unretained Class typeClass){
        LinkError_REF_AUTO(NSMutableArray, NSMutableArray);
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
- (void)setM_arrObjsOfType:(NSArray *(^)(__unsafe_unretained Class))m_arrObjsOfType{};

- (NSMutableArray *(^)(id<NSCopying>, id<NSCopying>))m_arrReplaceKeyInDict
{
    return ^(id<NSCopying> replaceKey,id<NSCopying> withKey){
        return self.arrReplaceKeyInDict(replaceKey, withKey);
    };
}
- (void)setM_arrReplaceKeyInDict:(NSMutableArray *(^)(id<NSCopying>, id<NSCopying>))m_arrReplaceKeyInDict{};

- (NSMutableArray *(^)(id<NSCopying>, id<NSCopying>))m_arrReplaceKeyInDictWithoutDeep
{
    return ^(id<NSCopying> replaceKey,id<NSCopying> withKey){
        return self.arrReplaceKeyInDictWithoutDeep(replaceKey, withKey);
    };
}
- (void)setM_arrReplaceKeyInDictWithoutDeep:(NSMutableArray *(^)(id<NSCopying>, id<NSCopying>))m_arrReplaceKeyInDictWithoutDeep{};
@end
