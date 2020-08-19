//
//  ALingAction.h
//  ObjcLing
//
//  Created by MeterWhite on 2020/8/16.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TLingErr;
NS_ASSUME_NONNULL_BEGIN

/// Parametric Type Link.
/// 用户实现属性 at0..at1..at3 可以传nil
@protocol TLingParametric <NSObject>
@optional
+ (const char *)encodeAt:(NSInteger)idx;
@end

/// 用户实现属性 只支持对象类型 nil结束
@protocol TLingVariableParametric <TLingParametric>
@required
- (NSMutableArray *)arrayForValist;
@end

/// Broken Type Link
@protocol TLingBroken <NSObject>

@end

/// Abstract Action Link
@interface ALingAction: NSObject

@property id target;

@property NSUInteger step;

/// 确定的参数个数
- (NSUInteger)count;

/// 消息转发到selector
- (nullable SEL)forwardSEL;

/// return: return new target while not nil;
- (nullable id)sendMsg:(TLingErr *_Nullable*_Nullable)err;

@end

NS_ASSUME_NONNULL_END
