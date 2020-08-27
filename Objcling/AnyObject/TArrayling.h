//
//  NSArrayling.h
//  Objcling
//
//  Created by MeterWhite on 2020/8/21.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "LingDefines.h"
#import "TObjectling.h"

NS_ASSUME_NONNULL_BEGIN

@interface TArrayling<__covariant TargetType> : TObjectling

#pragma mark - 增
#pragma mark - 删
#pragma mark - 改
#define sort(...) sub_sort(__VA_ARGS__)
/// <#Description#>
@property (readonly) TArrayling *(^sort)(id CODE_OBJ_x);
@property (readonly) TArrayling *(^sortIN)(TlingSortIN block);
#pragma mark - 查
#define loopp(from, to, ...) sub_loopp(__VA_ARGS__)
/// loop([TargetType,] CODE)
@property (readonly) TArrayling *(^loopp)(id CODE_OBJ_x);
@property (readonly) TArrayling *(^looppIN)(TlingxIN block);

@property (readonly) TArrayling *(^filter)(NSPredicate *predicate);
@property (readonly) TArrayling *(^filterIN)(TlingConditionIN block);

#pragma mark - Array
@property (readonly) TArrayling *(^at)(NSUInteger idx);

@end

#pragma mark - 声明

@interface TArrayling<__covariant TargetType> (Generic)
@property (readonly) TArrayling *(^branchIN)(TlingTArraylingbranchIN block);
- (TargetType)get;
@property (readonly) TArrayling *log;
@end

NS_ASSUME_NONNULL_END
