//
//  NSArray+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSArray(LinkBlock)
@property (nonatomic,copy) NSMutableArray*          (^blockMutableCopy)();
/** 数组对象中是否包含某个字符串对象 */
@property (nonatomic,copy) BOOL                     (^blockContainerStr)(NSString*);
/** 是否包含某个对象 */
@property (nonatomic,copy) BOOL                     (^blockContainer)(id obj);
/** 某个范围内的数据 */
@property (nonatomic,copy) NSArray*                 (^blockObjsFromIndexTo)(NSInteger index1, NSInteger index2);
/** 某个index是否在范围内 */
@property (nonatomic,copy) BOOL                     (^blockIsIndexInRange)(NSUInteger index);
/** 数组转字典，键为NSNumber类型 */
/** arr to dict, index becomes key, key type is NSNumber */
@property (nonatomic,copy) NSDictionary*            (^blockArrToDictByNumberKey)();
/** 数组转字典，键为NSString类型 */
/** arr to dict, index becomes key, key type is NSString */
@property (nonatomic,copy) NSDictionary*            (^blockArrToDictByStringKey)();


@property (nonatomic,copy) id                       (^blockValue)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of given type */
@property (nonatomic,copy) id                       (^blockValueType)(Class typeClass, NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of given type */
@property (nonatomic,copy) NSObject*                (^blockValueNSObject)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of given type */
@property (nonatomic,copy) NSString*                (^blockValueNSString)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of given type */
@property (nonatomic,copy) NSNumber*                (^blockValueNSNumber)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of given type */
@property (nonatomic,copy) NSDictionary*            (^blockValueNSDictionary)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of given type */
@property (nonatomic,copy) NSMutableDictionary*     (^blockValueNSMutableDictionary)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of given type */
@property (nonatomic,copy) NSArray*                 (^blockValueNSArrary)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of given type */
@property (nonatomic,copy) NSMutableArray*          (^blockValueNSMutableArray)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of given type */
@property (nonatomic,copy) UIView*                  (^blockValueUIVIew)(NSUInteger idx);


@end
