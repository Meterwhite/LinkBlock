//
//  NSMutableArray+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(NSMutableArrayLinkBlock)

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
/** 移除一个元素,安全的 */
@property (nonatomic,copy) NSMutableArray*  (^m_arrRemoveObj)(id obj);
/** 移除指定Index处的元素,安全的 */
@property (nonatomic,copy) NSMutableArray*  (^m_arrRemoveAt)(NSUInteger index);
/** 移除一段元素，在指定Index范围内,安全的 */
@property (nonatomic,copy) NSMutableArray*  (^m_arrRemoveObjsFromTo)(NSUInteger fromIndex,NSUInteger toIndex);
/** 移除所有数组元素,安全的 */
@property (nonatomic,copy) NSMutableArray*  (^m_arrRemoveAll)();
/** 用一个对象替换数组中的一个对象,安全的 */
@property (nonatomic,copy) NSMutableArray*  (^m_arrReplaceObjWith)(id obj,id withObj);

/** 数组对象中是否包含某个字符串对象 */
@property (nonatomic,copy) BOOL                     (^m_arrIsContainerStr)(NSString*);
/** 是否包含某个对象 */
@property (nonatomic,copy) BOOL                     (^m_arrIsContainer)(id obj);
/** 某个范围内的数据 */
@property (nonatomic,copy) NSArray*                 (^m_arrObjsFromIndexTo)(NSUInteger index1, NSUInteger index2);
/** 某个index是否在范围内 */
@property (nonatomic,copy) BOOL                     (^m_arrIsIndexInRange)(NSUInteger index);
/** 数组转字典，键为NSNumber类型 */
/** arr to dict, index becomes key, key type is NSNumber */
@property (nonatomic,copy) NSDictionary*            (^m_arrToDictByKeyNumber)();
/** 数组转字典，键为NSString类型 */
/** arr to dict, index becomes key, key type is NSString */
@property (nonatomic,copy) NSDictionary*            (^m_arrToDictByKeyString)();

@property (nonatomic,copy) id                       (^m_arrValueAt)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of return type */
@property (nonatomic,copy) id                       (^m_arrValueAtType)(Class typeClass, NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of return type */
@property (nonatomic,copy) NSObject*                (^m_arrValueAtNSObject)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of return type */
@property (nonatomic,copy) NSString*                (^m_arrValueAtNSString)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of return type */
@property (nonatomic,copy) NSNumber*                (^m_arrValueAtNSNumber)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of return type */
@property (nonatomic,copy) NSDictionary*            (^m_arrValueAtNSDictionary)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of return type */
@property (nonatomic,copy) NSMutableDictionary*     (^m_arrValueAtNSMutableDictionary)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of return type */
@property (nonatomic,copy) NSArray*                 (^m_arrValueAtNSArrary)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of return type */
@property (nonatomic,copy) NSMutableArray*          (^m_arrValueAtNSMutableArray)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of return type */
@property (nonatomic,copy) UIView*                  (^m_arrValueAtUIVIew)(NSUInteger idx);

@property (nonatomic,copy) NSArray*                 (^m_arrValuesOfType)(Class typeClass);
@end
