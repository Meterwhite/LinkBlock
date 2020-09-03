//
//  Tling.h
//  Objcling
//
//  Created by meterwhite on 2020/8/16.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "LingDefines.h"
#import "Aling.h"

NS_ASSUME_NONNULL_BEGIN

/// 类型化的链条
@interface Tling<__covariant TargetType> : Aling

#pragma mark - 链拆箱

/// 如果是多链（lings）返回数组
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

#define iss(...) sub_iss(__VA_ARGS__)
/// 判断
@property (nonatomic,readonly) bool (^iss)(id CODE_OBJx);

@property (nonatomic,readonly) bool (^issIN)(TlingConditionIN block);

@property (nonatomic,readonly) bool (^predicated)(NSPredicate *predicate);

/// 接收通知
@property (nonatomic,readonly) Tling *(^notifiedIN)(NSNotificationName nam,TlingNotifiedIN block);

#pragma mark - 控制

/// 这是非动态链的结束语法。有两个功能：抛出执行中的异常。消除未获取变量警告。
@property (nonatomic,readonly) void(^done)(void);

- (instancetype)trying;

- (instancetype)throwing;

@property (nonatomic,readonly) Tling *(^branchIN)(TlingBranchIN block);

@property (nonatomic,readonly) Tling *(^asserttBy)(NSPredicate *predicate);

#define assertt(...) sub_assertt(__VA_ARGS__)
@property (nonatomic,readonly) Tling *(^assertt)(id CODE_OBJx);

@property (nonatomic,readonly) Tling *(^asserttIN)(TlingConditionIN block);
#pragma mark - 动态化（所有动态化相关方法不能再次动态化）
/// 将当前链条动态化，可以存储后以供将来使用。在执行的时候依然可以增加新的内容到链中，这是闭包(block)无法做到的。
- (instancetype)will;
/// 执行动态链. var x = danamiling.go.get
@property (nonatomic,readonly) Tling *(^go)(void);
@property (nonatomic,readonly) Tling *(^goBy)(id target);
@property (nonatomic,readonly) Tling *(^goBys)(NSArray *targets);

/// 通过通知执行动态链。（该方法不能动态化）
@property (nonatomic,readonly) Tling *(^notifiedGo)(NSNotificationName ntf);


@end

NS_ASSUME_NONNULL_END
