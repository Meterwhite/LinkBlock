//
//  LinkBlockInvocation.h
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/16.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN


/**
 block形式的NSInvocation对象
 */
@interface LinkBlockInvocation : NSObject

/**
 构造方法
 */
+ (instancetype)invocationWithBlock:(id)block;
@property (nonatomic,readonly,copy) id block;
/**
 完全匹配block的方法的签名
 - Block 类型的方法签名 `NSString *(^)(int)`
 - Block 函数定义 `NSString *(*)(id, int)`
 - Block 签名 of `"@@?i"`
 - 方法签名 of `"@:i"` or `"@i"`
 */
//@property (readonly) NSMethodSignature *methodSignatureOfFunction;

/**
 完全匹配block的方法的签名的调用者
 */
//- (NSInvocation*)invocationOfFunction;

#pragma mark - override NSInvocation
@property (nonatomic , readonly) NSMethodSignature *methodSignature;

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
