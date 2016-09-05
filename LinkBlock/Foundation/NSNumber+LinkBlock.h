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
@property (nonatomic,copy,readonly) void*        (^numValue)();

/** 是否是整数包含长短整型 */
@property (nonatomic,copy,readonly) BOOL         (^numIsInteger)();
/** 是否是浮点数，包含单双精度浮点型 */
@property (nonatomic,copy,readonly) BOOL         (^numIsFloating)();
@property (nonatomic,copy,readonly) BOOL         (^numIsChar)();
@property (nonatomic,copy,readonly) BOOL         (^numIsBool)();

/** YES：小数位为0，NO：小数位有值， */
@property (nonatomic,copy,readonly) BOOL         (^numHasDecimalValue)();
@property (nonatomic,copy,readonly) BOOL         (^numIsEqualToValue)(double value);
@property (nonatomic,copy,readonly) BOOL         (^numIsMoreThanValue)(double value);
@property (nonatomic,copy,readonly) BOOL         (^numIsMoreThanOrEqualValue)(double value);
@property (nonatomic,copy,readonly) BOOL         (^numIsLessThanValue)(double value);
@property (nonatomic,copy,readonly) BOOL         (^numIsLessThanOrEqualValue)(double value);
@property (nonatomic,copy,readonly) BOOL         (^numIsEqualToNum)(NSNumber* aNum);

/** 判断奇数 */
@property (nonatomic,copy,readonly) BOOL         (^numIsOdd)();
/** 判断偶数 */
@property (nonatomic,copy,readonly) BOOL         (^numIsEven)();

/**
 *  小数转字符串：digit：小数位数
 */
@property (nonatomic,copy,readonly) NSString*    (^numFloatingToStr)(NSUInteger digit);
/** 小数转百分比:0.231>>23.1%，digit：小数位数 */
@property (nonatomic,copy,readonly) NSMutableString*    (^numFloatingToPercentStr)(NSUInteger digit);
/** 数字转日期 */
@property (nonatomic,copy,readonly) NSDate*      (^numToNSDateSince1970)();
@property (nonatomic,copy,readonly) UIFont*      (^numToUIFontSystemSize)();
/** <@(0x969696).numToUIColorFromHex()>十六进制转颜色 */
@property (nonatomic,copy,readonly) UIColor*     (^numToUIColorFromHex)();

/** 当前数字是否在数组长度范围内 */
@property (nonatomic,copy,readonly) BOOL         (^numIndexIsInArrRange)(NSArray* arr);
/** 当前数字是否在字符串长度范围内 */
@property (nonatomic,copy,readonly) BOOL         (^numIndexIsInStringRange)(NSString* str);
@property (nonatomic,copy,readonly) NSNumber*    (^numSetHeightToViews)(NSArray* views);
@property (nonatomic,copy,readonly) NSNumber*    (^numSetWidthToViews)(NSArray* views);
@property (nonatomic,copy,readonly) NSNumber*    (^numSetXToViews)(NSArray* views);
@property (nonatomic,copy,readonly) NSNumber*    (^numSetYToViews)(NSArray* views);

@end

@interface NSNumber (NSNumberLinkBlock)

/** for循环，遍历 [0,idx) */
- (void)numForLoopASC:(void(^)(int idx))forBlock;
/** for循环，遍历 (idx,0] */
- (void)numForLoopDESC:(void(^)(int idx))forBlock;
@end