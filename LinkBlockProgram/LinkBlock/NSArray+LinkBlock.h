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


@property (nonatomic,copy) id                       (^blockValueAt)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of given type */
@property (nonatomic,copy) id                       (^blockValueTypeAt)(Class typeClass, NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of given type */
@property (nonatomic,copy) NSObject*                (^blockValueNSObjectAt)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of given type */
@property (nonatomic,copy) NSString*                (^blockValueNSStringAt)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of given type */
@property (nonatomic,copy) NSNumber*                (^blockValueNSNumberAt)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of given type */
@property (nonatomic,copy) NSDictionary*            (^blockValueNSDictionaryAt)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of given type */
@property (nonatomic,copy) NSMutableDictionary*     (^blockValueNSMutableDictionaryAt)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of given type */
@property (nonatomic,copy) NSArray*                 (^blockValueNSArraryAt)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of given type */
@property (nonatomic,copy) NSMutableArray*          (^blockValueNSMutableArrayAt)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of given type */
@property (nonatomic,copy) UIView*                  (^blockValueUIVIewAt)(NSUInteger idx);

@property (nonatomic,copy) NSArray*                 (^blockValuesOfType)(Class typeClass);
@end
