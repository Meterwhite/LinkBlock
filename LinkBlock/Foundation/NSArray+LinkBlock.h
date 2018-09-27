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
#pragma mark - 创建多对象的链条
/**
 使数组内对象执行多个链式编程，使用ends()可获取结果集合，
 如果结尾返回值为值型则该结果为第一个对象的链式执行结果，效果同使用end
 Arrary.makeLinkObjs....
 */
LBDeclare_F NSObject*              makeLinkObjs;
#pragma mark - NSArray
/** <^(NSUInteger idx)> */
LBDeclare NSObject*                (^arrAt)(NSUInteger idx);

/** <^(id obj)>是否包含某个对象 */
LBDeclare BOOL                     (^arrContain)(id obj);
LBDeclare NSNumber*                (^arrContainAs)(id obj);
/** <^(NSUInteger idx)> */
LBDeclare NSMutableArray*          (^arrSubFrom)(NSUInteger idx);
/** <^(NSUInteger idx)> */
LBDeclare NSMutableArray*          (^arrSubTo)(NSUInteger idx);
/** <^(NSUInteger from, NSUInteger to)>获取from到to（包含）范围内的对象 */
LBDeclare NSArray*                 (^arrObjsFromIndexTo)(NSUInteger from, NSUInteger to);
/** <^(NSString* split)>将数组元素连接为字符串，split为连接字符串，正序 */
LBDeclare NSMutableString*         (^arrJoin)(NSString* split);
/** <^()>将数组中数组类型项合并，正序 */
LBDeclare NSMutableArray*          (^arrJoinArr)(void);
/** <^()>将数组中字典类型项合并 */
LBDeclare NSMutableDictionary*     (^arrJoinDict)(void);
/** <^(NSUInteger count)>将数组拆分为每组count个数的多个数组,count为0时返回当前对象本身 */
LBDeclare NSMutableArray*          (^arrSplitWithCount)(NSUInteger count);
/** <^(id value, NSString* key)>使用KVC设置数组一项值 */
LBDeclare __kindof NSArray*        (^arrSetValueForKey)(id value, NSString* key);
/** <^(NSUInteger idx)>索引index是否在范围内 */
LBDeclare BOOL                     (^arrContainIndex)(NSUInteger idx);
LBDeclare NSNumber*                (^arrContainIndexAs)(NSUInteger idx);
/** <^(id obj)> */
LBDeclare NSUInteger               (^arrIndexOfObj)(id obj);
LBDeclare NSNumber*                (^arrIndexOfObjAs)(id obj);
/** <^(NSMutableArray* arr)>返回新数组 */
LBDeclare NSMutableArray*          (^arrAddToArr)(NSMutableArray* arr);
/** <^()>数组转字典，键为NSNumber类型 */
LBDeclare NSDictionary*            (^arrToDictByKeyNumber)(void);
/** <^()>数组转字典，键为NSString类型 */
LBDeclare NSDictionary*            (^arrToDictByKeyString)(void);
/** <^()>数组转路径 */
LBDeclare NSIndexPath*             (^arrToNSIndexPath)(void);
/** <^()>获取任意一个对象，空数组返回NSNull */
LBDeclare NSObject*                (^arrAny)(void);
/** <^()>最后一个对象 */
LBDeclare NSObject*                (^arrLast)(void);
/** <^()>第一个对象 */
LBDeclare NSObject*                (^arrFirst)(void);
/**<^(NSString* predicateFormat,...)>组数过滤，如age>20 */
LBDeclare NSMutableArray*          (^arrFilter)(NSString* predicateFormat , ...);
/**<^(id obj)>数组中某对象的个数 */
LBDeclare NSUInteger               (^arrCountOfObj)(id obj);
/**<^(id value)>获取数组中某个值的所有索引 */
LBDeclare NSIndexSet*              (^arrIndexSetOfValue)(id value);
/**<^(id<NSCopying> replaceKey,id<NSCopying> withKey)>替换数组中字典的key，深度遍历的 */
LBDeclare NSMutableArray*          (^arrReplaceKeyInDict)(id<NSCopying> replaceKey,id<NSCopying> withKey);
/**<^(id<NSCopying> replaceKey,id<NSCopying> withKey)>替换数组中字典的key，非深度遍历的 */
LBDeclare NSMutableArray*          (^arrReplaceKeyInDictWithoutDeep)(id<NSCopying> replaceKey,id<NSCopying> withKey);
/**<^()>找到数组中最大的数字类型，可容纳其他类型对象 */
LBDeclare NSNumber*                (^arrMaxNumber)(void);
/**<^()>找到数组中最小的数字类型，可容纳其他类型对象 */
LBDeclare NSNumber*                (^arrMinNumber)(void);
/** <^()>对数组中对象随机赋值，仅含字符串和数字类型 */
LBDeclare NSMutableArray*          (^arrObjsValueRandom)(void);
/** <^(Class typeClass)>获取数组中所有该类型的对象 */
LBDeclare NSMutableArray*          (^arrObjsOfType)(Class typeClass);
/** <^(BOOL ascending)>对数组中的值使用compare:进行排序 */
LBDeclare NSMutableArray*          (^arrSort)(BOOL ascending);
/** <^(NSString* key, BOOL ascending)>以数组中对象的Key的值进行排序,ascending：升序 */
LBDeclare NSMutableArray*          (^arrSortByKey)(NSString* key, BOOL ascending);
/** <^()>倒序，返回新数组 */
LBDeclare NSMutableArray*          (^arrReversed)(void);
/** 
 <^(NSArray* arr, NSString* key)>根据key或keyPath对应的value，返回当前数组与某数组做'差集'后的结果；(数组每项必须含字段key)；返回做差后的集合；
 例如:找出新旧数据源中的新增对象；
 */
LBDeclare NSMutableArray*          (^arrMinusArrByKey)(NSArray* arr, NSString* key);

/**
 <^(NSArray* arr, NSString* key)>根据key或keyPath对应的value，返回当前数组与某数组做'并集'后的结果；(数组每项必须含字段key)；返回做并集后的集合；
 */
LBDeclare NSMutableArray*          (^arrUnionArrByKey)(NSArray* arr, NSString* key);
/**
 <^(NSArray* arr, NSString* key)>根据key或keyPath对应的value，返回当前数组与某数组做'交集'后的结果；(数组每项必须含字段key)；返回做交集的集合；
 */
LBDeclare NSMutableArray*          (^arrInterectArrByKey)(NSArray* arr, NSString* key);

#pragma mark - 键值
/** <^(NSString* key,id value)>数组项是否有匹配键相等的值 */
LBDeclare BOOL                     (^arrKeyValueContain)(NSString* key,id eqValue);
LBDeclare NSNumber*                (^arrKeyValueContainAs)(NSString* key,id eqValue);
/** <^(NSString* key,id value)>返回能与数组项的键值匹配的对象的集合 */
LBDeclare NSMutableArray*          (^arrKeyValueMatchObjs)(NSString* key,id eqValue);
/** <^(NSString* key,id value)>返回能与数组项的多个键值匹配的对象的集合 */
LBDeclare NSMutableArray*          (^arrKeyValuesMatchObjs)(NSDictionary<NSString*,id>* kv);

//
//  NSArray调用下面方法会转为NSMutableArray调用
//
#pragma mark - NSMutableArray or NSArray
/** <^(id obj)>插入一个元素 */
LBDeclare NSMutableArray*  (^arrAddObj)(id obj);
/** <^(id obj)>插入一个元素,如果不包含的话 */
LBDeclare NSMutableArray*  (^arrAddObjNotContain)(id obj);
/** <^(NSArray* arr)>插入一个数组 */
LBDeclare NSMutableArray*  (^arrAddObjs)(NSArray* arr);
/** <^(id obj, NSUInteger index)>在指定Index处插入一个元素 */
LBDeclare NSMutableArray*  (^arrInsertObjAt)(id obj, NSUInteger index);
/** <^(NSArray* arr, NSUInteger index)>在指定Index处插入一个数组 */
LBDeclare NSMutableArray*  (^arrInsertArrayAt)(NSArray* arr, NSUInteger index);
/** <^(NSArray* arr, NSUInteger index)>将处数组插入到其它数组，在指定Index */
LBDeclare NSMutableArray*  (^arrInsertToArrayAt)(NSMutableArray* arr, NSUInteger index);
/** <^(id obj, id beforeObj)>插入一个对象在另一个对象之前 */
LBDeclare NSMutableArray*  (^arrInsertBefore)(id obj, id beforeObj);
/** <^(id obj, id behindObj)>插入一个对象在另一个对象之后 */
LBDeclare NSMutableArray*  (^arrInsertNext)(id obj, id nextObj);
/** <^(id obj)>数组中前一个对象 */
LBDeclare NSObject*        (^arrBefore)(id obj);
/** <^(id obj)>数组中后一个对象 */
LBDeclare NSObject*        (^arrNext)(id obj);
/** <^(id obj)> */
LBDeclare NSMutableArray*  (^arrRemoveObj)(id obj);
/** <^(NSUInteger index)>移除指定Index处的元素,不会溢出 */
LBDeclare NSMutableArray*  (^arrRemoveAt)(NSUInteger index);
/** <^(NSUInteger fromIndex,NSUInteger toIndex)>移除一段元素，在指定Index范围内,不会溢出 */
LBDeclare NSMutableArray*  (^arrRemoveObjsFromTo)(NSUInteger fromIndex,NSUInteger toIndex);
/** <^()>移除所有数组元素 */
LBDeclare NSMutableArray*  (^arrRemoveAll)(void);
/** <^(id obj,id withObj)>替换数组中的一个对象，如果存在的话 */
LBDeclare NSMutableArray*  (^arrReplaceObjWith)(id obj,id withObj);
/** <^(BOOL ascending, BOOL isCombine)>对数组子项为NSRange值的NSValue对象进行排序；isCombine：NSRange(0,2)会合并NSRange(0,1) */
LBDeclare NSMutableArray<NSValue*>* (^arrSortRange)(BOOL ascending, BOOL isCombine);
/** <^(id obj , NSString* key)>插入对象或者替换对象（如果和所有数组中对象的Key对应的value比较相等则替换，否则插入最后） */
LBDeclare NSMutableArray*          (^arrAddOrReplaceObjByKey)(id obj , NSString* key);
/** <^(id obj , NSString* key, NSUInteger idx)>在指定索引处插入对象或者替换对象（如果数组中存在对象的Key对应的value比较相等则全部替换） */
LBDeclare NSMutableArray*          (^arrInsertOrReplaceObjByKeyAt)(id obj , NSString* key, NSUInteger idx);
/** <^(id obj , NSString* key)>尝试替换一个对象（如果数组中对象与obj参数的key的值相等的对象） */
LBDeclare NSMutableArray*          (^arrTryReplaceObjByKey)(id obj , NSString* key);
/** <^(NSArray* objs , NSString* key)>替换如果数组中对象与obj参数的key的值相等的对象 */
LBDeclare NSMutableArray*          (^arrTryReplaceObjsByKey)(NSArray* objs , NSString* key);
@end

@interface NSArray<__covariant ObjectType>(NSArraryLinkBlock)
/**
 *  查找对象
 */
- (NSMutableArray<ObjectType>*)arrFindUsingBlock:(BOOL(^)(ObjectType obj, NSUInteger idx, BOOL *stop))block;

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
