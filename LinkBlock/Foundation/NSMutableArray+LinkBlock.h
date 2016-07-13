//
//  NSMutableArray+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NSMutableArrayNew ([NSMutableArray new])
@interface NSObject(NSMutableArrayLinkBlock)
@property (nonatomic,copy) NSObject*                (^m_arrAt)(NSUInteger idx);
@property (nonatomic,copy) NSMutableArray*          (^m_arrSubFrom)(NSUInteger idx);
@property (nonatomic,copy) NSMutableArray*          (^m_arrSubTo)(NSUInteger idx);
@property (nonatomic,copy) NSObject*                (^m_arrAny)();
/** 插入一个元素,安全的 */
@property (nonatomic,copy) NSMutableArray*  (^m_arrAddObj)(id obj);
/** 插入一个数组,安全的 */
@property (nonatomic,copy) NSMutableArray*  (^m_arrAddObjs)(NSArray* arr);
/** 在指定Index处插入一个元素,安全的 */
@property (nonatomic,copy) NSMutableArray*  (^m_arrInsertObjAt)(id obj, NSUInteger index);
/** 在指定Index处插入一个数组,安全的 */
@property (nonatomic,copy) NSMutableArray*  (^m_arrInsertArrayAt)(NSArray* arr, NSUInteger index);
/** 插入一个对象在另一个对象之前 */
@property (nonatomic,copy) NSMutableArray*  (^m_arrInsertBefore)(id obj, id beforeObj);
/** 插入一个对象在另一个对象之后 */
@property (nonatomic,copy) NSMutableArray*  (^m_arrInsertBehind)(id obj, id behindObj);
/** 移除一个元素,安全的不会溢出 */
@property (nonatomic,copy) NSMutableArray*  (^m_arrRemoveObj)(id obj);
/** 移除指定Index处的元素,安全的不会溢出的 */
@property (nonatomic,copy) NSMutableArray*  (^m_arrRemoveAt)(NSUInteger index);
/** 移除一段元素，在指定Index范围内,安全的不会溢出的 */
@property (nonatomic,copy) NSMutableArray*  (^m_arrRemoveObjsFromTo)(NSUInteger fromIndex,NSUInteger toIndex);
/** 移除所有数组元素,安全的 */
@property (nonatomic,copy) NSMutableArray*  (^m_arrRemoveAll)();
/** 用一个对象替换数组中的一个对象,安全的 */
@property (nonatomic,copy) NSMutableArray*  (^m_arrReplaceObjWith)(id obj,id withObj);

/** 数组对象中是否包含某个字符串对象 */
@property (nonatomic,copy) BOOL                     (^m_arrIsContainerStr)(NSString*);
/** 是否包含某个对象 */
@property (nonatomic,copy) BOOL                     (^m_arrContain)(id obj);
/** 某个范围内的数据 */
@property (nonatomic,copy) NSArray*                 (^m_arrObjsFromIndexTo)(NSUInteger index1, NSUInteger index2);
/** 某个index是否在范围内 */
@property (nonatomic,copy) BOOL                     (^m_arrContainIndex)(NSUInteger index);
/** 数组转字典，键为NSNumber类型 */
@property (nonatomic,copy) NSDictionary*            (^m_arrToDictByKeyNumber)();
/** 数组转字典，键为NSString类型 */
@property (nonatomic,copy) NSDictionary*            (^m_arrToDictByKeyString)();

/** 获取数组中所有该类型的对象 */
@property (nonatomic,copy) NSMutableArray*          (^m_arrObjsOfType)(Class typeClass);
/** 以数组中对象的Key的值进行排序,ascending：升序 */
@property (nonatomic,copy) NSMutableArray*          (^m_arrSortByKey)(NSString* key, BOOL ascending);
/** 对数组子项为NSRange型的NSValue进行排序，isCombine：NSRange(0,2)会合并NSRange(0,1) */
@property (nonatomic,copy) NSMutableArray<NSValue*>* (^m_arrSortRange)(BOOL ascending, BOOL isCombine);
/** 插入对象如果和所有数组中对象的Key对应的value比较相等则替换，否则插入最后 */
@property (nonatomic,copy) NSMutableArray*          (^m_arrAddOrReplaceObjByKey)(id obj , NSString* key);
/** 在指定索引处插入对象，如果数组中存在对象的Key对应的value比较相等则全部替换， */
@property (nonatomic,copy) NSMutableArray*          (^m_arrInsertOrReplaceObjByKeyAt)(id obj , NSString* key, NSUInteger idx);
/** 替换如果数组中对象与obj参数的key的值相等的对象 */
@property (nonatomic,copy) NSMutableArray*          (^m_arrTryReplaceObjByKey)(id obj , NSString* key);
/** 替换如果数组中对象与obj参数的key的值相等的对象 */
@property (nonatomic,copy) NSMutableArray*          (^m_arrTryReplaceObjsByKey)(NSArray* objs , NSString* key);
/** 数组过滤，源数组会改变 */
@property (nonatomic,copy) NSMutableArray*          (^m_arrFilter)(NSString* predicateFormat);
/** 替换数组中字典的key，层次遍历的 */
@property (nonatomic,copy) NSMutableArray*          (^m_arrReplaceKeyInDict)(id<NSCopying>replaceKey,id<NSCopying> withKey);
/** 替换数组中字典的key，非层次遍历的 */
@property (nonatomic,copy) NSMutableArray*          (^m_arrReplaceKeyInDictWithoutDeep)(id<NSCopying> replaceKey,id<NSCopying> withKey);
@end
