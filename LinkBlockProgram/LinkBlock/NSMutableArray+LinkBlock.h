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
@end
