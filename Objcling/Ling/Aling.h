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

/// 拆链
id _Nonnull DelingWith(Aling * _Nonnull ling);

NS_ASSUME_NONNULL_BEGIN

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

- (TlingErr *)error;

- (NSUInteger)step;

+ (instancetype)lingWith:(TargetType)target;

+ (instancetype)lingsWith:(NSArray<TargetType> *)targets;

+ (instancetype)lingByLing:(Aling *)ling;

- (void)switchTarget:(TargetType)target;

- (void)pushError:(TlingErr *)err;

- (instancetype)returnn;

- (NSUInteger)count;

#pragma mark - Rewriteable

- (nullable Class)dependentClass;

@end

NS_ASSUME_NONNULL_END
