//
//  Tling.h
//  Objcling
//
//  Created by MeterWhite on 2020/8/16.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "LingDefines.h"
#import "Aling.h"
@class TObjectling,Tling;

NS_ASSUME_NONNULL_BEGIN

/// Ling for type
@interface Tling<__covariant TargetType> : Aling

- (TargetType)get;

- (bool)getBool;

- (NSInteger)getInt;

- (NSUInteger)getUInt;

- (float)getFloat;

- (double)getDouble;

- (NSString *)getString;

- (NSNumber *)getNumber;

- (NSArray *)getArray;

- (NSDictionary *)getDictionary;

#define wass(...) sub_iss(__VA_ARGS__)
@property (nonatomic,readonly) bool (^iss)(id CODE_OBJx);

@property (nonatomic,readonly) bool (^issIN)(TlingConditionIN block);

@property (nonatomic,readonly) bool (^predicated)(NSPredicate *predicate);

@property (nonatomic,readonly) Tling *(^notifiedIN)(NSNotificationName nam,TlingNotifiedIN block);

#pragma mark - 控制

/// obj.ling.will.log.at(i).observedDone(...);
- (instancetype)will;

@property (nonatomic,readonly) void(^done)(void);

@property (nonatomic,readonly) Tling *(^notifiedDone)(NSNotificationName ntf);

- (instancetype)trying;

- (instancetype)throwing;

@property (nonatomic,readonly) Tling *(^branchIN)(TlingBranchIN block);

@property (nonatomic,readonly) Tling *(^asserttBy)(NSPredicate *predicate);

#define assertt(...) sub_assertt(__VA_ARGS__)
@property (nonatomic,readonly) Tling *(^assertt)(id CODE_OBJx);

@property (nonatomic,readonly) Tling *(^asserttIN)(TlingConditionIN block);

@end

NS_ASSUME_NONNULL_END
