//
//  TViewling.h
//  Objcling
//
//  Created by meterwhite on 2020/8/25.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TObjectling.h"

@class TViewling, TValueling, TImageViewling;

NS_ASSUME_NONNULL_BEGIN

@protocol TViewLetling <NSObject>
@property (readonly) TViewling *userInteractionEnabled;
@property (readonly) TViewling *userInteractionDisabled;
@property (readonly) TViewling *hide;
@property (readonly) TViewling *noHide;
@property (readonly) TViewling *clip;
@property (readonly) TViewling *noClip;
@property (readonly) TViewling *contentScaleToFill;
@property (readonly) TViewling *contentScaleAspectFit;
@property (readonly) TViewling *contentScaleAspectFill;
@property (readonly) TViewling *contentRedraw;
@property (readonly) TViewling *contentCenter;
@property (readonly) TViewling *contentTop;
@property (readonly) TViewling *contentBottom;
@property (readonly) TViewling *contentLeft;
@property (readonly) TViewling *contentRight;
@property (readonly) TViewling *contentTopLeft;
@property (readonly) TViewling *contentTopRight;
@property (readonly) TViewling *contentBottomLeft;
@property (readonly) TViewling *contentBottomRight;
@property (readonly) TViewling *sendBack;
@property (readonly) TViewling *bringFront;
@property (readonly) TViewling *snapshot;
@property (readonly) TViewling *forceEndEditing;
@property (readonly) TViewling *removeConstraints;
@end

@interface TViewling : TObjectling

- (TViewling<TViewLetling> *)let;

#pragma mark - 增
@property (readonly) TViewling *(^insertto)(UIView *v);
@property (readonly) TViewling *(^addSubview)(UIView *v);
#pragma mark - 删
@property (readonly) TViewling *(^remove)(UIView *v);
@property (readonly) TViewling *removed;
@property (readonly) TViewling *removeSubviews;
#pragma mark - 改
@property (readonly) TViewling *(^text)(NSString *txt);
@property (readonly) TViewling *(^color)(UIColor *color);
@property (readonly) TViewling *(^font)(UIFont *font);
@property (readonly) TImageViewling*(^imagedWith)(NSString *name);
@property (readonly) TViewling *(^bgcolor)(UIColor *color);
@property (readonly) TViewling *(^frame)(CGFloat x,CGFloat y,CGFloat w,CGFloat h);
@property (readonly) TViewling *(^origin)(CGFloat x,CGFloat y);
@property (readonly) TViewling *(^center)(CGFloat x,CGFloat y);
@property (readonly) TViewling *(^size)(CGFloat w,CGFloat h);
@property (readonly) TViewling *(^x)(CGFloat x);
@property (readonly) TViewling *(^y)(CGFloat y);
@property (readonly) TViewling *(^width)(CGFloat w);
@property (readonly) TViewling *(^height)(CGFloat h);
@property (readonly) TViewling *(^alpha)(CGFloat a);
@property (readonly) TViewling *(^opaque)(CGFloat oq);
@property (readonly) TViewling *(^userInteraction)(bool enabled);
@property (readonly) TViewling *(^clips)(bool b);
@property (readonly) TViewling *(^corner)(CGFloat radius);
@property (readonly) TViewling *(^contentMode)(UIViewContentMode mode);

@property (readonly) TValueling *theFrame;
@property (readonly) TValueling *theBound;
@property (readonly) TValueling *theCenter;

@property (readonly) TViewling *theConstraintWidth;
@property (readonly) TViewling *theConstraintHeight;
@property (readonly) TViewling *theConstraintTop;
@property (readonly) TViewling *theConstraintBottom;
@property (readonly) TViewling *theConstraintLeading;
@property (readonly) TViewling *theConstraintTrailing;
@property (readonly) TViewling *theConstraintLeft;
@property (readonly) TViewling *theConstraintRight;
@property (readonly) TViewling *theConstraintLeftOrLeading;
@property (readonly) TViewling *theConstraintRightOrTrailing;
@property (readonly) TViewling *theConstraintCenterX;
@property (readonly) TViewling *theConstraintCenterY;
@property (readonly) TViewling *theConstraintBaseline;
@property (readonly) TViewling *theConstraintLastBaseline;
@property (readonly) TViewling *theConstraintFirstBaseline;

@property (readonly) TViewling *(^constraintWidth)(CGFloat f);
@property (readonly) TViewling *(^constraintHeight)(CGFloat f);
@property (readonly) TViewling *(^constraintTop)(CGFloat f);
@property (readonly) TViewling *(^constraintBottom)(CGFloat f);
@property (readonly) TViewling *(^constraintLeading)(CGFloat f);
@property (readonly) TViewling *(^constraintTrailing)(CGFloat f);
@property (readonly) TViewling *(^constraintLeft)(CGFloat f);
@property (readonly) TViewling *(^constraintRight)(CGFloat f);
@property (readonly) TViewling *(^constraintLeftOrLeading)(CGFloat f);
@property (readonly) TViewling *(^constraintRightOrTrailing)(CGFloat f);
@property (readonly) TViewling *(^constraintCenterX)(CGFloat f);
@property (readonly) TViewling *(^constraintCenterY)(CGFloat f);
@property (readonly) TViewling *(^constraintBaseline)(CGFloat f);
@property (readonly) TViewling *(^constraintLastBaseline)(CGFloat f);
@property (readonly) TViewling *(^constraintFirstBaseline)(CGFloat f);



#pragma mark - 查
@property (readonly) TViewling *isHidden;

@end

#pragma mark - 类型协助

@interface TViewling (ObjclingGoing)
#pragma mark - Tling
/// 在用户的闭包中处理通知
@property (nonatomic,readonly) TViewling *(^notifiedIN)(NSNotificationName nam, TlingNotifiedIN block);
/// 使用作用到target的谓词控制链条的返回
@property (nonatomic,readonly) TViewling *(^stopWhile)(NSPredicate *predicate);
/// 展开链条，允许返回新的链条。
@property (nonatomic,readonly) TViewling *(^branchIN)(TlingBranchIN block);
/// 断言
@property (nonatomic,readonly) TViewling *(^asserttBy)(NSPredicate *predicate);
/// 断言；在行内判断，如`assertt(x == nil)`。变量x为当前对象，`assertt(Type, x.value > 0)`.
@property (nonatomic,readonly) TViewling *(^assertt)(id CODE_TYPE_x);
/// 断言；在闭包中判断
@property (nonatomic,readonly) TViewling *(^asserttIN)(TlingConditionIN block);
/// 执行动态链. var x = danamiling.go.get
@property (nonatomic,readonly) TViewling *go;
/// 使用指定的对象来执行动态链。
@property (nonatomic,readonly) TViewling *(^goBy)(id target);
/// 使用指定的多个对象来执行动态链。
@property (nonatomic,readonly) TViewling *(^goBys)(NSArray *targets);
/// 通过通知来触发动态链的执行。
@property (nonatomic,readonly) TViewling *(^notifiedGo)(NSNotificationName ntf);

#pragma mark - TObjectling
#pragma mark - 增
/**
 * 增量功能的抽象
 * 拼接字符串，添加集合内容，数字的加法，子视图的增加，字典的拼接，子视图的增加
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TViewling *(^more)(id obj);

/// more()的可变参数版本。
@property (readonly) TViewling *(^moreN)(id obj1, ...);
/**
 * 增量功能的抽象
 * 拼接字符串，添加集合内容，数字的加法，子视图的增加
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TViewling *(^moreAt)(id obj1, NSUInteger idx);
/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容
 * 注：如果必要则会潜在的把target或dst提升为可变类型
 */
@property (readonly) TViewling *(^appendto)(id dst);
/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容的索引处
 * 注：如果必要则会潜在的把target或dst提升为可变类型
 */
@property (readonly) TViewling *(^appendtoAt)(id dst, NSUInteger idx);

#pragma mark - 删
/**
 * 减量功能的抽象
 * 剪切字符串，减少集合内容，数字的减法，字典内容的移除
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TViewling *(^less)(id obj);

/// less()的可变参数版本。
@property (readonly) TViewling *(^lessN)(id obj1, ...) ;
/**
 * 减量功能的抽象
 * 剪切字符串，减少集合内容，数字的减法
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TViewling *(^lessAt)(NSUInteger idx);
/**
 * 减量功能的抽象
 * 将对象从其他内容中移除，剪切字符串，减少集合内容，数字的减法
 * 注：如果必要则会潜在的把target或dst提升为可变类型
 */
@property (readonly) TViewling *(^deleteFrom)(id dst);
/**
 * 减量功能的抽象
 * 集合的清空，字符串的清空
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TViewling *clean;

/**
 * 减量功能的抽象
 * 指定字段下的集合的清空，字符串的清空，数字的归零，对象的置为nil
 */
@property (readonly) TViewling *(^kvcClean)(NSString *k, ...);

#pragma mark - 改
/**
 * 替换内容
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TViewling *(^instead)(id neww, id old);

@property (readonly) TViewling *(^insteadAt)(id neww, NSUInteger idx);

@property (readonly) TViewling *(^kvcSet)(id v, NSString *k);

/// 指定字段下的布尔值的反转
@property (readonly) TViewling *(^kvcToggle)(NSString *k);

/**
 * 指定字段下的对象的懒惰初始化，如果字段不为nil则不进行初始化
 */
@property (readonly) TViewling *(^kvcInit)(NSString *k, ...);
#pragma mark - 查

/// floop(from, to[, TargetType, CODE]) 链上的for循环
@property (readonly) TViewling *(^floop)(NSInteger from, NSInteger to, id CODE_OBJ_x_INT_i);

@property (readonly) TViewling *(^floopIN)(NSInteger from, NSInteger to, TlingILoopIN block);

@property (readonly) TViewling *(^outer)(id _Nullable * _Nullable toPtr);

@property (readonly) TViewling *(^kvcOuter)(id forObj,NSString *forKey);

@property (readonly) TViewling *(^kvcGet)(NSString *forKey);

#pragma mark - 控制
/// continuee([TargetType,] CODE)
@property (readonly) TViewling *(^continuee)(id CODE_OBJ_x);

@property (readonly) TViewling *(^continueeIN)(TlingConditionIN block);

#pragma mark - 其他

/// description
@property (readonly) TViewling *log;
/// debug description
@property (readonly) TViewling *delog;
/// 自定义指定格式的打印 : logFormat(@"...%@...")
@property (readonly) TViewling *(^logStyled)(NSString *format);
/// copy for taget
@property (readonly) TViewling *copied;
/// mutable copy for taget
@property (readonly) TViewling *mCopied;
@end

NS_ASSUME_NONNULL_END
