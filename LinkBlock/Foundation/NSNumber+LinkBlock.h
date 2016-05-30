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
@property (nonatomic,copy) void*        (^numValue)();

/** 是否是整数包含长短整型 */
@property (nonatomic,copy) BOOL         (^numIsInteger)();
/** 是否是浮点数，包含单双精度浮点型 */
@property (nonatomic,copy) BOOL         (^numIsFloating)();
@property (nonatomic,copy) BOOL         (^numIsChar)();
@property (nonatomic,copy) BOOL         (^numIsBool)();

/** YES：小数位为0，NO：小数位有值， */
@property (nonatomic,copy) BOOL         (^numHasDecimalValue)();
@property (nonatomic,copy) BOOL         (^numIsEqualToValue)(double value);
@property (nonatomic,copy) BOOL         (^numIsMoreThanValue)(double value);
@property (nonatomic,copy) BOOL         (^numIsMoreThanOrEqualValue)(double value);
@property (nonatomic,copy) BOOL         (^numIsLessThanValue)(double value);
@property (nonatomic,copy) BOOL         (^numIsLessThanOrEqualValue)(double value);
@property (nonatomic,copy) BOOL         (^numIsEqualToNum)(NSNumber* aNum);

/** 判断奇数 */
@property (nonatomic,copy) BOOL         (^numIsOdd)();
/** 判断偶数 */
@property (nonatomic,copy) BOOL         (^numIsEven)();

/**
 *  小数转字符串：digit：小数位数
 */
@property (nonatomic,copy) NSString*    (^numFloatingToStr)(NSUInteger digit);
/** 小数转百分比:0.231>>23.1%，digit：小数位数 */
@property (nonatomic,copy) NSMutableString*    (^numFloatingToPercentStr)(NSUInteger digit);
/** 数字转日期 */
@property (nonatomic,copy) NSDate*      (^numToNSDateSince1970)();

/** 当前数字是否在数组长度范围内 */
@property (nonatomic,copy) BOOL         (^numIndexIsInArrRange)(NSArray* arr);
/** 当前数字是否在字符串长度范围内 */
@property (nonatomic,copy) BOOL         (^numIndexIsInStringRange)(NSString* str);
@property (nonatomic,copy) NSNumber*    (^numSetHeightToViews)(NSArray* views);
@property (nonatomic,copy) NSNumber*    (^numSetWidthToViews)(NSArray* views);
@property (nonatomic,copy) NSNumber*    (^numSetXToViews)(NSArray* views);
@property (nonatomic,copy) NSNumber*    (^numSetYToViews)(NSArray* views);

@end

@interface NSNumber (NSNumberLinkBlock)

/** for循环，遍历 [0,idx) */
- (void)numForLoopASC:(void(^)(int idx))forBlock;
/** for循环，遍历 (idx,0] */
- (void)numForLoopDESC:(void(^)(int idx))forBlock;
@end