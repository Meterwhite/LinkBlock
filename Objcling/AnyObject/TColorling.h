//
//  TColorling.h
//  Objcling
//
//  Created by MeterWhite on 2020/9/8.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TObjectling.h"

@class TColorling;

NS_ASSUME_NONNULL_BEGIN

@protocol TColorLetling <NSObject>
/// 亮40%
@property (readonly) TColorling *lighter;
/// 暗40%
@property (readonly) TColorling *darker;

@property (readonly) TColorling *(^bgcolorInto)(id control);

@property (readonly) TColorling *(^textColorInto)(id control);

@end

@interface TColorling : TObjectling<TlingLetGrammar>

- (TColorling<TColorLetling> *)let;

@property (readonly) TColorling<TColorLetling> *let;

@property (readonly) TColorling *(^r)(CGFloat f);

@property (readonly) TColorling *(^g)(CGFloat f);

@property (readonly) TColorling *(^b)(CGFloat f);

@property (readonly) TColorling *(^a)(CGFloat f);

/// 色调
@property (readonly) TColorling *(^hue)(CGFloat f);
/// 饱和度
@property (readonly) TColorling *(^saturation)(CGFloat f);
/// 亮度
@property (readonly) TColorling *(^brightness)(CGFloat f);


@end

#pragma mark - 类型协助
@interface TColorling (ObjclingGoing)

#pragma mark - Tling
/// 在用户的闭包中处理通知
@property (nonatomic,readonly) TColorling *(^notifiedIN)(NSNotificationName nam, TlingNotifiedIN block);
/// 使用作用到target的谓词控制链条的返回
@property (nonatomic,readonly) TColorling *(^stopWhile)(NSPredicate *predicate);
/// 展开链条，允许返回新的链条。
@property (nonatomic,readonly) TColorling *(^branchIN)(TlingBranchIN block);
/// 断言
@property (nonatomic,readonly) TColorling *(^asserttBy)(NSPredicate *predicate);
/// 断言；在行内判断，如`assertt(x == nil)`。变量x为当前对象，`assertt(Type, x.value > 0)`.
@property (nonatomic,readonly) TColorling *(^assertt)(id CODE_TYPE_x);
/// 断言；在闭包中判断
@property (nonatomic,readonly) TColorling *(^asserttIN)(TlingConditionIN block);
/// 执行动态链. var x = danamiling.go.get
@property (nonatomic,readonly) TColorling *go;
/// 使用指定的对象来执行动态链。
@property (nonatomic,readonly) TColorling *(^goBy)(id target);
/// 使用指定的多个对象来执行动态链。
@property (nonatomic,readonly) TColorling *(^goBys)(NSArray *targets);
/// 通过通知来触发动态链的执行。
@property (nonatomic,readonly) TColorling *(^notifiedGo)(NSNotificationName ntf);
#pragma mark - TObjectling
#pragma mark - 增
/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容
 * 注：如果必要则会潜在的把target或dst提升为可变类型
 */
@property (readonly) TColorling *(^appendto)(id dst);
/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容的索引处
 * 注：如果必要则会潜在的把target或dst提升为可变类型
 */
@property (readonly) TColorling *(^appendtoAt)(id dst, NSUInteger idx);

#pragma mark - 删
/**
 * 减量功能的抽象
 * 将对象从其他内容中移除，剪切字符串，减少集合内容，数字的减法
 * 注：如果必要则会潜在的把target或dst提升为可变类型
 */
@property (readonly) TColorling *(^deleteFrom)(id dst);
/**
 * 减量功能的抽象
 * 指定字段下的集合的清空，字符串的清空，数字的归零，对象的置为nil
 */
@property (readonly) TColorling *(^kvcClean)(NSString *k, ...);

#pragma mark - 改
@property (readonly) TColorling *(^kvcSet)(id v, NSString *k);

/// 指定字段下的布尔值的反转
@property (readonly) TColorling *(^kvcToggle)(NSString *k);

/**
 * 指定字段下的对象的懒惰初始化，如果字段不为nil则不进行初始化
 */
@property (readonly) TColorling *(^kvcInit)(NSString *k, ...);
#pragma mark - 查

#define floop(from, to, ...) sub_floop(__VA_ARGS__)
/// floop(from, to[, TargetType, CODE]) 链上的for循环
@property (readonly) TColorling *(^floop)(NSInteger from, NSInteger to, id CODE_OBJ_x_INT_i);

@property (readonly) TColorling *(^floopIN)(NSInteger from, NSInteger to, TlingILoopIN block);

@property (readonly) TColorling *(^outer)(id _Nullable * _Nullable toPtr);

@property (readonly) TColorling *(^kvcOuter)(id forObj,NSString *forKey);

@property (readonly) TColorling *(^kvcGet)(NSString *forKey);

#pragma mark - 控制
#define continuee(...) sub_continuee(__VA_ARGS__)
/// continuee([TargetType,] CODE)
@property (readonly) TColorling *(^continuee)(id CODE_OBJ_x);

@property (readonly) TColorling *(^continueeIN)(TlingConditionIN block);

#pragma mark - 其他

/// description
@property (readonly) TColorling *log;
/// debug description
@property (readonly) TColorling *delog;
/// 自定义指定格式的打印 : logFormat(@"...%@...")
@property (readonly) TColorling *(^logStyled)(NSString *format);
/// copy for taget
@property (readonly) TColorling *copied;
/// mutable copy for taget
@property (readonly) TColorling *mCopied;

@end

NS_ASSUME_NONNULL_END
