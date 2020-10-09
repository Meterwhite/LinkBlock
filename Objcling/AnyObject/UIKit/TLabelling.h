//
//  TLabelling.h
//  Objcling
//
//  Created by MeterWhite on 2020/9/8.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TViewling.h"

@class TLabelling;

NS_ASSUME_NONNULL_BEGIN

@protocol TLabeLetlling <NSObject>

@property (readonly) TLabelling *noLimitLines;

@property (readonly) TLabelling *alignmentCenter;

@property (readonly) TLabelling *alignmentRight;

@property (readonly) TLabelling *alignmentLeft;

#pragma mark - View
@property (readonly) TLabelling *userInteractionEnabled;

@property (readonly) TLabelling *userInteractionDisabled;

@property (readonly) TLabelling *hide;

@property (readonly) TLabelling *noHide;

@property (readonly) TLabelling *clip;

@property (readonly) TLabelling *noClip;

@property (readonly) TLabelling *contentScaleToFill;

@property (readonly) TLabelling *contentScaleAspectFit;

@property (readonly) TLabelling *contentScaleAspectFill;

@property (readonly) TLabelling *contentRedraw;

@property (readonly) TLabelling *contentCenter;

@property (readonly) TLabelling *contentTop;

@property (readonly) TLabelling *contentBottom;

@property (readonly) TLabelling *contentLeft;

@property (readonly) TLabelling *contentRight;

@property (readonly) TLabelling *contentTopLeft;

@property (readonly) TLabelling *contentTopRight;

@property (readonly) TLabelling *contentBottomLeft;

@property (readonly) TLabelling *contentBottomRight;

@property (readonly) TLabelling *sendBack;

@property (readonly) TLabelling *bringFront;

@property (readonly) TLabelling *snapshot;

@property (readonly) TLabelling *forceEndEditing;

@property (readonly) TLabelling *removeConstraints;

@end

@interface TLabelling : TViewling

- (TLabelling<TLabeLetlling> *)let;

@property (readonly) TLabelling *(^lines)(NSInteger count);

@property (readonly) TLabelling *(^attributedText)(NSAttributedString *s);

@property (readonly) TLabelling *(^alignment)(NSTextAlignment ali);

@end

#pragma mark - 类型协助

@interface TLabelling (ObjclingGoing)
#pragma mark - Tling
/// 在用户的闭包中处理通知
@property (nonatomic,readonly) TImageViewling *(^notifiedIN)(NSNotificationName nam, TlingNotifiedIN block);
/// 使用作用到target的谓词控制链条的返回
@property (nonatomic,readonly) TImageViewling *(^stopWhile)(NSPredicate *predicate);
/// 展开链条，允许返回新的链条。
@property (nonatomic,readonly) TImageViewling *(^branchIN)(TlingBranchIN block);
/// 断言
@property (nonatomic,readonly) TImageViewling *(^asserttBy)(NSPredicate *predicate);
/// 断言；在行内判断，如`assertt(x == nil)`。变量x为当前对象，`assertt(Type, x.value > 0)`.
@property (nonatomic,readonly) TImageViewling *(^assertt)(id CODE_TYPE_x);
/// 断言；在闭包中判断
@property (nonatomic,readonly) TImageViewling *(^asserttIN)(TlingConditionIN block);
/// 执行动态链. var x = danamiling.go.get
@property (nonatomic,readonly) TImageViewling *go;
/// 使用指定的对象来执行动态链。
@property (nonatomic,readonly) TImageViewling *(^goBy)(id target);
/// 使用指定的多个对象来执行动态链。
@property (nonatomic,readonly) TImageViewling *(^goBys)(NSArray *targets);
/// 通过通知来触发动态链的执行。
@property (nonatomic,readonly) TImageViewling *(^notifiedGo)(NSNotificationName ntf);

#pragma mark - TObjectling
#pragma mark - 增
/**
 * 增量功能的抽象
 * 拼接字符串，添加集合内容，数字的加法，子视图的增加，字典的拼接
 * 注：如有必要会将target提升为可变类型
 */
@property (readonly) TImageViewling *(^more)(id obj);

/// more()的可变参数版本。
@property (readonly) TImageViewling *(^moreN)(id obj1, ...);
/**
 * 增量功能的抽象
 * 拼接字符串，添加集合内容，数字的加法，子视图的增加
 * 注：如有必要会将target提升为可变类型
 */
@property (readonly) TImageViewling *(^moreAt)(id obj1, NSUInteger idx);
/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容，有拼接字符串，添加集合内容，子视图的增加
 */
@property (readonly) TImageViewling *(^appendto)(id dst);
/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容，有拼接字符串，添加集合内容，子视图的增加
 */
@property (readonly) TImageViewling *(^appendtoAt)(id dst, NSUInteger idx);

#pragma mark - 删
/**
 * 减量功能的抽象
 * 剪切字符串，减少集合内容，数字的减法，字典内容的移除（传key）
 * 注：如有必要会将target提升为可变类型
 */
@property (readonly) TImageViewling *(^less)(id obj);

/// less()的可变参数版本。
@property (readonly) TImageViewling *(^lessN)(id obj1, ...) ;
/**
 * 减量功能的抽象
 * 修改字符串，减少集合内容，视图的移除
 * 注：如有必要会将target提升为可变类型
 */
@property (readonly) TImageViewling *(^lessAt)(NSUInteger idx);
/**
 * 减量功能的抽象
 * 从其他内容中移除改对象；修改字符串，移除集合内容，移除视图
 */
@property (readonly) TImageViewling *(^deleteFrom)(id dst);
/**
 * 减量功能的抽象
 * 集合的清空，字符串的清空
 * 注：如有必要会将target提升为可变类型
 */
@property (readonly) TImageViewling *clean;

/**
 * 减量功能的抽象
 * 指定字段下的集合的清空，字符串的清空，数字的归零，对象的置为nil
 */
@property (readonly) TImageViewling *(^kvcClean)(NSString *k, ...);

#pragma mark - 改
/**
 * 替换内容
 * 注：如有必要会将target提升为可变类型
 */
@property (readonly) TImageViewling *(^instead)(id neww, id old);

@property (readonly) TImageViewling *(^insteadAt)(id neww, NSUInteger idx);

@property (readonly) TImageViewling *(^kvcSet)(id v, NSString *k);

/// 指定字段下的布尔值的反转
@property (readonly) TImageViewling *(^kvcToggle)(NSString *k);

/**
 * 指定字段下的对象的懒惰初始化，如果字段不为nil则不进行初始化
 */
@property (readonly) TImageViewling *(^kvcInit)(NSString *k, ...);
#pragma mark - 查

/// floop(from, to[, TargetType, CODE]) 链上的for循环
@property (readonly) TImageViewling *(^floop)(NSInteger from, NSInteger to, id CODE_OBJ_x_INT_i);

@property (readonly) TImageViewling *(^floopIN)(NSInteger from, NSInteger to, TlingILoopIN block);

@property (readonly) TImageViewling *(^outer)(id _Nullable * _Nullable toPtr);

@property (readonly) TImageViewling *(^kvcOuter)(id forObj,NSString *forKey);

@property (readonly) TImageViewling *(^kvcGet)(NSString *forKey);

#pragma mark - 控制
/// continuee([TargetType,] CODE)
@property (readonly) TImageViewling *(^continuee)(id CODE_OBJ_x);

@property (readonly) TImageViewling *(^continueeIN)(TlingConditionIN block);

#pragma mark - 其他

/// description
@property (readonly) TImageViewling *log;
/// debug description
@property (readonly) TImageViewling *delog;
/// 自定义指定格式的打印 : logFormat(@"...%@...")
@property (readonly) TImageViewling *(^logStyled)(NSString *format);
/// copy for taget
@property (readonly) TImageViewling *copied;
/// mutable copy for taget
@property (readonly) TImageViewling *mCopied;
@end

NS_ASSUME_NONNULL_END
