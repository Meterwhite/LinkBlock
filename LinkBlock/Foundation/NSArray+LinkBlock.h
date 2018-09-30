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
/** 获取数组中某个值的所有索引 */
LBDeclare NSIndexSet*              (^arrGetValuesIndexWithValue)(id value);
/** 对数组中的值使用compare:进行排序 */
LBDeclare NSMutableArray*          (^arrSort)(BOOL ascending);
/** <^(NSString* key, BOOL ascending)>以数组中对象的Key的值进行排序,ascending：升序 */
LBDeclare NSMutableArray*          (^arrSortByKey)(NSString* key, BOOL ascending);

#pragma mark - Foundation Extend/多择
/** 将数组元素连接为字符串，split为连接的字符串 */
LBDeclare NSMutableString*         (^arrJoin)(NSString* split);

/** 组数过滤，如age>20 */
LBDeclare NSMutableArray*          (^arrFilter)(NSString* predicateFormat,...);
/** 获取任意一个对象，空数组返回NSNull */
LBDeclare NSObject*                (^arrAny)(void);
LBDeclare NSMutableArray*          (^arrObjsWithKindOfClass)(Class typeClass);
/** 判断键值对匹配项 */
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
/** 不会溢出 */
LBDeclare NSMutableArray*  (^arrRemoveAt)(NSUInteger index);
/** 不会溢出 */
LBDeclare NSMutableArray*  (^arrRemoveObjsFromTo)(NSUInteger fromIndex,NSUInteger toIndex);
/** 唯一增 */
LBDeclare NSMutableArray*  (^arrAddObjOnlyOne)(id obj);
/** 前插 */
LBDeclare NSMutableArray*  (^arrInsertObjBeforeTo)(id insert, id beforeTo);
/** 后插 */
LBDeclare NSMutableArray*  (^arrInsertObjNextTo)(id insert, id nextTo);
/** 前一项 */
LBDeclare NSObject*        (^arrGetPrevItemForObj)(id obj);
/** 后一项 */
LBDeclare NSObject*        (^arrGetNextItemForObj)(id obj);


#pragma mark - LinkBlock
LBDeclare NSMutableArray*          (^arrReplaceObjWith)(id obj,id newObj);
/** 键值对匹配项 */
LBDeclare NSMutableArray*          (^arrKeyValueMatchedObjs)(NSString* key,id value);
/** 键值对匹配项 */
LBDeclare NSMutableArray*          (^arrKeyValuesMatchedObjs)(NSDictionary<NSString*,id>* kv);
/** 将数组中数组类型项合并 */
LBDeclare NSMutableArray*          (^arrJoinArr)(void);
/** 将数组中字典类型项合并 */
LBDeclare NSMutableDictionary*     (^arrJoinDict)(void);
/** 添加或替换一项，如果指定键的值匹配 */
LBDeclare NSMutableArray*(^arrAddOrReplaceWhenObjValueMatchedForKey)(id obj , NSString* key);
LBDeclare NSMutableArray*(^arrInsertOrReplaceWhenObjValueMatchedForKeyAt)(id obj , NSString* key, NSUInteger idx);
/** 尝试替换一项，如果指定键的值匹配 */
LBDeclare NSMutableArray*(^arrReplaceWhenObjValueMatchedForKey)(id obj , NSString* key);
LBDeclare NSMutableArray*(^arrReplaceWhenObjsValueMatchedForKey)(NSArray* objs , NSString* key);
/** 将数组拆分为每组count个数的多个数组,count为0时返回当前对象本身 */
LBDeclare NSMutableArray*          (^arrSplitWithCount)(NSUInteger count);
LBDeclare NSNumber*                (^arrMaxNumber)(void);
LBDeclare NSNumber*                (^arrMinNumber)(void);
/** 根据key-value，做'差集'；(数组每项必须含字段key)*/
LBDeclare NSMutableArray*          (^arrMinusArrByKey)(NSArray* arr, NSString* key);
/** 根据key-value，做'并集'；(数组每项必须含字段key)*/
LBDeclare NSMutableArray*          (^arrUnionArrByKey)(NSArray* arr, NSString* key);
/** 根据key-value，做'交集'；(数组每项必须含字段key)*/
LBDeclare NSMutableArray*          (^arrInterectArrByKey)(NSArray* arr, NSString* key);
/** 替换数组中字典的key */
LBDeclare NSMutableArray*          (^arrReplaceKeyForDictionaryItem)(id key,id newKey);
/** 深度遍历 */
LBDeclare NSMutableArray*          (^arrReplaceKeyForDictionaryItemDepth)(id key,id newKey);
/** 对数组子项为NSRange值的NSValue对象进行排序；isCombine：NSRange(0,2)会合并NSRange(0,1) */
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
/**
 *  查找对象
 */
- (NSMutableArray<ObjectType>*)arrFindUsingBlock:
(BOOL(^)(ObjectType obj, NSUInteger idx, BOOL *stop))block
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");

/**
 *  根据条件过滤并遍历结果集
 *
 *  @param predicateFormat "engine.horsepower > 150"
 *
 *  @return 根据条件过滤后的结果集
 */
- (void)arrEnumerateWithPredicateFormat:(NSString*)predicateFormat usingBlock:(void(^)(ObjectType obj, NSUInteger idx, BOOL *stop))block;

/**
 *  使用数组中的字符为元字符规则去遍历字符串，遍历以元字符为单位，如：emoji，一个规则
 *
 *  [@[@"[微笑]",@"[挖鼻屎]"] arrStringEnumerateComposedInString:@"我是[微笑]还要[挖鼻屎]😈😴"  usingBlock:^(NSString *subString, NSRange range, BOOL isCustom, BOOL *stop) {
 *      //...
 *  }];
 */
- (void)arrStringEnumerateComposedInString:(NSString *)string usingBlock:(void (^)(NSString *subString, NSRange range, BOOL isCustom, BOOL *stop))block;
@end
