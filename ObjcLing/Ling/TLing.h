//
//  TLing.h
//  ObjcLing
//
//  Created by MeterWhite on 2020/8/16.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "LingDefines.h"
#import "ALing.h"
@class NSObjectling,TLing;

NS_ASSUME_NONNULL_BEGIN

/// Ling for type
@interface TLing<__covariant TYPEx> : ALing

- (TYPEx)get;

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

@property (nonatomic,readonly) bool (^issIN)(TLingConditionIN block);

@property (nonatomic,readonly) bool (^predicated)(NSPredicate *predicate);

@property (nonatomic,readonly) TLing *(^notifiedIN)(NSNotificationName nam,TLingNotifiedIN block);

#pragma mark - 控制

/// obj.ling.will.log.at(i).observedDone(...);
- (instancetype)will;

@property (nonatomic,readonly) void(^done)(void);

@property (nonatomic,readonly) TLing *(^notifiedDone)(NSNotificationName ntf);

- (instancetype)trying;

- (instancetype)throwing;

@property (nonatomic,readonly) TLing *(^branchIN)(TLingBranchIN block);

@property (nonatomic,readonly) TLing *(^asserttBy)(NSPredicate *predicate);

#define assertt(...) sub_assertt(__VA_ARGS__)
@property (nonatomic,readonly) TLing *(^assertt)(id CODE_OBJx);

@property (nonatomic,readonly) TLing *(^asserttIN)(TLingConditionIN block);

@end

NS_ASSUME_NONNULL_END
