//
//  LinkFunctionInvocation.h
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/26.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface LinkFunctionInvocation : NSObject
/**
 构造方法
 */
+ (instancetype)invocationWithCode:(id)code;

#pragma mark - override NSInvocation
@property (nonatomic , readonly) NSMethodSignature *methodSignature;
//手动管理内存不需要设置
- (void)retainArguments;
@property (readonly) BOOL argumentsRetained;

@property (nullable, assign) id target;
@property SEL selector;

- (void)getReturnValue:(void *)retLoc;
- (void)setReturnValue:(void *)retLoc;
/**
 @param argumentLocation block函数签名没有`self` (`'@'`)
 和 `_cmd` (`':'`)而只有(`'@?'`)，所以参数不是从2开始而是从1开始设置
 */
- (void)getArgument:(void *)argumentLocation atIndex:(NSInteger)idx;

/**
 @param argumentLocation block函数签名没有`self` (`'@'`)
 和 `_cmd` (`':'`)而只有(`'@?'`)，所以参数不是从2开始而是从1开始设置
 */
- (void)setArgument:(void *)argumentLocation atIndex:(NSInteger)idx;

- (void)invoke;
- (void)invokeWithTarget:(id)target;
@end
NS_ASSUME_NONNULL_END
