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

/**
 * 类型链
 */
@interface Tling<__covariant TargetType> : Aling

#pragma mark - 拆箱：获取指定类型的值

/// 如果是多链（lings）返回数组形式
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

#pragma mark - 功能

#define iss(...) sub_iss(__VA_ARGS__)
/// 判断
@property (nonatomic,readonly) bool (^iss)(id CODE_OBJx);

@property (nonatomic,readonly) bool (^issIN)(TlingConditionIN block);

@property (nonatomic,readonly) bool (^predicated)(NSPredicate *predicate);

/// 在闭包中接收通知
@property (nonatomic,readonly) Tling *(^notifiedIN)(NSNotificationName nam, TlingNotifiedIN block);

#pragma mark - 控制（涉及安全，动态，语法，断言）

/// 这是非动态链的结束语法。有两个功能：抛出存在的异常。在代码层面上消除未获取变量警告。
@property (nonatomic,readonly) void(^done)(void);

/// 不抛出异常
- (instancetype)trying;

/// 立刻抛出异常，如果存在。
- (instancetype)throwing;

/// 使用作用到target的谓词控制链条的返回
@property (nonatomic,readonly) Tling *(^stopWhile)(NSPredicate *predicate);

/// 展开链条，允许返回新的链条。
@property (nonatomic,readonly) Tling *(^branchIN)(TlingBranchIN block);

/// 断言
@property (nonatomic,readonly) Tling *(^asserttBy)(NSPredicate *predicate);

/**
 * <#...#>
 */
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
