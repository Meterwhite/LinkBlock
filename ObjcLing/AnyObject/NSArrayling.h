//
//  NSArrayling.h
//  ObjcLingDemo
//
//  Created by MeterWhite on 2020/8/21.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "LingDefines.h"
#import "NSObjectling.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSArrayling<__covariant TYPEx> : NSObjectling

#pragma mark - 增
#pragma mark - 删
#pragma mark - 改
#define sort(...) sub_sort(__VA_ARGS__)
/// <#Description#>
@property (readonly) NSArrayling *(^sort)(id CODE_OBJ_x);
@property (readonly) NSArrayling *(^sortIN)(TLingSortIN block);
#pragma mark - 查
#define loopp(from, to, ...) sub_loopp(__VA_ARGS__)
/// loop([TYPEx,] CODE)
@property (readonly) NSArrayling *(^loopp)(id CODE_OBJ_x);
@property (readonly) NSArrayling *(^looppIN)(TLingxIN block);

@property (readonly) NSArrayling *(^filter)(NSPredicate *predicate);
@property (readonly) NSArrayling *(^filterIN)(TLingConditionIN block);

#pragma mark - Array
@property (readonly) NSArrayling *(^at)(NSUInteger idx);

@end

#pragma mark - 声明

@interface NSArrayling<__covariant TYPEx> (Generic)
@property (readonly) NSArrayling *(^branchIN)(TLingNSArraylingbranchIN block);
- (TYPEx)get;
@property (readonly) NSArrayling *log;
@end

NS_ASSUME_NONNULL_END
