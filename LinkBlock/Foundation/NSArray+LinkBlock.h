//
//  NSArray+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//
#import "LinkBlockDefine.h"

#ifndef NSArrayNew
#define NSArrayNew ([NSArray new])
#endif


@interface NSObject(NSArraryLinkBlock)

#pragma mark - Foundation Mirror/镜像
@property LB_BK NSObject*                (^arrAt)(NSUInteger idx);
@property LB_BK BOOL                     (^arrContains)(id obj);
@property LB_BK NSNumber*                (^arrContainsAs)(id obj);
@property LB_BK NSMutableArray*          (^arrSubFrom)(NSUInteger idx);
@property LB_BK NSMutableArray*          (^arrSubTo)(NSUInteger idx);
@property LB_BK NSArray*                 (^arrObjsFromIndexTo)(NSUInteger from, NSUInteger to);
@property LB_BK NSObject*                (^arrLast)(void);
@property LB_BK NSObject*                (^arrFirst)(void);

#pragma mark - Foundation Speed/速度
@property LB_BK NSUInteger               (^arrIndexOfObj)(id obj);
@property LB_BK NSNumber*                (^arrIndexOfObjAs)(id obj);
@property LB_BK BOOL                     (^arrContainsIndex)(NSUInteger idx);
@property LB_BK NSNumber*                (^arrContainsIndexAs)(NSUInteger idx);
@property LB_BK NSUInteger               (^arrCountOfObj)(id obj);
@property LB_BK NSNumber*                (^arrCountOfObjAs)(id obj);
@property LB_BK NSMutableArray*          (^arrAddToArrAsWhatSet)(NSMutableArray* arr);
@property LB_BK NSMutableArray*          (^arrReversed)(void);
@property LB_BK NSIndexSet*              (^arrGetValuesIndexForValue)(id value);
/** use compare: to sort value */
@property LB_BK NSMutableArray*          (^arrSort)(BOOL ascending);
@property LB_BK NSMutableArray*          (^arrSortByKey)(NSString* key, BOOL ascending);

#pragma mark - Foundation Extend/补充
/** join item as string,like join() of javescript  */
@property LB_BK NSMutableString*         (^arrJoin)(NSString* split);

/** "age>20" */
@property LB_BK NSMutableArray*          (^arrFilter)(NSString* predicateFormat,...);
/** return NSNull if array.count==0 */
@property LB_BK NSObject*                (^arrAny)(void);
@property LB_BK NSMutableArray*          (^arrObjsWithKindOfClass)(Class typeClass);
@property LB_BK BOOL                     (^arrContainsKeyValue)(NSString* key,id value);
@property LB_BK NSNumber*                (^arrContainsKeyValueAs)(NSString* key,id value);



#pragma mark - Weak coding/弱类型编码
/** @[@0,@1,@2] */
@property LB_BK NSIndexPath*     (^arrToNSIndexPath)(void);
@property LB_BK NSMutableArray*  (^arrAddObj)(id obj);
@property LB_BK NSMutableArray*  (^arrRemoveAll)(void);
@property LB_BK NSMutableArray*  (^arrInsertObjAt)(id obj, NSUInteger index);
@property LB_BK NSMutableArray*  (^arrInsertArrayAt)(NSArray* arr, NSUInteger index);
@property LB_BK NSMutableArray*  (^arrInsertToArrayAt)(NSMutableArray* arr, NSUInteger index);
@property LB_BK NSMutableArray*  (^arrAddObjs)(NSArray* arr);
@property LB_BK NSMutableArray*  (^arrRemoveObj)(id obj);
/** not overflow */
@property LB_BK NSMutableArray*  (^arrRemoveAt)(NSUInteger index);
/** not overflow */
@property LB_BK NSMutableArray*  (^arrRemoveObjsFromTo)(NSUInteger fromIndex,NSUInteger toIndex);
/** add object only one */
@property LB_BK NSMutableArray*  (^arrAddObjOnlyOne)(id obj);
/** insert before */
@property LB_BK NSMutableArray*  (^arrInsertObjBeforeTo)(id insert, id beforeTo);
/** insert next */
@property LB_BK NSMutableArray*  (^arrInsertObjNextTo)(id insert, id nextTo);
/** previous item */
@property LB_BK NSObject*        (^arrGetPrevItemForObj)(id obj);
/** next item */
@property LB_BK NSObject*        (^arrGetNextItemForObj)(id obj);


#pragma mark - LinkBlock
@property LB_BK NSMutableArray*          (^arrKeyValueMatchedObjs)(NSString* key,id value);
@property LB_BK NSMutableArray*          (^arrKeyValuesMatchedObjs)(NSDictionary<NSString*,id>* kv);
@property LB_BK NSMutableArray*          (^arrReplaceObjWith)(id obj,id newObj);
/** join array-type item to one array*/
@property LB_BK NSMutableArray*          (^arrJoinArr)(void);
@property LB_BK NSMutableDictionary*     (^arrJoinDict)(void);
/** add or replace an object if key-value matched */
@property LB_BK NSMutableArray*(^arrAddOrReplaceWhenObjValueMatchedForKey)(id obj , NSString* key);
@property LB_BK NSMutableArray*(^arrInsertOrReplaceWhenObjValueMatchedForKeyAt)(id obj , NSString* key, NSUInteger idx);
/** replace an object if key-value matched */
@property LB_BK NSMutableArray*(^arrReplaceWhenObjValueMatchedForKey)(id obj , NSString* key);
@property LB_BK NSMutableArray*(^arrReplaceWhenObjsValueMatchedForKey)(NSArray* objs , NSString* key);
/** split array,each subarray has same length.Return self if count==0  */
@property LB_BK NSMutableArray*          (^arrSplitWithCount)(NSUInteger count);
@property LB_BK NSNumber*                (^arrMaxNumber)(void);
@property LB_BK NSNumber*                (^arrMinNumber)(void);
/**
 Difference set by key-value,each item must has the same key.
 做'差集'(数组每项必须含字段key)
 */
@property LB_BK NSMutableArray*          (^arrMinusArrByKey)(NSArray* arr, NSString* key);
/**
 union set by key-value,each item must has the same key./并集
 */
@property LB_BK NSMutableArray*          (^arrUnionArrByKey)(NSArray* arr, NSString* key);
/**
 intersection set by key-value,each item must has the same key./交集
 */
@property LB_BK NSMutableArray*          (^arrInterectArrByKey)(NSArray* arr, NSString* key);

@property LB_BK NSMutableArray*          (^arrReplaceKeyForDictionaryItem)(id key,id newKey);
/** arrReplaceKeyForDictionaryItem().Deep traversal */
@property LB_BK NSMutableArray*          (^arrReplaceKeyForDictionaryItemDepth)(id key,id newKey);
/**
 Sort NSValue-NSRange.If isCombine=YES NSRange(0,2) will contain NSRange(0,1).
*/
@property LB_BK NSMutableArray<NSValue*>*(^arrSortRange)(BOOL ascending,BOOL isCombine);


#pragma mark - Link Objects/多对象
@property LB_F NSObject*              makeLinkObjs;

@end

@interface NSArray<__covariant ObjectType>(NSArraryLinkBlock)

- (NSMutableArray<ObjectType>*)arrFindUsingBlock:
(BOOL(^)(ObjectType obj, NSUInteger idx, BOOL *stop))block
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");


- (void)arrEnumerateWithPredicateFormat:(NSString*)predicateFormat
                             usingBlock:(void(^)(ObjectType obj, NSUInteger idx, BOOL *stop))block;

/**
 *  Enumerate string by composed from rule in array
 *  if self = @[@"cry",@"smile"],@"cry" also be treated as a composed
 */
- (void)arrStringEnumerateComposedInString:(NSString *)string usingBlock:(void (^)(NSString *subString, NSRange range, BOOL isCustom, BOOL *stop))block;
@end
