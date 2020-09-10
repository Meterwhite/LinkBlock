//
//  TlingObj.h
//  Objcling
//
//  Created by meterwhite on 2020/8/15.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "LingDefines.h"
#import "Tling.h"

@class TStringling, TNumberling;

NS_ASSUME_NONNULL_BEGIN

@interface TObjectling : Tling
#pragma mark - 增
/**
 * 增量功能的抽象
 * 拼接字符串，添加集合内容，数字的加法，字典的拼接
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TObjectling *(^more)(id obj);

#define moreN(...) moreN(__VA_ARGS__,nil)
/// more()的可变参数版本。
@property (readonly) TObjectling *(^moreN)(id obj1, ...) ;
/**
 * 增量功能的抽象
 * 拼接字符串，添加集合内容，数字的加法
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TObjectling *(^moreAt)(id obj1, NSUInteger idx);
/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容
 * 注：如果必要则会潜在的把target或content提升为可变类型
 */
@property (readonly) TObjectling *(^appendto)(id content);
/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容的索引处
 * 注：如果必要则会潜在的把target或content提升为可变类型
 */
@property (readonly) TObjectling *(^appendtoAt)(id obj, NSUInteger idx);

#pragma mark - 删
/**
 * 减量功能的抽象
 * 剪切字符串，减少集合内容，数字的减法，字典内容的移除
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TObjectling *(^less)(id obj);

#define lessN(...) lessN(__VA_ARGS__, nil)
/// less()的可变参数版本。
@property (readonly) TObjectling *(^lessN)(id obj1, ...) ;
/**
 * 减量功能的抽象
 * 剪切字符串，减少集合内容，数字的减法
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TObjectling *(^lessAt)(NSUInteger idx);
/**
 * 减量功能的抽象
 * 将对象从其他内容中移除，剪切字符串，减少集合内容，数字的减法
 * 注：如果必要则会潜在的把target或content提升为可变类型
 */
@property (readonly) TObjectling *(^deleteFrom)(id content);
/**
 * 减量功能的抽象
 * 集合的清空，字符串的清空
 */
@property (readonly) TObjectling *clean;

#define kvcClean(...) kvcClean(__VA_ARGS__, nil)
/**
 * 减量功能的抽象
 * 指定字段下的集合的清空，字符串的清空，数字的归零，对象的置为nil
 */
@property (readonly) TObjectling *(^kvcClean)(NSString *k, ...);

#pragma mark - 改
/**
 * 替换内容
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TObjectling *(^instead)(id neww, id old);

@property (readonly) TObjectling *(^insteadAt)(id neww, NSUInteger idx);

@property (readonly) TObjectling *(^kvcSet)(id v, NSString *k);

#define kvcToggle(...) kvcToggle(__VA_ARGS__, nil)
/// 指定字段下的布尔值的反转
@property (readonly) TObjectling *(^kvcToggle)(NSString *k);

#define kvcInit(...) kvcInit(__VA_ARGS__, nil)
/**
 * 指定字段下的对象的懒惰初始化，如果字段不为nil则不进行初始化
 */
@property (readonly) TObjectling *(^kvcInit)(NSString *k, ...);
#pragma mark - 查

#define floop(from, to, ...) sub_floop(__VA_ARGS__)
/// floop(from, to[, TargetType, CODE]) 链上的for循环
@property (readonly) TObjectling *(^floop)(NSInteger from, NSInteger to, id CODE_OBJ_x_INT_i);

@property (readonly) TObjectling *(^floopIN)(NSInteger from, NSInteger to, TlingILoopIN block);

@property (readonly) TObjectling *(^outer)(id _Nullable * _Nullable toPtr);

@property (readonly) TObjectling *(^kvcOuter)(NSString *forKey);

@property (readonly) TObjectling *(^kvcGet)(NSString *forKey);

#pragma mark - 控制
#define continuee(...) sub_continuee(__VA_ARGS__)
/// continuee([TargetType,] CODE)
@property (readonly) TObjectling *(^continuee)(id CODE_OBJ_x);

@property (readonly) TObjectling *(^continueeIN)(TlingConditionIN block);

#pragma mark - 其他

/// description
@property (readonly) TObjectling *log;
/// debug description
@property (readonly) TObjectling *delog;
/// 自定义指定格式的打印 : logFormat(@"...%@...")
@property (readonly) TObjectling *(^logStyled)(NSString *format);
/// copy for taget
@property (readonly) TObjectling *copied;
/// mutable copy for taget
@property (readonly) TObjectling *mCopied;

#pragma mark - 转换
/// 转为字符串形式
@property (readonly) TStringling *asString;
/// 转为数字形式
@property (readonly) TNumberling *asNumber;
/// 长度
@property (readonly) TNumberling *length;
/// 总数
@property (readonly) TNumberling *count;

@property (readonly) TNumberling *(^euqal)(id obj);

@property (readonly) TNumberling *(^notEuqal)(id obj);
/// a && b && c
@property (readonly) TNumberling *(^equalEach)(id obj, ...);
/// !a && !b && !c
@property (readonly) TNumberling *(^equalNoOne)(id obj, ...);
/// a || b || c
@property (readonly) TNumberling *(^equalAnyone)(id obj, ...);

@end

#pragma mark - 类型协助

@interface TObjectling (ObjclingGoing)
#pragma mark - Tling
/// 在用户的闭包中处理通知
@property (nonatomic,readonly) TObjectling *(^notifiedIN)(NSNotificationName nam, TlingNotifiedIN block);
/// 使用作用到target的谓词控制链条的返回
@property (nonatomic,readonly) TObjectling *(^stopWhile)(NSPredicate *predicate);
/// 展开链条，允许返回新的链条。
@property (nonatomic,readonly) TObjectling *(^branchIN)(TlingBranchIN block);
/// 断言
@property (nonatomic,readonly) TObjectling *(^asserttBy)(NSPredicate *predicate);
/// 断言；在行内判断，如`assertt(x == nil)`。变量x为当前对象，`assertt(Type, x.value > 0)`.
@property (nonatomic,readonly) TObjectling *(^assertt)(id CODE_TYPE_x);
/// 断言；在闭包中判断
@property (nonatomic,readonly) TObjectling *(^asserttIN)(TlingConditionIN block);
/// 执行动态链. var x = danamiling.go.get
@property (nonatomic,readonly) TObjectling *go;
/// 使用指定的对象来执行动态链。
@property (nonatomic,readonly) TObjectling *(^goBy)(id target);
/// 使用指定的多个对象来执行动态链。
@property (nonatomic,readonly) TObjectling *(^goBys)(NSArray *targets);
/// 通过通知来触发动态链的执行。
@property (nonatomic,readonly) TObjectling *(^notifiedGo)(NSNotificationName ntf);

@end

NS_ASSUME_NONNULL_END
