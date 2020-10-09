//
//  AlingAction.h
//  Objcling
//
//  Created by meterwhite on 2020/8/16.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Tling,TlingErr,DynamilingInfo;

NS_ASSUME_NONNULL_BEGIN

/// 方法是支持参数的方法，即block形式的属性
/// 用户实现属性 at0..at1..at3 可以传nil
@protocol TActionParametric <NSObject>
@optional
+ (const char *)encodeAt:(NSInteger)idx;
@end

/// 方法是支持可变参数列表的，要求实现者提供一个可变数组来容纳装箱类型的参数
@protocol TActionVariableParametric <TActionParametric>
@required
- (NSMutableArray *)arrayForValist;
@end

/// 表该方法的返回值类型不是Aling的子类，这将打断链式语法
@protocol TActionLingBroken <NSObject>

@end

/// 链方法（抽象的）
@interface AlingAction: NSObject {
    Class dependentClass;
}


/// 当前的目标对象，多链时则是当前某一个目标对象
@property (nonatomic) id target;

/// 链的步长
@property (nonatomic) NSUInteger step;

/// 动态链信息，动态链中才会存在
@property (nonatomic) DynamilingInfo *dynamilingInfo;

/// 关联的动态链。动态链中才会存在
@property (nonatomic, readonly)  Tling *dynamiling;

#pragma mark - 可重写

/// 调用链的方法。返回值将作为新的链的目标对象，为空则无为。
- (nullable id)sendMsg:(TlingErr *_Nullable*_Nullable)err;

/// 实参数
- (NSUInteger)count;

/**
 * 消息转发到selector，如果仅仅需要转发消息到target上，重写该方法即可，而不需要实现sendMsg
 */
- (nullable SEL)forwardSEL;

@end

NS_ASSUME_NONNULL_END
