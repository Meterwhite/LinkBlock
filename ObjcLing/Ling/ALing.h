//
//  ALing.h
//  ObjcLing
//
//  Created by MeterWhite on 2020/8/15.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    ALingSafeStateTrying    ,
    ALingSafeStateTriggering,
    ALingSafeStateThrowing  ,
} ALingSafeState;

@class TLingErr;

NS_ASSUME_NONNULL_BEGIN

@interface ALing<__covariant ObjectType> : NSObject<NSFastEnumeration> {
@public
    ALingSafeState  safe;
    NSUInteger      step;
    TLingErr        *error;
    NSMutableArray<ObjectType> *targets;
}

- (ObjectType)target;

- (NSMutableArray<ObjectType> *)targets;

- (TLingErr *)error;

- (NSUInteger)step;

+ (instancetype)lingWith:(ObjectType)target;

+ (instancetype)lingsWith:(NSArray<ObjectType> *)targets;

- (void)switchTarget:(ObjectType)target;

- (void)pushError:(TLingErr *)err;

- (NSUInteger)count;

- (nullable Class)dependentClass;

@end

NS_ASSUME_NONNULL_END
