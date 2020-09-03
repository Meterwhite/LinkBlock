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

/// Parametric Type Link.
/// 用户实现属性 at0..at1..at3 可以传nil
@protocol TlingParametric <NSObject>
@optional
+ (const char *)encodeAt:(NSInteger)idx;
@end

/// 用户实现属性 只支持对象类型 nil结束
@protocol TlingVariableParametric <TlingParametric>
@required
- (NSMutableArray *)arrayForValist;
@end

/// Broken Type Link
@protocol TlingBroken <NSObject>

@end

/// Abstract Action Link
@interface AlingAction: NSObject {
    Class dependentClass;
}


@property (nonatomic) id target;

@property (nonatomic) NSUInteger step;

@property (nonatomic) DynamilingInfo *dynamilingInfo;

@property (nonatomic, readonly)  Tling *dynamiling;

#pragma mark - 可重写

/// return: return new target while not nil;
- (nullable id)sendMsg:(TlingErr *_Nullable*_Nullable)err;

/// 确定的参数个数
- (NSUInteger)count;

/// 消息转发到selector
- (nullable SEL)forwardSEL;

@end

NS_ASSUME_NONNULL_END
