//
//  ALing.h
//  ObjcLing
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

@class TLingErr,ALingAction;

NS_ASSUME_NONNULL_BEGIN

@interface ALing<__covariant ObjectType> : NSObject<NSFastEnumeration> {
@public
    NSMutableArray<ALingAction*> *dynamicActions;
    NSMutableArray<ObjectType>   *targets;
    ALingSafeKind   safe;
    NSUInteger      step;
    ALingStatus     status;
    TLingErr        *error;
    bool            observed;
}

- (ObjectType)target;

- (NSMutableArray<ObjectType> *)targets;

- (TLingErr *)error;

- (NSUInteger)step;

+ (instancetype)lingWith:(ObjectType)target;

+ (instancetype)lingsWith:(NSArray<ObjectType> *)targets;

+ (instancetype)lingWithLing:(ALing *)ling;

- (void)switchTarget:(ObjectType)target;

- (void)pushError:(TLingErr *)err;

- (void)returnLing;

- (NSUInteger)count;

#pragma mark - Rewriteable

- (nullable Class)dependentClass;

@end

NS_ASSUME_NONNULL_END
