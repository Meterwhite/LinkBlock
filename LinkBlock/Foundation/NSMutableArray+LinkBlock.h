//
//  NSMutableArray+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#ifndef NSMutableArrayNew
#define NSMutableArrayNew ([NSMutableArray new])
#endif
@interface NSObject(NSMutableArrayLinkBlock)

/** <^(id obj)>插入一个元素,安全的 */
@property (nonatomic,copy,readonly) NSMutableArray*  (^m_arrAddObj)(id obj);
/** <^(id obj)>插入一个元素,如果不包含的话 */
@property (nonatomic,copy,readonly) NSMutableArray*  (^m_arrAddObjNotContain)(id obj);
/** <^(NSArray* arr)>插入一个数组,安全的 */
@property (nonatomic,copy,readonly) NSMutableArray*  (^m_arrAddObjs)(NSArray* arr);
/** <^(id obj, NSUInteger index)>在指定Index处插入一个元素,安全的 */
@property (nonatomic,copy,readonly) NSMutableArray*  (^m_arrInsertObjAt)(id obj, NSUInteger index);
/** <^(NSArray* arr, NSUInteger index)>在指定Index处插入一个数组,安全的 */
@property (nonatomic,copy,readonly) NSMutableArray*  (^m_arrInsertArrayAt)(NSArray* arr, NSUInteger index);
/** <^(id obj, id beforeObj)>插入一个对象在另一个对象之前 */
@property (nonatomic,copy,readonly) NSMutableArray*  (^m_arrInsertBefore)(id obj, id beforeObj);
/** <^(id obj, id behindObj)>插入一个对象在另一个对象之后 */
@property (nonatomic,copy,readonly) NSMutableArray*  (^m_arrInsertBehind)(id obj, id behindObj);
/** <^(id obj)> */
@property (nonatomic,copy,readonly) NSMutableArray*  (^m_arrRemoveObj)(id obj);
/** <^(NSUInteger index)>移除指定Index处的元素,不会溢出 */
@property (nonatomic,copy,readonly) NSMutableArray*  (^m_arrRemoveAt)(NSUInteger index);
/** <^(NSUInteger fromIndex,NSUInteger toIndex)>移除一段元素，在指定Index范围内,不会溢出 */
@property (nonatomic,copy,readonly) NSMutableArray*  (^m_arrRemoveObjsFromTo)(NSUInteger fromIndex,NSUInteger toIndex);
/** <^()>移除所有数组元素,安全的 */
@property (nonatomic,copy,readonly) NSMutableArray*  (^m_arrRemoveAll)();
/** <^(id obj,id withObj)>替换数组中的一个对象，如果存在的话 */
@property (nonatomic,copy,readonly) NSMutableArray*  (^m_arrReplaceObjWith)(id obj,id withObj);


/** <^(NSString* key, BOOL ascending)>以数组中对象的Key的值进行排序,ascending：升序 */
@property (nonatomic,copy,readonly) NSMutableArray*          (^m_arrSortByKey)(NSString* key, BOOL ascending);
/** <^(BOOL ascending)>对数组中的值使用compare:进行排序 */
@property (nonatomic,copy,readonly) NSMutableArray*          (^m_arrSort)(BOOL ascending);
/** <^(BOOL ascending, BOOL isCombine)>对数组子项为NSRange值的NSValue对象进行排序；isCombine：NSRange(0,2)会合并NSRange(0,1) */
@property (nonatomic,copy,readonly) NSMutableArray<NSValue*>* (^m_arrSortRange)(BOOL ascending, BOOL isCombine);
/** <^(id obj , NSString* key)>插入对象如果和所有数组中对象的Key对应的value比较相等则替换，否则插入最后 */
@property (nonatomic,copy,readonly) NSMutableArray*          (^m_arrAddOrReplaceObjByKey)(id obj , NSString* key);
/** <^(id obj , NSString* key, NSUInteger idx)>在指定索引处插入对象，如果数组中存在对象的Key对应的value比较相等则全部替换， */
@property (nonatomic,copy,readonly) NSMutableArray*          (^m_arrInsertOrReplaceObjByKeyAt)(id obj , NSString* key, NSUInteger idx);
/** <^(id obj , NSString* key)>替换如果数组中对象与obj参数的key的值相等的对象 */
@property (nonatomic,copy,readonly) NSMutableArray*          (^m_arrTryReplaceObjByKey)(id obj , NSString* key);
/** <^(NSArray* objs , NSString* key)>替换如果数组中对象与obj参数的key的值相等的对象 */
@property (nonatomic,copy,readonly) NSMutableArray*          (^m_arrTryReplaceObjsByKey)(NSArray* objs , NSString* key);
/** <^(NSString* predicateFormat)>数组过滤，源数组会改变 */
@property (nonatomic,copy,readonly) NSMutableArray*          (^m_arrFilter)(NSString* predicateFormat);
/** <^(id<NSCopying>replaceKey,id<NSCopying> withKey)>替换数组中字典的key，层次遍历的 */
@property (nonatomic,copy,readonly) NSMutableArray*          (^m_arrReplaceKeyInDict)(id<NSCopying>replaceKey,id<NSCopying> withKey);
/** <^(id<NSCopying> replaceKey,id<NSCopying> withKey)>替换数组中字典的key，非层次遍历的 */
@property (nonatomic,copy,readonly) NSMutableArray*          (^m_arrReplaceKeyInDictWithoutDeep)(id<NSCopying> replaceKey,id<NSCopying> withKey);
@end
