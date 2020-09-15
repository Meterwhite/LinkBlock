//
//  TURLling.h
//  Objcling
//
//  Created by MeterWhite on 2020/9/8.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TObjectling.h"

@class TStringling;

NS_ASSUME_NONNULL_BEGIN

@interface TURLling : TObjectling

#pragma mark - 增
@property (readonly) TURLling *(^appendPathComponent)(NSString *s);

@property (readonly) TURLling *(^appendDirectoryComponent)(NSString *s);

@property (readonly) TURLling *(^appendPathExtension)(NSString *s);
#pragma mark - 删
@property (readonly) TURLling *deleteLastPathComponent;
#pragma mark - 改

#pragma mark - 查
@property (readonly) TStringling *absoluteString;

#pragma mark - 转
@property (readonly) TStringling *lastPathComponent;

@property (readonly) TStringling *pathExtension;

@end

@interface TURLling (ObjclingGoing)

#pragma mark - Tling
/// 在用户的闭包中处理通知
@property (nonatomic,readonly) TURLling *(^notifiedIN)(NSNotificationName nam, TlingNotifiedIN block);
/// 使用作用到target的谓词控制链条的返回
@property (nonatomic,readonly) TURLling *(^stopWhile)(NSPredicate *predicate);
/// 展开链条，允许返回新的链条。
@property (nonatomic,readonly) TURLling *(^branchIN)(TlingBranchIN block);
/// 断言
@property (nonatomic,readonly) TURLling *(^asserttBy)(NSPredicate *predicate);
/// 断言；在行内判断，如`assertt(x == nil)`。变量x为当前对象，`assertt(Type, x.value > 0)`.
@property (nonatomic,readonly) TURLling *(^assertt)(id CODE_TYPE_x);
/// 断言；在闭包中判断
@property (nonatomic,readonly) TURLling *(^asserttIN)(TlingConditionIN block);
/// 执行动态链. var x = danamiling.go.get
@property (nonatomic,readonly) TURLling *go;
/// 使用指定的对象来执行动态链。
@property (nonatomic,readonly) TURLling *(^goBy)(id target);
/// 使用指定的多个对象来执行动态链。
@property (nonatomic,readonly) TURLling *(^goBys)(NSArray *targets);
/// 通过通知来触发动态链的执行。
@property (nonatomic,readonly) TURLling *(^notifiedGo)(NSNotificationName ntf);

#pragma mark - TObjectling
#pragma mark - 增
/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容，有拼接字符串，添加集合内容，子视图的增加
 */
@property (readonly) TURLling *(^appendto)(id dst);
/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容，有拼接字符串，添加集合内容，子视图的增加
 */
@property (readonly) TURLling *(^appendtoAt)(id dst, NSUInteger idx);

#pragma mark - 删
/**
 * 减量功能的抽象
 * 从其他内容中移除改对象；修改字符串，移除集合内容，移除视图
 */
@property (readonly) TURLling *(^deleteFrom)(id dst);
/**
 * 减量功能的抽象
 * 指定字段下的集合的清空，字符串的清空，数字的归零，对象的置为nil
 */
@property (readonly) TURLling *(^kvcClean)(NSString *k, ...);

#pragma mark - 改
@property (readonly) TURLling *(^kvcSet)(id v, NSString *k);

/// 指定字段下的布尔值的反转
@property (readonly) TURLling *(^kvcToggle)(NSString *k);

/**
 * 指定字段下的对象的懒惰初始化，如果字段不为nil则不进行初始化
 */
@property (readonly) TURLling *(^kvcInit)(NSString *k, ...);
#pragma mark - 查

/// floop(from, to[, TargetType, CODE]) 链上的for循环
@property (readonly) TURLling *(^floop)(NSInteger from, NSInteger to, id CODE_OBJ_x_INT_i);

@property (readonly) TURLling *(^floopIN)(NSInteger from, NSInteger to, TlingILoopIN block);

@property (readonly) TURLling *(^outer)(id _Nullable * _Nullable toPtr);

@property (readonly) TURLling *(^kvcOuter)(id forObj,NSString *forKey);

@property (readonly) TURLling *(^kvcGet)(NSString *forKey);

#pragma mark - 控制
/// continuee([TargetType,] CODE)
@property (readonly) TURLling *(^continuee)(id CODE_OBJ_x);

@property (readonly) TURLling *(^continueeIN)(TlingConditionIN block);

#pragma mark - 其他

/// description
@property (readonly) TURLling *log;
/// debug description
@property (readonly) TURLling *delog;
/// 自定义指定格式的打印 : logFormat(@"...%@...")
@property (readonly) TURLling *(^logStyled)(NSString *format);
/// copy for taget
@property (readonly) TURLling *copied;
/// mutable copy for taget
@property (readonly) TURLling *mCopied;

@end

NS_ASSUME_NONNULL_END
