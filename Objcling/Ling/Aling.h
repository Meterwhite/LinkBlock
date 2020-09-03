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
@interface Aling<__covariant TargetType> : NSObject<NSFastEnumeration> {
@public
    NSMutableArray<AlingAction *>   *dynamicActions;
    NSMutableArray<TlingListener *> *listeners;
    NSMutableArray<TargetType>      *targets;
    AlingStatus   status;
    TlingErr      *error;
    AlingSafeKind safe;
    NSUInteger    step;
}

- (TargetType)target;

- (NSMutableArray<TargetType> *)targets;

+ (instancetype)lingWith:(TargetType)target;

+ (instancetype)lingsWith:(NSArray<TargetType> *)targets;

+ (instancetype)lingByLing:(Aling *)ling;

- (void)switchTarget:(TargetType)target;

- (void)pushError:(TlingErr *)err;

- (instancetype)stop;

- (NSUInteger)itemCount;

#pragma mark - Rewriteable

- (nullable Class)dependentClass;

/// 拷贝动态链
- (instancetype)mutableCopy;
- (instancetype)dynamilingCopy;
@end

NS_ASSUME_NONNULL_END
