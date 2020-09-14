//
//  TButtonling.h
//  Objcling
//
//  Created by meterwhite on 2020/8/26.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TViewling.h"

NS_ASSUME_NONNULL_BEGIN


@interface TButtonling : TViewling

@property (readonly) TButtonling *(^textNormal)(NSString *txt);

@property (readonly) TButtonling *(^textHighlighted)(NSString *txt);

@property (readonly) TButtonling *(^textDisabled)(NSString *txt);

@property (readonly) TButtonling *(^textSelected)(NSString *txt);

@property (readonly) TButtonling *(^textFocused)(NSString *txt);

@property (readonly) TButtonling *(^textApplication)(NSString *txt);

@property (readonly) TButtonling *(^textReserved)(NSString *txt);

@property (readonly) TButtonling *(^textColortNormal)(NSString *txt);

@property (readonly) TButtonling *(^textColortHighlighted)(NSString *txt);

@property (readonly) TButtonling *(^textColortDisabled)(NSString *txt);

@property (readonly) TButtonling *(^textColortSelected)(NSString *txt);

@property (readonly) TButtonling *(^textColortFocused)(NSString *txt);

@property (readonly) TButtonling *(^textColortApplication)(NSString *txt);

@property (readonly) TButtonling *(^textColortReserved)(NSString *txt);

@property (readonly) TButtonling *(^imageNormal)(NSString *txt);

@property (readonly) TButtonling *(^imageHighlighted)(NSString *txt);

@property (readonly) TButtonling *(^imageDisabled)(NSString *txt);

@property (readonly) TButtonling *(^imageSelected)(NSString *txt);

@property (readonly) TButtonling *(^imageFocused)(NSString *txt);

@property (readonly) TButtonling *(^imageApplication)(NSString *txt);

@property (readonly) TButtonling *(^imageReserved)(NSString *txt);

@property (readonly) TButtonling *(^bgimageNormal)(NSString *txt);

@property (readonly) TButtonling *(^bgimageHighlighted)(NSString *txt);

@property (readonly) TButtonling *(^bgimageDisabled)(NSString *txt);

@property (readonly) TButtonling *(^bgimageSelected)(NSString *txt);

@property (readonly) TButtonling *(^bgimageFocused)(NSString *txt);

@property (readonly) TButtonling *(^bgimageApplication)(NSString *txt);

@property (readonly) TButtonling *(^bgimageReserved)(NSString *txt);

@end

#pragma mark - 类型协助

@interface TButtonling (ObjclingGoing)
#pragma mark - Tling
/// 在用户的闭包中处理通知
@property (nonatomic,readonly) TButtonling *(^notifiedIN)(NSNotificationName nam, TlingNotifiedIN block);
/// 使用作用到target的谓词控制链条的返回
@property (nonatomic,readonly) TButtonling *(^stopWhile)(NSPredicate *predicate);
/// 展开链条，允许返回新的链条。
@property (nonatomic,readonly) TButtonling *(^branchIN)(TlingBranchIN block);
/// 断言
@property (nonatomic,readonly) TButtonling *(^asserttBy)(NSPredicate *predicate);
/// 断言；在行内判断，如`assertt(x == nil)`。变量x为当前对象，`assertt(Type, x.value > 0)`.
@property (nonatomic,readonly) TButtonling *(^assertt)(id CODE_TYPE_x);
/// 断言；在闭包中判断
@property (nonatomic,readonly) TButtonling *(^asserttIN)(TlingConditionIN block);
/// 执行动态链. var x = danamiling.go.get
@property (nonatomic,readonly) TButtonling *go;
/// 使用指定的对象来执行动态链。
@property (nonatomic,readonly) TButtonling *(^goBy)(id target);
/// 使用指定的多个对象来执行动态链。
@property (nonatomic,readonly) TButtonling *(^goBys)(NSArray *targets);
/// 通过通知来触发动态链的执行。
@property (nonatomic,readonly) TButtonling *(^notifiedGo)(NSNotificationName ntf);

#pragma mark - TObjectling
#pragma mark - 增
/**
 * 增量功能的抽象
 * 拼接字符串，添加集合内容，数字的加法，子视图的增加，字典的拼接
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TButtonling *(^more)(id obj);

/// more()的可变参数版本。
@property (readonly) TButtonling *(^moreN)(id obj1, ...);
/**
 * 增量功能的抽象
 * 拼接字符串，添加集合内容，数字的加法，子视图的增加
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TButtonling *(^moreAt)(id obj1, NSUInteger idx);
/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容，有拼接字符串，添加集合内容，子视图的增加
 */
@property (readonly) TButtonling *(^appendto)(id dst);
/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容，有拼接字符串，添加集合内容，子视图的增加
 */
@property (readonly) TButtonling *(^appendtoAt)(id dst, NSUInteger idx);

#pragma mark - 删
/**
 * 减量功能的抽象
 * 剪切字符串，减少集合内容，数字的减法，字典内容的移除（传key）
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TButtonling *(^less)(id obj);

/// less()的可变参数版本。
@property (readonly) TButtonling *(^lessN)(id obj1, ...) ;
/**
 * 减量功能的抽象
 * 剪切字符串，减少集合内容，数字的减法
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TButtonling *(^lessAt)(NSUInteger idx);
/**
 * 减量功能的抽象
 * 将对象从其他内容中移除，剪切字符串，减少集合内容，数字的减法
 */
@property (readonly) TButtonling *(^deleteFrom)(id dst);
/**
 * 减量功能的抽象
 * 集合的清空，字符串的清空
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TButtonling *clean;

/**
 * 减量功能的抽象
 * 指定字段下的集合的清空，字符串的清空，数字的归零，对象的置为nil
 */
@property (readonly) TButtonling *(^kvcClean)(NSString *k, ...);

#pragma mark - 改
/**
 * 替换内容
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TButtonling *(^instead)(id neww, id old);

@property (readonly) TButtonling *(^insteadAt)(id neww, NSUInteger idx);

@property (readonly) TButtonling *(^kvcSet)(id v, NSString *k);

/// 指定字段下的布尔值的反转
@property (readonly) TButtonling *(^kvcToggle)(NSString *k);

/**
 * 指定字段下的对象的懒惰初始化，如果字段不为nil则不进行初始化
 */
@property (readonly) TButtonling *(^kvcInit)(NSString *k, ...);
#pragma mark - 查

/// floop(from, to[, TargetType, CODE]) 链上的for循环
@property (readonly) TButtonling *(^floop)(NSInteger from, NSInteger to, id CODE_OBJ_x_INT_i);

@property (readonly) TButtonling *(^floopIN)(NSInteger from, NSInteger to, TlingILoopIN block);

@property (readonly) TButtonling *(^outer)(id _Nullable * _Nullable toPtr);

@property (readonly) TButtonling *(^kvcOuter)(id forObj,NSString *forKey);

@property (readonly) TButtonling *(^kvcGet)(NSString *forKey);

#pragma mark - 控制
/// continuee([TargetType,] CODE)
@property (readonly) TButtonling *(^continuee)(id CODE_OBJ_x);

@property (readonly) TButtonling *(^continueeIN)(TlingConditionIN block);

#pragma mark - 其他

/// description
@property (readonly) TButtonling *log;
/// debug description
@property (readonly) TButtonling *delog;
/// 自定义指定格式的打印 : logFormat(@"...%@...")
@property (readonly) TButtonling *(^logStyled)(NSString *format);
/// copy for taget
@property (readonly) TButtonling *copied;
/// mutable copy for taget
@property (readonly) TButtonling *mCopied;
@end
NS_ASSUME_NONNULL_END
