//
//  NSNumber+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/4.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

@interface NSObject(NSNumberLinkBlock)
/** 
 根据引用型布尔值判断是否中断其后语句，如果当前语句已中断则由当前条件决定其后是否执行
 用法与linkIf相似
 ...objIsEqual_n(...).linkIf_YES...LinkElse...
 */
LBDeclare_F NSObject*    linkIf_YES;
/**
 根据引用型布尔值判断是否中断其后语句，如果当前语句已中断则由当前条件决定其后是否执行
 用法与linkIf相似
 ...objIsEqual_n(...).linkIf_NO...LinkElse...
 */
LBDeclare_F NSObject*    linkIf_NO;

/** <^()>是否是整数类型 */
LBDeclare BOOL         (^numIsIntegerType)(void);
/** <^()>是否是浮点数类型 */
LBDeclare BOOL         (^numIsFloatingType)(void);
/** <^()>是否是字符类型 */
LBDeclare BOOL         (^numIsCharType)(void);
/** <^()> */
LBDeclare BOOL         (^numIsBOOL)(void);
/** <^()> */
LBDeclare BOOL         (^numIsChar)(void);
/** <^()> */
LBDeclare BOOL         (^numIsShort)(void);
/** <^()> */
LBDeclare BOOL         (^numIsInt)(void);
/** <^()> */
LBDeclare BOOL         (^numIsLong)(void);
/** <^()> */
LBDeclare BOOL         (^numIsLongLong)(void);
/** <^()> */
LBDeclare BOOL         (^numIsUnsignedChar)(void);
/** <^()> */
LBDeclare BOOL         (^numIsUnsignedShort)(void);
/** <^()> */
LBDeclare BOOL         (^numIsUnsignedInt)(void);
/** <^()> */
LBDeclare BOOL         (^numIsUnsignedLong)(void);
/** <^()> */
LBDeclare BOOL         (^numIsUnsignedLongLong)(void);
/** <^()> */
LBDeclare BOOL         (^numIsFloat)(void);
/** <^()> */
LBDeclare BOOL         (^numIsDouble)(void);

/** <^()>是否包含小数位的值；YES：小数位为0，NO：小数位有值， */
LBDeclare BOOL         (^numHasDecimalValue)(void);
LBDeclare NSNumber*    (^numHasDecimalValue_n)(void);
/** <^(num)>等于@宏定义覆盖后可传入数字直接量 */
LBDeclare BOOL         (^numIsEqualToNum)(NSNumber* num);
LBDeclare NSNumber*    (^numIsEqualToNum_n)(NSNumber* num);
/** <^(num)>大于@宏定义覆盖后可传入数字直接量 */
LBDeclare BOOL         (^numIsGreatThanNum)(NSNumber* num);
LBDeclare NSNumber*    (^numIsGreatThanNum_n)(NSNumber* num);
/** <^(num)>大等于@宏定义覆盖后可传入数字直接量 */
LBDeclare BOOL         (^numIsGreatEqualNum)(NSNumber* num);
LBDeclare NSNumber*    (^numIsGreatEqualNum_n)(NSNumber* num);
/** <^(num)>小于@宏定义覆盖后可传入数字直接量 */
LBDeclare BOOL         (^numIsLessThanNum)(NSNumber* num);
LBDeclare NSNumber*    (^numIsLessThanNum_n)(NSNumber* num);
/** <^(num)>小等于@宏定义覆盖后可传入数字直接量 */
LBDeclare BOOL         (^numIsLessEqualNum)(NSNumber* num);
LBDeclare NSNumber*    (^numIsLessEqualNum_n)(NSNumber* num);

/** <^()>判断奇数 */
LBDeclare BOOL         (^numIsOdd)(void);
LBDeclare NSNumber*    (^numIsOdd_n)(void);
/** <^()>判断偶数 */
LBDeclare BOOL         (^numIsEven)(void);
LBDeclare NSNumber*    (^numIsEven_n)(void);

/** <^()>判断负数 */
LBDeclare BOOL         (^numIsNegative)(void);
LBDeclare NSNumber*    (^numIsNegative_n)(void);

/** <^()>判断0 */
LBDeclare BOOL         (^numIsZero)(void);
LBDeclare NSNumber*    (^numIsZero_n)(void);

/** <^()>判断NaN(notANumber) */
LBDeclare BOOL         (^numIsNaN)(void);

/** <^()>取相反数 (YES,NO),(123,) */
LBDeclare NSNumber*    (^numReverse)(void);

/** <^(NSUInteger digit小数位数)>小数转字符串：digit：小数位数；digit=6 => 0.618000；digit=0时转为整数 */
LBDeclare NSString*           (^numToStrFloating)(NSUInteger digit);
/** <^(NSUInteger digit小数位数)>小数转百分比:@(0.231)->@"23.1%"，digit：小数位数 */
LBDeclare NSMutableString*    (^numToStrPercent)(NSUInteger digit);
/** <^(NSUInteger digit小数位数)>小数转字符串，限定最宽小数位数，超过的部分将进行四舍五入；整数时没有任何改变;当digit=0时小数将转为整数 */
LBDeclare NSString*    (^numToStrMaxDigit)(NSUInteger maxDigit);
/** <^()>数字转日期 */
LBDeclare NSDate*      (^numToNSDateSince1970)(void);
/** <^()> */
LBDeclare UIFont*      (^numToUIFontSystemSize)(void);
/** <@(0x969696).numToUIColorFromHex()>十六进制转颜色 */
LBDeclare UIColor*     (^numToUIColorFromHex)(void);

/** <^(NSArray* arr)>当前值是否在数组长度长度值内 */
LBDeclare BOOL         (^numIndexIsInArrRange)(NSArray* arr);
LBDeclare NSNumber*    (^numIndexIsInArrRange_n)(NSArray* arr);
/** <^(NSString* str)>当前值是否在字符串长度值范围内 */
LBDeclare BOOL         (^numIndexIsInStringRange)(NSString* str);
LBDeclare NSNumber*    (^numIndexIsInStringRange_n)(NSString* str);
/** <^(NSMutableArray* arr)> */
LBDeclare NSNumber*    (^numIndexObjRemoveFromArr)(NSMutableArray* arr);
/** <^(NSMutableArray* arr)>，越界时返回NSNull */
LBDeclare NSObject*    (^numIndexObjInArr)(NSMutableArray* arr);
@end

@interface NSNumber (NSNumberLinkBlock)

/** for循环，正序遍历 [0,idx) */
- (void)numForLoopASC:(void(^)(int idx))forBlock;
/** for循环，倒序遍历 (idx,0] */
- (void)numForLoopDESC:(void(^)(int idx))forBlock;
@end
