//
//  Aling.h
//  Objcling
//
//  Created by MeterWhite on 2020/8/15.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    ALingSafeKindTrying    ,
    ALingSafeKindTriggering,
    ALingSafeKindThrowing  ,
} ALingSafeKind;

typedef enum : NSUInteger {
    ALingStatusExecuting,
    ALingStatusReturning,
    ALingStatusFuture   ,
} ALingStatus;

@class TlingErr, AlingAction, TlingListener;

NS_ASSUME_NONNULL_BEGIN

@interface Aling<__covariant TargetType> : NSObject<NSFastEnumeration> {
@public
    NSMutableArray<TargetType>   *targets;
    NSMutableArray<AlingAction*> *dynamicActions;
    NSMutableArray<TlingListener*> *listeners;
    ALingSafeKind   safe;
    NSUInteger      step;
    ALingStatus     status;
    TlingErr        *error;
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

- (void)returnLing;

- (NSUInteger)count;

#pragma mark - Rewriteable

- (nullable Class)dependentClass;

@end

NS_ASSUME_NONNULL_END
