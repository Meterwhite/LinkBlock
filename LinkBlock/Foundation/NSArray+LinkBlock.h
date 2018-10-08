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
LBDeclare NSObject*                (^arrAt)(NSUInteger idx);
LBDeclare BOOL                     (^arrContains)(id obj);
LBDeclare NSNumber*                (^arrContainsAs)(id obj);
LBDeclare NSMutableArray*          (^arrSubFrom)(NSUInteger idx);
LBDeclare NSMutableArray*          (^arrSubTo)(NSUInteger idx);
LBDeclare NSArray*                 (^arrObjsFromIndexTo)(NSUInteger from, NSUInteger to);
LBDeclare NSObject*                (^arrLast)(void);
LBDeclare NSObject*                (^arrFirst)(void);

#pragma mark - Foundation Speed/速度
LBDeclare NSUInteger               (^arrIndexOfObj)(id obj);
LBDeclare NSNumber*                (^arrIndexOfObjAs)(id obj);
LBDeclare BOOL                     (^arrContainsIndex)(NSUInteger idx);
LBDeclare NSNumber*                (^arrContainsIndexAs)(NSUInteger idx);
LBDeclare NSUInteger               (^arrCountOfObj)(id obj);
LBDeclare NSNumber*                (^arrCountOfObjAs)(id obj);
LBDeclare NSMutableArray*          (^arrAddToArrAsWhatSet)(NSMutableArray* arr);
LBDeclare NSMutableArray*          (^arrReversed)(void);
LBDeclare NSIndexSet*              (^arrGetValuesIndexForValue)(id value);
/** use compare: to sort value */
LBDeclare NSMutableArray*          (^arrSort)(BOOL ascending);
LBDeclare NSMutableArray*          (^arrSortByKey)(NSString* key, BOOL ascending);

#pragma mark - Foundation Extend/补充
/** join item as string,like join() of javescript  */
LBDeclare NSMutableString*         (^arrJoin)(NSString* split);

/** "age>20" */
LBDeclare NSMutableArray*          (^arrFilter)(NSString* predicateFormat,...);
/** return NSNull if array.count==0 */
LBDeclare NSObject*                (^arrAny)(void);
LBDeclare NSMutableArray*          (^arrObjsWithKindOfClass)(Class typeClass);
LBDeclare BOOL                     (^arrContainsKeyValue)(NSString* key,id value);
LBDeclare NSNumber*                (^arrContainsKeyValueAs)(NSString* key,id value);



#pragma mark - Weak coding/弱类型编码
/** @[@0,@1,@2] */
LBDeclare NSIndexPath*     (^arrToNSIndexPath)(void);
LBDeclare NSMutableArray*  (^arrAddObj)(id obj);
LBDeclare NSMutableArray*  (^arrRemoveAll)(void);
LBDeclare NSMutableArray*  (^arrInsertObjAt)(id obj, NSUInteger index);
LBDeclare NSMutableArray*  (^arrInsertArrayAt)(NSArray* arr, NSUInteger index);
LBDeclare NSMutableArray*  (^arrInsertToArrayAt)(NSMutableArray* arr, NSUInteger index);
LBDeclare NSMutableArray*  (^arrAddObjs)(NSArray* arr);
LBDeclare NSMutableArray*  (^arrRemoveObj)(id obj);
/** not overflow */
LBDeclare NSMutableArray*  (^arrRemoveAt)(NSUInteger index);
/** not overflow */
LBDeclare NSMutableArray*  (^arrRemoveObjsFromTo)(NSUInteger fromIndex,NSUInteger toIndex);
/** add object only one */
LBDeclare NSMutableArray*  (^arrAddObjOnlyOne)(id obj);
/** insert before */
LBDeclare NSMutableArray*  (^arrInsertObjBeforeTo)(id insert, id beforeTo);
/** insert next */
LBDeclare NSMutableArray*  (^arrInsertObjNextTo)(id insert, id nextTo);
/** previous item */
LBDeclare NSObject*        (^arrGetPrevItemForObj)(id obj);
/** next item */
LBDeclare NSObject*        (^arrGetNextItemForObj)(id obj);


#pragma mark - LinkBlock
LBDeclare NSMutableArray*          (^arrKeyValueMatchedObjs)(NSString* key,id value);
LBDeclare NSMutableArray*          (^arrKeyValuesMatchedObjs)(NSDictionary<NSString*,id>* kv);
LBDeclare NSMutableArray*          (^arrReplaceObjWith)(id obj,id newObj);
/** join array-type item to one array*/
LBDeclare NSMutableArray*          (^arrJoinArr)(void);
LBDeclare NSMutableDictionary*     (^arrJoinDict)(void);
/** add or replace an object if key-value matched */
LBDeclare NSMutableArray*(^arrAddOrReplaceWhenObjValueMatchedForKey)(id obj , NSString* key);
LBDeclare NSMutableArray*(^arrInsertOrReplaceWhenObjValueMatchedForKeyAt)(id obj , NSString* key, NSUInteger idx);
/** replace an object if key-value matched */
LBDeclare NSMutableArray*(^arrReplaceWhenObjValueMatchedForKey)(id obj , NSString* key);
LBDeclare NSMutableArray*(^arrReplaceWhenObjsValueMatchedForKey)(NSArray* objs , NSString* key);
/** split array,each subarray has same length.Return self if count==0  */
LBDeclare NSMutableArray*          (^arrSplitWithCount)(NSUInteger count);
LBDeclare NSNumber*                (^arrMaxNumber)(void);
LBDeclare NSNumber*                (^arrMinNumber)(void);
/**
 Difference set by key-value,each item must has the same key.
 做'差集'(数组每项必须含字段key)
 */
LBDeclare NSMutableArray*          (^arrMinusArrByKey)(NSArray* arr, NSString* key);
/**
 union set by key-value,each item must has the same key./并集
 */
LBDeclare NSMutableArray*          (^arrUnionArrByKey)(NSArray* arr, NSString* key);
/**
 intersection set by key-value,each item must has the same key./交集
 */
LBDeclare NSMutableArray*          (^arrInterectArrByKey)(NSArray* arr, NSString* key);

LBDeclare NSMutableArray*          (^arrReplaceKeyForDictionaryItem)(id key,id newKey);
/** arrReplaceKeyForDictionaryItem().Deep traversal */
LBDeclare NSMutableArray*          (^arrReplaceKeyForDictionaryItemDepth)(id key,id newKey);
/**
 Sort NSValue-NSRange.If isCombine=YES NSRange(0,2) will contain NSRange(0,1).
*/
LBDeclare NSMutableArray<NSValue*>*(^arrSortRange)(BOOL ascending,BOOL isCombine);






#pragma mark - Link Objects/多对象
/**
 使数组内对象执行多个链式编程，使用ends()可获取结果集合，
 如果结尾返回值为值型则该结果为第一个对象的链式执行结果，效果同使用end
 Arrary.makeLinkObjs....
 */
LBDeclare_F NSObject*              makeLinkObjs;
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
