//
//  NSArrayling.h
//  Objcling
//
//  Created by meterwhite on 2020/8/21.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "LingDefines.h"
#import "TObjectling.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TArrayLetling <NSObject>
/// 倒序的数组
@property (readonly) TArrayling *reversed;
/// 添加唯一的对象
@property (readonly) TArrayling *(^addUnique)(id obj);
@end

@interface TArrayling : TObjectling<TlingLetGrammar>

- (TArrayling<TArrayLetling>*)let;

#define sortt(...) sub_sortt(__VA_ARGS__)
/// 数组排序，在行内提供条件，如`sortt( x... )`。双参数时第一个为x的类型：`sortt( Type, x....)`.
@property (readonly) TArrayling *(^sortt)(id CODE_OBJ_x);

@property (readonly) TArrayling *(^sorttIN)(TlingSortIN block);

@property (readonly) TArrayling *(^subFrom)(NSUInteger from);

@property (readonly) TArrayling *(^subString)(NSUInteger to, NSUInteger from);

@property (readonly) TArrayling *(^subTo)(NSUInteger to);

@property (readonly) TArrayling *(^subRange)(NSRange ran);

#pragma mark - 查
#define loopp(from, to, ...) sub_loopp(__VA_ARGS__)
/// loop([TargetType,] CODE)
@property (readonly) TArrayling *(^loopp)(id CODE_OBJ_x);

@property (readonly) TArrayling *(^looppIN)(TlingxIN block);

@property (readonly) TArrayling *(^contains)(id obj);

@property (readonly) TArrayling *(^filter)(NSPredicate *predicate);

@property (readonly) TArrayling *(^filterIN)(TlingConditionIN block);

@property (readonly) TArrayling  *join;

@property (readonly) TArrayling  *(^joinWith)(NSString *s);

#pragma mark - 转换
@property (readonly) TObjectling *(^at)(NSUInteger idx);

@property (readonly) TObjectling *first;

@property (readonly) TObjectling *last;

@end

#pragma mark - 类型协助
@interface TArrayling (ObjclingGoing)

#pragma mark - Tling
/// 在用户的闭包中处理通知
@property (nonatomic,readonly) TArrayling *(^notifiedIN)(NSNotificationName nam, TlingNotifiedIN block);
/// 使用作用到target的谓词控制链条的返回
@property (nonatomic,readonly) TArrayling *(^stopWhile)(NSPredicate *predicate);
/// 展开链条，允许返回新的链条。
@property (nonatomic,readonly) TArrayling *(^branchIN)(TlingBranchIN block);
/// 断言
@property (nonatomic,readonly) TArrayling *(^asserttBy)(NSPredicate *predicate);
/// 断言；在行内判断，如`assertt(x == nil)`。变量x为当前对象，`assertt(Type, x.value > 0)`.
@property (nonatomic,readonly) TArrayling *(^assertt)(id CODE_TYPE_x);
/// 断言；在闭包中判断
@property (nonatomic,readonly) TArrayling *(^asserttIN)(TlingConditionIN block);
/// 执行动态链. var x = danamiling.go.get
@property (nonatomic,readonly) TArrayling *go;
/// 使用指定的对象来执行动态链。
@property (nonatomic,readonly) TArrayling *(^goBy)(id target);
/// 使用指定的多个对象来执行动态链。
@property (nonatomic,readonly) TArrayling *(^goBys)(NSArray *targets);
/// 通过通知来触发动态链的执行。
@property (nonatomic,readonly) TArrayling *(^notifiedGo)(NSNotificationName ntf);

#pragma mark - TObjectling
#pragma mark - 增
/**
 * 增量功能的抽象
 * 拼接字符串，添加集合内容，数字的加法，子视图的增加，字典的拼接，子视图的增加
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TArrayling *(^more)(id obj);
/// more()的可变参数版本。
@property (readonly) TArrayling *(^moreN)(id obj1, ...);
/**
 * 增量功能的抽象
 * 拼接字符串，添加集合内容，数字的加法，子视图的增加
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TArrayling *(^moreAt)(id obj1, NSUInteger idx);
/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容
 * 注：如果必要则会潜在的把target或dst提升为可变类型
 */
@property (readonly) TArrayling *(^appendto)(id dst);
/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容的索引处
 * 注：如果必要则会潜在的把target或dst提升为可变类型
 */
@property (readonly) TArrayling *(^appendtoAt)(id dst, NSUInteger idx);

#pragma mark - 删
/**
 * 减量功能的抽象
 * 剪切字符串，减少集合内容，数字的减法，字典内容的移除
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TArrayling *(^less)(id obj);
/// less()的可变参数版本。
@property (readonly) TArrayling *(^lessN)(id obj1, ...);
/**
 * 减量功能的抽象
 * 剪切字符串，减少集合内容，数字的减法
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TArrayling *(^lessAt)(NSUInteger idx);
/**
 * 减量功能的抽象
 * 将对象从其他内容中移除，剪切字符串，减少集合内容，数字的减法
 * 注：如果必要则会潜在的把target或dst提升为可变类型
 */
@property (readonly) TArrayling *(^deleteFrom)(id dst);
/**
 * 减量功能的抽象
 * 集合的清空，字符串的清空
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TArrayling *clean;
/**
 * 减量功能的抽象
 * 指定字段下的集合的清空，字符串的清空，数字的归零，对象的置为nil
 */
@property (readonly) TArrayling *(^kvcClean)(NSString *k, ...);

#pragma mark - 改
/**
 * 替换内容
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TArrayling *(^instead)(id neww, id old);

@property (readonly) TArrayling *(^insteadAt)(id neww, NSUInteger idx);

@property (readonly) TArrayling *(^kvcSet)(id v, NSString *k);

/// 指定字段下的布尔值的反转
@property (readonly) TArrayling *(^kvcToggle)(NSString *k);
/// 当前类型不支持
@property (readonly) TArrayling *(^kvcInit)(NSString *k, ...);

#pragma mark - 查
/// floop(from, to[, TargetType, CODE]) 链上的for循环
@property (readonly) TArrayling *(^floop)(NSInteger from, NSInteger to, id CODE_OBJ_x_INT_i);

@property (readonly) TArrayling *(^floopIN)(NSInteger from, NSInteger to, TlingILoopIN block);

@property (readonly) TArrayling *(^outer)(id _Nullable * _Nullable toPtr);

@property (readonly) TArrayling *(^kvcOuter)(id forObj,NSString *forKey);

@property (readonly) TArrayling *(^kvcGet)(NSString *forKey);

#pragma mark - 控制
/// continuee([TargetType,] CODE)
@property (readonly) TArrayling *(^continuee)(id CODE_OBJ_x);

@property (readonly) TArrayling *(^continueeIN)(TlingConditionIN block);

#pragma mark - 其他
/// description
@property (readonly) TArrayling *log;
/// debug description
@property (readonly) TArrayling *delog;
/// 自定义指定格式的打印 : logFormat(@"...%@...")
@property (readonly) TArrayling *(^logStyled)(NSString *format);
/// copy for taget
@property (readonly) TArrayling *copied;
/// mutable copy for taget
@property (readonly) TArrayling *mCopied;
@end

NS_ASSUME_NONNULL_END
