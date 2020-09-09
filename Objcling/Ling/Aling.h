//
//  Aling.h
//  Objcling
//
//  Created by meterwhite on 2020/8/15.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Aling, TlingErr, AlingAction, TlingListener;

typedef enum : NSUInteger {
    AlingSafeKindTrying    ,
    AlingSafeKindTriggering,
    AlingSafeKindThrowing  ,
} AlingSafeKind;

typedef enum : NSUInteger {
    /// 状态为执行中
    AlingStatusExecuting,
    /// 状态为返回
    AlingStatusReturning,
    /// 状态为动态的
    AlingStatusFuture   ,
} AlingStatus;

/// 拆箱
id _Nonnull DelingWith(Aling * _Nonnull ling);

NS_ASSUME_NONNULL_BEGIN

/// 抽象链
@interface Aling : NSObject<NSFastEnumeration> {
@public
    NSMutableArray<AlingAction *>   *dynamicActions;
    NSMutableArray<TlingListener *> *listeners;
    NSMutableArray*targets;
    AlingStatus   status;
    TlingErr      *error;
    AlingSafeKind safe;
    NSUInteger    step;
}

- (id)target;

- (NSMutableArray *)targets;

+ (instancetype)lingWith:(id)target;

+ (instancetype)lingsWith:(NSArray *)targets;

/// 用于转换链条的类型
+ (instancetype)lingByLing:(Aling *)ling;

- (void)switchTarget:(id)target;

- (void)pushError:(TlingErr *)err;

- (NSUInteger)itemCount;

#pragma mark - 自定义重写

- (nullable Class)dependentClass;

#pragma mark - Foundation
- (instancetype)copy;

- (instancetype)mutableCopy;
@end

NS_ASSUME_NONNULL_END
