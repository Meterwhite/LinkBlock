//
//  TPredicateling.h
//  Objcling
//
//  Created by MeterWhite on 2020/9/8.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TObjectling.h"

@class TArrayling;

NS_ASSUME_NONNULL_BEGIN

@protocol TPredicateLetling <NSObject>

@property (readonly) TArrayling *(^select)(id objects);

@end

@interface TPredicateling : TObjectling<TlingLetBranch>

- (TPredicateling<TPredicateLetling>*)let;

@property (readonly) TPredicateling *(^and)(NSPredicate *p);

@property (readonly) TPredicateling *(^not)(NSPredicate *p);

@property (readonly) TPredicateling *(^or)(NSPredicate *p);

@end

#pragma mark - 类型协助

@interface TPredicateling (ObjclingGoing)
#pragma mark - Tling
/// 在用户的闭包中处理通知
@property (nonatomic,readonly) TPredicateling *(^notifiedIN)(NSNotificationName nam, TlingNotifiedIN block);
/// 使用作用到target的谓词控制链条的返回
@property (nonatomic,readonly) TPredicateling *(^stopWhile)(NSPredicate *predicate);
/// 展开链条，允许返回新的链条。
@property (nonatomic,readonly) TPredicateling *(^branchIN)(TlingBranchIN block);
/// 断言
@property (nonatomic,readonly) TPredicateling *(^asserttBy)(NSPredicate *predicate);
/// 断言；在行内判断，如`assertt(x == nil)`。变量x为当前对象，`assertt(Type, x.value > 0)`.
@property (nonatomic,readonly) TPredicateling *(^assertt)(id CODE_TYPE_x);
/// 断言；在闭包中判断
@property (nonatomic,readonly) TPredicateling *(^asserttIN)(TlingConditionIN block);
/// 执行动态链. var x = danamiling.go.get
@property (nonatomic,readonly) TPredicateling *go;
/// 使用指定的对象来执行动态链。
@property (nonatomic,readonly) TPredicateling *(^goBy)(id target);
/// 使用指定的多个对象来执行动态链。
@property (nonatomic,readonly) TPredicateling *(^goBys)(NSArray *targets);
/// 通过通知来触发动态链的执行。
@property (nonatomic,readonly) TPredicateling *(^notifiedGo)(NSNotificationName ntf);
#pragma mark - TObjectling
#pragma mark - 增
/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容，有拼接字符串，添加集合内容，子视图的增加
 */
@property (readonly) TPredicateling *(^appendto)(id dst);
/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容，有拼接字符串，添加集合内容，子视图的增加
 */
@property (readonly) TPredicateling *(^appendtoAt)(id dst, NSUInteger idx);

#pragma mark - 删
/**
 * 减量功能的抽象
 * 将对象从其他内容中移除，剪切字符串，减少集合内容，数字的减法
 */
@property (readonly) TPredicateling *(^deleteFrom)(id dst);
/**
 * 减量功能的抽象
 * 指定字段下的集合的清空，字符串的清空，数字的归零，对象的置为nil
 */
@property (readonly) TPredicateling *(^kvcClean)(NSString *k, ...);
#pragma mark - 查

#define floop(from, to, ...) sub_floop(__VA_ARGS__)
/// floop(from, to[, TargetType, CODE]) 链上的for循环
@property (readonly) TPredicateling *(^floop)(NSInteger from, NSInteger to, id CODE_OBJ_x_INT_i);

@property (readonly) TPredicateling *(^floopIN)(NSInteger from, NSInteger to, TlingILoopIN block);

@property (readonly) TPredicateling *(^outer)(id _Nullable * _Nullable toPtr);

@property (readonly) TPredicateling *(^kvcOuter)(id forObj,NSString *forKey);

#pragma mark - 控制
/// continuee([TargetType,] CODE)
@property (readonly) TPredicateling *(^continuee)(id CODE_OBJ_x);

@property (readonly) TPredicateling *(^continueeIN)(TlingConditionIN block);

#pragma mark - 其他

/// description
@property (readonly) TPredicateling *log;
/// debug description
@property (readonly) TPredicateling *delog;
/// 自定义指定格式的打印 : logFormat(@"...%@...")
@property (readonly) TPredicateling *(^logStyled)(NSString *format);
/// copy for taget
@property (readonly) TPredicateling *copied;
/// mutable copy for taget
@property (readonly) TPredicateling *mCopied;
@end


NS_ASSUME_NONNULL_END
