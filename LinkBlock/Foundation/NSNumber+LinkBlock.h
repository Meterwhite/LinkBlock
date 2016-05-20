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

@property (nonatomic,copy) BOOL         (^numIsInteger)();
@property (nonatomic,copy) BOOL         (^numIsFloating)();
@property (nonatomic,copy) BOOL         (^numIsChar)();
@property (nonatomic,copy) BOOL         (^numIsBool)();

/**
 *  小数转字符串：digit：小数位数
 */
@property (nonatomic,copy) NSString*    (^numDoubleToStr)(NSUInteger digit);
/** 小数转百分比:0.231>>23.1%，digit：小数位数 */
@property (nonatomic,copy) NSMutableString*    (^numDoubleToPercentStr)(NSUInteger digit);
/** YES：小数位为0，NO：小数位有值， */
@property (nonatomic,copy) BOOL         (^numHasDecimalValue)();

@property (nonatomic,copy) BOOL         (^numIsEqualToValue)(double value);
@property (nonatomic,copy) BOOL         (^numIsMoreThanValue)(double value);
@property (nonatomic,copy) BOOL         (^numIsMoreThanOrEqualValue)(double value);
@property (nonatomic,copy) BOOL         (^numIsLessThanValue)(double value);
@property (nonatomic,copy) BOOL         (^numIsLessThanOrEqualValue)(double value);

@property (nonatomic,copy) BOOL         (^numIsEqualToNum)(NSNumber* aNum);

@property (nonatomic,copy) NSNumber*    (^numSetHeightToViews)(NSArray* views);
@property (nonatomic,copy) NSNumber*    (^numSetWidthToViews)(NSArray* views);
@property (nonatomic,copy) NSNumber*    (^numSetXToViews)(NSArray* views);
@property (nonatomic,copy) NSNumber*    (^numSetYToViews)(NSArray* views);

@end

@interface NSNumber (NSNumberLinkBlock)

/** for循环，从 0到idx */
- (void)numForLoopASC:(void(^)(int idx))forBlock;
/** for循环，从 idx到0 */
- (void)numForLoopDESC:(void(^)(int idx))forBlock;
@end