//
//  NSArray+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject(NSArraryLinkBlock)

/** 数组对象中是否包含某个字符串对象 */
@property (nonatomic,copy) BOOL                     (^arrIsContainerStr)(NSString* str);
/** 是否包含某个对象 */
@property (nonatomic,copy) BOOL                     (^arrIsContainer)(id obj);
/** 某个范围内的数据 */
@property (nonatomic,copy) NSArray*                 (^arrObjsFromIndexTo)(NSUInteger idx1, NSUInteger idx2);
/** 某个index是否在范围内 */
@property (nonatomic,copy) BOOL                     (^arrIsIndexInRange)(NSUInteger idx);
/** 数组转字典，键为NSNumber类型 */
/** arr to dict, index becomes key, key type is NSNumber */
@property (nonatomic,copy) NSDictionary*            (^arrToDictByKeyNumber)();
/** 数组转字典，键为NSString类型 */
/** arr to dict, index becomes key, key type is NSString */
@property (nonatomic,copy) NSDictionary*            (^arrToDictByKeyString)();


@property (nonatomic,copy) id                       (^arrValueAt)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of return type */
@property (nonatomic,copy) id                       (^arrValueAtType)(Class typeClass, NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of return type */
@property (nonatomic,copy) NSObject*                (^arrValueAtNSObject)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of return type */
@property (nonatomic,copy) NSString*                (^arrValueAtNSString)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of return type */
@property (nonatomic,copy) NSNumber*                (^arrValueAtNSNumber)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of return type */
@property (nonatomic,copy) NSDictionary*            (^arrValueAtNSDictionary)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of return type */
@property (nonatomic,copy) NSMutableDictionary*     (^arrValueAtNSMutableDictionary)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of return type */
@property (nonatomic,copy) NSArray*                 (^arrValueAtNSArrary)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of return type */
@property (nonatomic,copy) NSMutableArray*          (^arrValueAtNSMutableArray)(NSUInteger idx);
/** 如果类型不匹配，则返回创建一个该类型的对象 */
/** if return types not match, then retrun an new object of return type */
@property (nonatomic,copy) UIView*                  (^arrValueAtUIVIew)(NSUInteger idx);

@property (nonatomic,copy) NSArray*                 (^arrValuesOfType)(Class typeClass);
/** 组数过滤 */
@property (nonatomic,copy) NSArray*                 (^arrFilter)(NSString* predicateFormat);

/**
 *  根据条件过滤并遍历数组
 *
 *  @param predicateFormat "engine.horsepower > 150"
 *
 *  @return 根据条件过滤后的结果集
 */
- (void)arrEnumerateWithPredicateFormat:(NSString*)predicateFormat
                                 usingBlock:(void(^)(id obj, NSUInteger idx, BOOL *stop))block;
/** 找到数组中最大值的数字类型 */
@property (nonatomic,copy) NSNumber*               (^arrMaxNumberFind)();
@property (nonatomic,copy) NSNumber*               (^arrMinNumberFind)();
@property (nonatomic,copy) NSObject*               (^arrLastObj)();
@property (nonatomic,copy) NSObject*               (^arrFirstObj)();
@end
