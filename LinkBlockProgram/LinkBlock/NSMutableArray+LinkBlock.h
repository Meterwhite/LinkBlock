//
//  NSMutableArray+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray(LinkBlock)
@property (nonatomic,copy) NSArray*         (^blockCopy)();
/** 插入一个元素,安全的 */
@property (nonatomic,copy) NSMutableArray*  (^blockAddObj)(id obj);
/** 插入一个数组,安全的 */
@property (nonatomic,copy) NSMutableArray*  (^blockAddObjs)(NSArray* arr);
/** 在指定Index处插入一个元素,安全的 */
@property (nonatomic,copy) NSMutableArray*  (^blockInsertObjAtIndex)(id obj, NSUInteger index);
/** 在指定Index处插入一个数组,安全的 */
@property (nonatomic,copy) NSMutableArray*  (^blockInsertArrayAtIndex)(NSArray* arr, NSUInteger index);
/** 插入一个对象在另一个对象之前 */
@property (nonatomic,copy) NSMutableArray*  (^blockInsertObjBeforeObj)(id obj, id beforeObj);
/** 插入一个对象在另一个对象之后 */
@property (nonatomic,copy) NSMutableArray*  (^blockInsertObjBehindObj)(id obj, id behindObj);
/** 移除一个元素,安全的 */
@property (nonatomic,copy) NSMutableArray*  (^blockRemoveObj)(id obj);
/** 移除指定Index处的元素,安全的 */
@property (nonatomic,copy) NSMutableArray*  (^blockRemoveObjAtIndex)(NSUInteger index);
/** 移除一段元素，在指定Index范围内,安全的 */
@property (nonatomic,copy) NSMutableArray*  (^blockRemoveObjsFromIndexToIndex)(NSUInteger fromIndex,NSUInteger toIndex);
/** 移除所有数组元素,安全的 */
@property (nonatomic,copy) NSMutableArray*  (^blockRemoveAllObjs)();
/** 用一个对象替换数组中的一个对象,安全的 */
@property (nonatomic,copy) NSMutableArray*  (^blockReplaceObjWithObj)(id obj,id withObj);
@end
