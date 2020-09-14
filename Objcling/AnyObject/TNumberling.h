//
//  TNumberling.h
//  Objcling
//
//  Created by meterwhite on 2020/8/22.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TValueling.h"

NS_ASSUME_NONNULL_BEGIN

@interface TNumberling : TValueling

@property (readonly) TNumberling *(^adding)(id n);

@property (readonly) TNumberling *(^subtracting)(id n);

@property (readonly) TNumberling *(^multiplying)(id n);

@property (readonly) TNumberling *(^dividing)(id n);

@property (readonly) TNumberling *(^greatThan)(id n);

@property (readonly) TNumberling *(^greatEqual)(id n);

@property (readonly) TNumberling *(^lessThan)(id n);

@property (readonly) TNumberling *(^lessEqual)(id n);

@property (readonly) TNumberling *(^forLoopIN)(TlingLoopForIN block);

@property (readonly) TNumberling *is0;

@property (readonly) TNumberling *isNaN;
/// 相反数
@property (readonly) TNumberling *opposite;

@end

#pragma mark - 类型协助
@interface TNumberling (ObjclingGoing)

#pragma mark - Tling
/// 在用户的闭包中处理通知
@property (nonatomic,readonly) TNumberling *(^notifiedIN)(NSNotificationName nam, TlingNotifiedIN block);
/// 使用作用到target的谓词控制链条的返回
@property (nonatomic,readonly) TNumberling *(^stopWhile)(NSPredicate *predicate);
/// 展开链条，允许返回新的链条。
@property (nonatomic,readonly) TNumberling *(^branchIN)(TlingBranchIN block);
/// 断言
@property (nonatomic,readonly) TNumberling *(^asserttBy)(NSPredicate *predicate);
/// 断言；在行内判断，如`assertt(x == nil)`。变量x为当前对象，`assertt(Type, x.value > 0)`.
@property (nonatomic,readonly) TNumberling *(^assertt)(id CODE_TYPE_x);
/// 断言；在闭包中判断
@property (nonatomic,readonly) TNumberling *(^asserttIN)(TlingConditionIN block);
/// 执行动态链. var x = danamiling.go.get
@property (nonatomic,readonly) TNumberling *go;
/// 使用指定的对象来执行动态链。
@property (nonatomic,readonly) TNumberling *(^goBy)(id target);
/// 使用指定的多个对象来执行动态链。
@property (nonatomic,readonly) TNumberling *(^goBys)(NSArray *targets);
/// 通过通知来触发动态链的执行。
@property (nonatomic,readonly) TNumberling *(^notifiedGo)(NSNotificationName ntf);
#pragma mark - TObjectling
#pragma mark - 增
/**
 * 增量功能的抽象
 * 数字的加法
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TNumberling *(^more)(id obj);

/// more()的可变参数版本。
@property (readonly) TNumberling *(^moreN)(id obj1, ...);

/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容，有拼接字符串，添加集合内容，子视图的增加
 */
@property (readonly) TNumberling *(^appendto)(id dst);
/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容，有拼接字符串，添加集合内容，子视图的增加
 */
@property (readonly) TNumberling *(^appendtoAt)(id dst, NSUInteger idx);

#pragma mark - 删
/**
 * 减量功能的抽象
 * 剪切字符串，减少集合内容，数字的减法，字典内容的移除
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TNumberling *(^less)(id n);

@property (readonly) TNumberling *(^lessN)(id n1, ...) ;
/**
 * 减量功能的抽象
 * 将对象从其他内容中移除，剪切字符串，减少集合内容，数字的减法
 */
@property (readonly) TNumberling *(^deleteFrom)(id dst);
/**
 * 减量功能的抽象
 * 指定字段下的集合的清空，字符串的清空，数字的归零，对象的置为nil
 */
@property (readonly) TNumberling *(^kvcClean)(NSString *k, ...);

#pragma mark - 查
/// floop(from, to[, TargetType, CODE]) 链上的for循环
@property (readonly) TNumberling *(^floop)(NSInteger from, NSInteger to, id CODE_OBJ_x_INT_i);

@property (readonly) TNumberling *(^floopIN)(NSInteger from, NSInteger to, TlingILoopIN block);

@property (readonly) TNumberling *(^outer)(id _Nullable * _Nullable toPtr);

@property (readonly) TNumberling *(^kvcOuter)(id forObj,NSString *forKey);

@property (readonly) TObjectling *(^kvcGet)(NSString *forKey);
#pragma mark - 控制
/// continuee([TargetType,] CODE)
@property (readonly) TNumberling *(^continuee)(id CODE_OBJ_x);

@property (readonly) TNumberling *(^continueeIN)(TlingConditionIN block);

#pragma mark - 其他

/// description
@property (readonly) TNumberling *log;
/// debug description
@property (readonly) TNumberling *delog;
/// 自定义指定格式的打印 : logFormat(@"...%@...")
@property (readonly) TNumberling *(^logStyled)(NSString *format);
/// copy for taget
@property (readonly) TNumberling *copied;
/// mutable copy for taget
@property (readonly) TNumberling *mCopied;
@end

NS_ASSUME_NONNULL_END
