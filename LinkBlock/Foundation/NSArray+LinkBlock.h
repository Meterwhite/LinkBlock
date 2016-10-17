//
//  NSArray+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef NSArrayNew
#define NSArrayNew ([NSArray new])
#endif
@interface NSObject(NSArraryLinkBlock)
/**
 使数组内对象执行多个链式编程，使用ends()可获取结果集合，
 如果结尾返回值为值型则该结果为第一个对象的链式执行结果，效果同使用end
 Arr.makeLinkObjs....
 */
@property (nonatomic,strong,readonly) NSObject*              makeLinkObjs;

/** <^(NSUInteger idx)> */
@property (nonatomic,copy,readonly) id                       (^arrAt)(NSUInteger idx);
/** <^(id obj)>是否包含某个对象 */
@property (nonatomic,copy,readonly) BOOL                     (^arrContain)(id obj);
@property (nonatomic,copy,readonly) NSNumber*                (^arrContain_n)(id obj);
/** <^(NSUInteger idx)> */
@property (nonatomic,copy,readonly) NSMutableArray*          (^arrSubFrom)(NSUInteger idx);
/** <^(NSUInteger idx)> */
@property (nonatomic,copy,readonly) NSMutableArray*          (^arrSubTo)(NSUInteger idx);
/** <^(NSUInteger from, NSUInteger to)>获取from到to（包含）范围内的对象 */
@property (nonatomic,copy,readonly) NSArray*                 (^arrObjsFromIndexTo)(NSUInteger from, NSUInteger to);
/** <^(NSUInteger idx)>某个index是否在范围内 */
@property (nonatomic,copy,readonly) BOOL                     (^arrContainIndex)(NSUInteger idx);
@property (nonatomic,copy,readonly) NSNumber*                (^arrContainIndex_n)(NSUInteger idx);
/** <^(NSMutableArray* arr)>返回新数组 */
@property (nonatomic,copy,readonly) NSMutableArray*          (^arrAddTo)(NSMutableArray* arr);
/** <^()>数组转字典，键为NSNumber类型 */
@property (nonatomic,copy,readonly) NSDictionary*            (^arrToDictByKeyNumber)();
/** <^()>数组转字典，键为NSString类型 */
@property (nonatomic,copy,readonly) NSDictionary*            (^arrToDictByKeyString)();
/** <^()>获取任意一个对象 */
@property (nonatomic,copy,readonly) id                       (^arrAny)();
/** <^()>最后一个对象 */
@property (nonatomic,copy,readonly) NSObject*                (^arrLast)();
/** <^()>第一个对象 */
@property (nonatomic,copy,readonly) NSObject*                (^arrFirst)();
/** <^(Class typeClass)> */
@property (nonatomic,copy,readonly) NSArray*                 (^arrValuesOfType)(Class typeClass);
/**<^(NSString* predicateFormat)>组数过滤，如age>20 */
@property (nonatomic,copy,readonly) NSArray*                 (^arrFilter)(NSString* predicateFormat);
/**<^(id value)>获取数组中某个值的所有索引 */
@property (nonatomic,copy,readonly) NSIndexSet*              (^arrIndexSetOfValue)(id value);
/**<^(id<NSCopying> replaceKey,id<NSCopying> withKey)>替换数组中字典的key，深度遍历的 */
@property (nonatomic,copy,readonly) NSMutableArray*          (^arrReplaceKeyInDict)(id<NSCopying> replaceKey,id<NSCopying> withKey);
/**<^(id<NSCopying> replaceKey,id<NSCopying> withKey)>替换数组中字典的key，非深度遍历的 */
@property (nonatomic,copy,readonly) NSMutableArray*          (^arrReplaceKeyInDictWithoutDeep)(id<NSCopying> replaceKey,id<NSCopying> withKey);
/**<^()>找到数组中最大的数字类型，可容纳其他类型对象 */
@property (nonatomic,copy,readonly) NSNumber*                (^arrMaxNumber)();
/**<^()>找到数组中最小的数字类型，可容纳其他类型对象 */
@property (nonatomic,copy,readonly) NSNumber*                (^arrMinNumber)();
/** <^()>对数组中对象随机赋值，仅含字符串和数字类型 */
@property (nonatomic,copy,readonly) NSArray*                 (^arrObjsValueRandom)();
/** <^(Class typeClass)>获取数组中所有该类型的对象 */
@property (nonatomic,copy,readonly) NSMutableArray*          (^arrObjsOfType)(Class typeClass);
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
