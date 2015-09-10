//
//  NSNumber+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/4.
//  Copyright (c) 2015年 QuXingYi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkBlock.h"

@interface NSObject(NSNumberLinkBlock)
@property (nonatomic,copy) void*        (^numValue)();

@property (nonatomic,copy) BOOL         (^numIsInteger)();
@property (nonatomic,copy) BOOL         (^numIsFloating)();
@property (nonatomic,copy) BOOL         (^numIsChar)();
@property (nonatomic,copy) BOOL         (^numIsBool)();

/** 加法 */
@property (nonatomic,copy) NSNumber*    (^numAddByIntegerType)(NSNumber* num);
@property (nonatomic,copy) NSNumber*    (^numAddByFloatingType)(NSNumber* num);
/** 减法 */
@property (nonatomic,copy) NSNumber*    (^numMinusByIntegerType)(NSNumber* num);
@property (nonatomic,copy) NSNumber*    (^numMinusByFloatingType)(NSNumber* num);
/** 乘法 */
@property (nonatomic,copy) NSNumber*    (^numMultipByIntegerType)(NSNumber* num);
@property (nonatomic,copy) NSNumber*    (^numMultipByFloatingType)(NSNumber* num);
/** 除法 */
@property (nonatomic,copy) NSNumber*    (^numDivideByIntegerType)(NSNumber* num);
@property (nonatomic,copy) NSNumber*    (^numDivideByFloatingType)(NSNumber* num);

@property (nonatomic,copy) NSNumber*    (^numSetHeightToViews)(NSArray* views);
@property (nonatomic,copy) NSNumber*    (^numSetWidthToViews)(NSArray* views);
@property (nonatomic,copy) NSNumber*    (^numSetXToViews)(NSArray* views);
@property (nonatomic,copy) NSNumber*    (^numSetYToViews)(NSArray* views);
@end
