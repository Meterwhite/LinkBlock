//
//  NSArrayling.h
//  Objcling
//
//  Created by meterwhite on 2020/8/21.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "LingDefines.h"
#import "TObjectling.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TArrayLetling <NSObject>

@property (readonly) TArrayling<TArrayLetling> *reversed;

@property (readonly) TArrayling<TArrayLetling> *(^addUnique)(id obj);

@end

@interface TArrayling : TObjectling

#pragma mark - 增
#pragma mark - 删
#pragma mark - 改
#define sortt(...) sub_sortt(__VA_ARGS__)
/// <#Description#>
@property (readonly) TArrayling *(^sortt)(id CODE_OBJ_x);
@property (readonly) TArrayling *(^sorttIN)(TlingSortIN block);

@property (readonly) TArrayling *(^subFrom)(NSUInteger from);

@property (readonly) TArrayling *(^subString)(NSUInteger to, NSUInteger from);

@property (readonly) TArrayling *(^subTo)(NSUInteger to);

@property (readonly) TArrayling *(^subRange)(NSRange ran);
#pragma mark - 查
#define loopp(from, to, ...) sub_loopp(__VA_ARGS__)
/// loop([TargetType,] CODE)
@property (readonly) TArrayling *(^loopp)(id CODE_OBJ_x);
@property (readonly) TArrayling *(^looppIN)(TlingxIN block);
@property (readonly) TArrayling *(^contains)(id obj);

@property (readonly) TArrayling *(^filter)(NSPredicate *predicate);
@property (readonly) TArrayling *(^filterIN)(TlingConditionIN block);

@property (readonly) TArrayling *(^at)(NSUInteger idx);

@property (readonly) TArrayling *first;
@property (readonly) TArrayling *last;

#pragma mark - 转换
@property (readonly) TArrayling *join;
@property (readonly) TArrayling *(^joinWith)(NSString *s);


@end

#pragma mark - 声明

@interface TArrayling (Generic)
#pragma mark - Tling

#pragma mark - TObjectling

@end

GENERIC_EX_TLING(TArrayling)

NS_ASSUME_NONNULL_END
