//
//  TValueling.h
//  Objcling
//
//  Created by meterwhite on 2020/8/22.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TObjectling.h"

@class TNumberling;

NS_ASSUME_NONNULL_BEGIN

@interface TValueling : TObjectling

#pragma mark - CGRect
@property (readonly) TValueling *x;

@property (readonly) TValueling *y;

@property (readonly) TValueling *width;

@property (readonly) TValueling *height;

@property (readonly) TValueling *size;

@property (readonly) TValueling *origin;

#pragma mark - NSRange
@property (readonly) TValueling *location;

@property (readonly) TValueling *lenth;

#pragma mark - UIEdgeInsets
@property (readonly) TValueling *top;

@property (readonly) TValueling *left;

@property (readonly) TValueling *bottom;

@property (readonly) TValueling *right;

@end

#pragma mark - 类型协助

@interface TValueling (ObjclingGoing)
#pragma mark - Tling
/// 在用户的闭包中处理通知
@property (nonatomic,readonly) TValueling *(^notifiedIN)(NSNotificationName nam, TlingNotifiedIN block);
/// 使用作用到target的谓词控制链条的返回
@property (nonatomic,readonly) TValueling *(^stopWhile)(NSPredicate *predicate);
/// 展开链条，允许返回新的链条。
@property (nonatomic,readonly) TValueling *(^branchIN)(TlingBranchIN block);
/// 断言
@property (nonatomic,readonly) TValueling *(^asserttBy)(NSPredicate *predicate);
/// 断言；在行内判断，如`assertt(x == nil)`。变量x为当前对象，`assertt(Type, x.value > 0)`.
@property (nonatomic,readonly) TValueling *(^assertt)(id CODE_TYPE_x);
/// 断言；在闭包中判断
@property (nonatomic,readonly) TValueling *(^asserttIN)(TlingConditionIN block);
/// 执行动态链. var x = danamiling.go.get
@property (nonatomic,readonly) TValueling *go;
/// 使用指定的对象来执行动态链。
@property (nonatomic,readonly) TValueling *(^goBy)(id target);
/// 使用指定的多个对象来执行动态链。
@property (nonatomic,readonly) TValueling *(^goBys)(NSArray *targets);
/// 通过通知来触发动态链的执行。
@property (nonatomic,readonly) TValueling *(^notifiedGo)(NSNotificationName ntf);


#pragma mark - TObjectling
#pragma mark - 增
/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容
 * 注：如果必要则会潜在的把target或dst提升为可变类型
 */
@property (readonly) TValueling *(^appendto)(id dst);
/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容的索引处
 * 注：如果必要则会潜在的把target或dst提升为可变类型
 */
@property (readonly) TValueling *(^appendtoAt)(id dst, NSUInteger idx);

#pragma mark - 删
/**
 * 减量功能的抽象
 * 将对象从其他内容中移除，剪切字符串，减少集合内容，数字的减法
 * 注：如果必要则会潜在的把target或dst提升为可变类型
 */
@property (readonly) TValueling *(^deleteFrom)(id dst);

/**
 * 减量功能的抽象
 * 指定字段下的集合的清空，字符串的清空，数字的归零，对象的置为nil
 */
@property (readonly) TValueling *(^kvcClean)(NSString *k, ...);

#pragma mark - 改
/**
 * 替换内容
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TValueling *(^instead)(id neww, id old);

@property (readonly) TValueling *(^insteadAt)(id neww, NSUInteger idx);

@property (readonly) TValueling *(^kvcSet)(id v, NSString *k);

#define kvcToggle(...) kvcToggle(__VA_ARGS__, nil)
/// 指定字段下的布尔值的反转
@property (readonly) TValueling *(^kvcToggle)(NSString *k);

#define kvcInit(...) kvcInit(__VA_ARGS__, nil)
/**
 * 指定字段下的对象的懒惰初始化，如果字段不为nil则不进行初始化
 */
@property (readonly) TValueling *(^kvcInit)(NSString *k, ...);
#pragma mark - 查

#define floop(from, to, ...) sub_floop(__VA_ARGS__)
/// floop(from, to[, TargetType, CODE]) 链上的for循环
@property (readonly) TValueling *(^floop)(NSInteger from, NSInteger to, id CODE_OBJ_x_INT_i);

@property (readonly) TValueling *(^floopIN)(NSInteger from, NSInteger to, TlingILoopIN block);

@property (readonly) TValueling *(^outer)(id _Nullable * _Nullable toPtr);

@property (readonly) TValueling *(^kvcOuter)(id forObj,NSString *forKey);

@property (readonly) TValueling *(^kvcGet)(NSString *forKey);

#pragma mark - 控制
#define continuee(...) sub_continuee(__VA_ARGS__)
/// continuee([TargetType,] CODE)
@property (readonly) TValueling *(^continuee)(id CODE_OBJ_x);

@property (readonly) TValueling *(^continueeIN)(TlingConditionIN block);

#pragma mark - 其他

/// description
@property (readonly) TValueling *log;
/// debug description
@property (readonly) TValueling *delog;
/// 自定义指定格式的打印 : logFormat(@"...%@...")
@property (readonly) TValueling *(^logStyled)(NSString *format);
/// copy for taget
@property (readonly) TValueling *copied;
/// mutable copy for taget
@property (readonly) TValueling *mCopied;
@end

NS_ASSUME_NONNULL_END
