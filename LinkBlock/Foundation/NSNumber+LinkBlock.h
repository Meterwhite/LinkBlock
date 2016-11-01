//
//  NSNumber+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/4.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkBlock.h"

@interface NSObject(NSNumberLinkBlock)
/** 
 根据引用型布尔值判断是否中断其后语句，如果当前语句已中断则由当前条件决定其后是否执行
 用法与linkIf相似
 ...objIsEqual_n(...).linkIf_YES...LinkElse...
 */
@property (nonatomic,copy,readonly) NSObject*    linkIf_YES;
/**
 根据引用型布尔值判断是否中断其后语句，如果当前语句已中断则由当前条件决定其后是否执行
 用法与linkIf相似
 ...objIsEqual_n(...).linkIf_NO...LinkElse...
 */
@property (nonatomic,copy,readonly) NSObject*    linkIf_NO;


/** <^()> */
@property (nonatomic,copy,readonly) void*        (^numValue)();
/** <^()>是否是整数类型 */
@property (nonatomic,copy,readonly) BOOL         (^numIsIntegerType)();
/** <^()>是否是浮点数类型 */
@property (nonatomic,copy,readonly) BOOL         (^numIsFloatingType)();
/** <^()>是否是字符类型 */
@property (nonatomic,copy,readonly) BOOL         (^numIsCharType)();
/** <^()> */
@property (nonatomic,copy,readonly) BOOL         (^numIsBOOL)();
/** <^()> */
@property (nonatomic,copy,readonly) BOOL         (^numIsChar)();
/** <^()> */
@property (nonatomic,copy,readonly) BOOL         (^numIsShort)();
/** <^()> */
@property (nonatomic,copy,readonly) BOOL         (^numIsInt)();
/** <^()> */
@property (nonatomic,copy,readonly) BOOL         (^numIsLong)();
/** <^()> */
@property (nonatomic,copy,readonly) BOOL         (^numIsLongLong)();
/** <^()> */
@property (nonatomic,copy,readonly) BOOL         (^numIsUnsignedChar)();
/** <^()> */
@property (nonatomic,copy,readonly) BOOL         (^numIsUnsignedShort)();
/** <^()> */
@property (nonatomic,copy,readonly) BOOL         (^numIsUnsignedInt)();
/** <^()> */
@property (nonatomic,copy,readonly) BOOL         (^numIsUnsignedLong)();
/** <^()> */
@property (nonatomic,copy,readonly) BOOL         (^numIsUnsignedLongLong)();
/** <^()> */
@property (nonatomic,copy,readonly) BOOL         (^numIsFloat)();
/** <^()> */
@property (nonatomic,copy,readonly) BOOL         (^numIsDouble)();

/** <^()>是否包含小数位的值；YES：小数位为0，NO：小数位有值， */
@property (nonatomic,copy,readonly) BOOL         (^numHasDecimalValue)();
@property (nonatomic,copy,readonly) NSNumber*    (^numHasDecimalValue_n)();
/** <^(num)>等于@宏定义覆盖后可传入数字直接量 */
@property (nonatomic,copy,readonly) BOOL         (^numIsEqualToNum)(NSNumber* num);
@property (nonatomic,copy,readonly) NSNumber*    (^numIsEqualToNum_n)(NSNumber* num);
/** <^(num)>大于@宏定义覆盖后可传入数字直接量 */
@property (nonatomic,copy,readonly) BOOL         (^numIsGreatThanNum)(NSNumber* num);
@property (nonatomic,copy,readonly) NSNumber*    (^numIsGreatThanNum_n)(NSNumber* num);
/** <^(num)>大等于@宏定义覆盖后可传入数字直接量 */
@property (nonatomic,copy,readonly) BOOL         (^numIsGreatEqualNum)(NSNumber* num);
@property (nonatomic,copy,readonly) NSNumber*    (^numIsGreatEqualNum_n)(NSNumber* num);
/** <^(num)>小于@宏定义覆盖后可传入数字直接量 */
@property (nonatomic,copy,readonly) BOOL         (^numIsLessThanNum)(NSNumber* num);
@property (nonatomic,copy,readonly) NSNumber*    (^numIsLessThanNum_n)(NSNumber* num);
/** <^(num)>小等于@宏定义覆盖后可传入数字直接量 */
@property (nonatomic,copy,readonly) BOOL         (^numIsLessEqualNum)(NSNumber* num);
@property (nonatomic,copy,readonly) NSNumber*    (^numIsLessEqualNum_n)(NSNumber* num);
/** <^()> */
@property (nonatomic,copy,readonly) BOOL         (^numIsYES)();
/** <^()> */
@property (nonatomic,copy,readonly) BOOL         (^numIsNO)();
/** <^()>判断奇数 */
@property (nonatomic,copy,readonly) BOOL         (^numIsOdd)();
@property (nonatomic,copy,readonly) NSNumber*    (^numIsOdd_n)();
/** <^()>判断偶数 */
@property (nonatomic,copy,readonly) BOOL         (^numIsEven)();
@property (nonatomic,copy,readonly) NSNumber*    (^numIsEven_n)();

/** <^(NSUInteger digit小数位数)>小数转字符串：digit：小数位数；digit=6 => 0.618000；digit=0时转为整数 */
@property (nonatomic,copy,readonly) NSString*           (^numToStrFloating)(NSUInteger digit);
/** <^(NSUInteger digit小数位数)>小数转百分比:@(0.231)->@"23.1%"，digit：小数位数 */
@property (nonatomic,copy,readonly) NSMutableString*    (^numToStrPercent)(NSUInteger digit);
/** <^(NSUInteger digit小数位数)>小数转字符串，限定最宽小数位数；整数时没有任何改变;当digit=0时小数将转为整数 */
@property (nonatomic,copy,readonly) NSString*    (^numToStrMaxDigit)(NSUInteger maxDigit);
/** <^()>数字转日期 */
@property (nonatomic,copy,readonly) NSDate*      (^numToNSDateSince1970)();
/** <^()> */
@property (nonatomic,copy,readonly) UIFont*      (^numToUIFontSystemSize)();
/** <@(0x969696).numToUIColorFromHex()>十六进制转颜色 */
@property (nonatomic,copy,readonly) UIColor*     (^numToUIColorFromHex)();

/** <^(NSArray* arr)>当前值是否在数组长度长度值内 */
@property (nonatomic,copy,readonly) BOOL         (^numIndexIsInArrRange)(NSArray* arr);
@property (nonatomic,copy,readonly) NSNumber*    (^numIndexIsInArrRange_n)(NSArray* arr);
/** <^(NSString* str)>当前值是否在字符串长度值范围内 */
@property (nonatomic,copy,readonly) BOOL         (^numIndexIsInStringRange)(NSString* str);
@property (nonatomic,copy,readonly) NSNumber*    (^numIndexIsInStringRange_n)(NSString* str);
/** <^(NSMutableArray* arr)> */
@property (nonatomic,copy,readonly) NSNumber*    (^numIndexObjRemoveFromArr)(NSMutableArray* arr);
/** <^(NSMutableArray* arr)> */
@property (nonatomic,copy,readonly) NSObject*    (^numIndexObjInArr)(NSMutableArray* arr);
@end

@interface NSNumber (NSNumberLinkBlock)

/** for循环，遍历 [0,idx) */
- (void)numForLoopASC:(void(^)(int idx))forBlock;
/** for循环，遍历 (idx,0] */
- (void)numForLoopDESC:(void(^)(int idx))forBlock;
@end
