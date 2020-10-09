//
//  TDictionaryling.h
//  Objcling
//
//  Created by meterwhite on 2020/8/22.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TObjectling.h"

@class TDictionaryling;

NS_ASSUME_NONNULL_BEGIN

@protocol TDictionaryLetling <NSObject>
@property (readonly) TDictionaryling *(^attributedFont)(UIFont *font);

@property (readonly) TDictionaryling *(^attributedColor)(UIColor *color);

@property (readonly) TDictionaryling *(^attributedBgcolor)(UIColor *color);

@property (readonly) TDictionaryling *(^attributedAttachment)(NSTextAttachment* a);

@property (readonly) TDictionaryling *(^attributedParagraph)(NSParagraphStyle *p);

@property (readonly) TDictionaryling *(^attributedLigature)(NSNumber *n);

@property (readonly) TDictionaryling *(^attributedKern)(NSNumber *n);

@property (readonly) TDictionaryling *(^attributedStrikethrough)(NSNumber *n);

@property (readonly) TDictionaryling *(^attributedUnderline)(NSUnderlineStyle u);

@property (readonly) TDictionaryling *(^attributedStrokeColor)(UIColor* c);

@property (readonly) TDictionaryling *(^attributedStrokeWidth)(NSNumber *n);

@property (readonly) TDictionaryling *(^attributedShadow)(NSShadow* s);

@property (readonly) TDictionaryling *(^attributedTextEffect)(NSString* e);

@property (readonly) TDictionaryling *(^attributedLink)(NSURL* url);

@property (readonly) TDictionaryling *(^attributedBaselineOffset)(NSNumber *n);

@property (readonly) TDictionaryling *(^attributedUnderlineColor)(UIColor* c);

@property (readonly) TDictionaryling *(^attributedStrikethroughColor)(UIColor* c);

@property (readonly) TDictionaryling *(^attributedObliquenes)(NSNumber *n);

@property (readonly) TDictionaryling *(^attributedExpansion)(NSNumber *n);

@property (readonly) TDictionaryling *(^attributedWritingDirection)(NSArray* a);

@property (readonly) TDictionaryling *(^attributedVerticalGlyphForm)(NSNumber *n);

@end

@interface TDictionaryling : TObjectling<TlingLetBranch>

@property (readonly) TDictionaryling<TDictionaryLetling> *let;

@property (readonly) TDictionaryling *(^object)(id<NSCopying> forKey);

@property (readonly) TDictionaryling *(^setObject)(id obj, id<NSCopying> forKey);

@property (readonly) TDictionaryling *(^containsKey)(id<NSCopying> k);

@property (readonly) TDictionaryling *(^containsValue)(id<NSCopying> k);

@property (readonly) TDictionaryling *(^keysOfValue)(id value);

@property (readonly) TDictionaryling *(^addEntries)(NSDictionary *dic);

@end

#pragma mark - 类型协助
@interface TDictionaryling (ObjclingGoing)

#pragma mark - Tling
/// 在用户的闭包中处理通知
@property (nonatomic,readonly) TDictionaryling *(^notifiedIN)(NSNotificationName nam, TlingNotifiedIN block);
/// 使用作用到target的谓词控制链条的返回
@property (nonatomic,readonly) TDictionaryling *(^stopWhile)(NSPredicate *predicate);
/// 展开链条，允许返回新的链条。
@property (nonatomic,readonly) TDictionaryling *(^branchIN)(TlingBranchIN block);
/// 断言
@property (nonatomic,readonly) TDictionaryling *(^asserttBy)(NSPredicate *predicate);
/// 断言；在行内判断，如`assertt(x == nil)`。变量x为当前对象，`assertt(Type, x.value > 0)`.
@property (nonatomic,readonly) TDictionaryling *(^assertt)(id CODE_TYPE_x);
/// 断言；在闭包中判断
@property (nonatomic,readonly) TDictionaryling *(^asserttIN)(TlingConditionIN block);
/// 执行动态链. var x = danamiling.go.get
@property (nonatomic,readonly) TDictionaryling *go;
/// 使用指定的对象来执行动态链。
@property (nonatomic,readonly) TDictionaryling *(^goBy)(id target);
/// 使用指定的多个对象来执行动态链。
@property (nonatomic,readonly) TDictionaryling *(^goBys)(NSArray *targets);
/// 通过通知来触发动态链的执行。
@property (nonatomic,readonly) TDictionaryling *(^notifiedGo)(NSNotificationName ntf);

#pragma mark - TObjectling
/**
 * 增量功能的抽象
 * 拼接字符串，添加集合内容，数字的加法，子视图的增加，字典的拼接
 * 注：如有必要会将target提升为可变类型
 */
@property (readonly) TDictionaryling *(^more)(id subDic);
/// more()的可变参数版本。
@property (readonly) TDictionaryling *(^moreN)(id subDic, ...);
/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容，有拼接字符串，添加集合内容，子视图的增加
 */
@property (readonly) TDictionaryling *(^appendto)(id dst);
/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容，有拼接字符串，添加集合内容，子视图的增加
 */
@property (readonly) TDictionaryling *(^appendtoAt)(id dst, NSUInteger idx);

#pragma mark - 删
/**
 * 减量功能的抽象
 * 剪切字符串，减少集合内容，数字的减法，字典内容的移除（传key）
 * 注：如有必要会将target提升为可变类型
 */
@property (readonly) TDictionaryling *(^less)(id forKey);

#define lessN(...) lessN(__VA_ARGS__, nil)
/// less()的可变参数版本。
@property (readonly) TDictionaryling *(^lessN)(id forKey1, ...) ;
/**
 * 减量功能的抽象
 * 修改字符串，减少集合内容，视图的移除
 * 注：如有必要会将target提升为可变类型
 */
@property (readonly) TDictionaryling *(^lessAt)(NSUInteger idx);
/**
 * 减量功能的抽象
 * 从其他内容中移除改对象；修改字符串，移除集合内容，移除视图
 */
@property (readonly) TDictionaryling *(^deleteFrom)(id dst);
/**
 * 减量功能的抽象
 * 集合的清空，字符串的清空
 * 注：如有必要会将target提升为可变类型
 */
@property (readonly) TDictionaryling *clean;
/**
 * 减量功能的抽象
 * 指定字段下的集合的清空，字符串的清空，数字的归零，对象的置为nil
 */
@property (readonly) TDictionaryling *(^kvcClean)(NSString *k, ...);

#pragma mark - 改
/**
 * ✍🏻️替换key
 * 注：如有必要会将target提升为可变类型
 */
@property (readonly) TDictionaryling *(^instead)(id newKey, id oldKey);

@property (readonly) TDictionaryling *(^kvcSet)(id v, NSString *k);

/// 指定字段下的布尔值的反转
@property (readonly) TDictionaryling *(^kvcToggle)(NSString *k);

#pragma mark - 查

/// floop(from, to[, TargetType, CODE]) 链上的for循环
@property (readonly) TDictionaryling *(^floop)(NSInteger from, NSInteger to, id CODE_OBJ_x_INT_i);

@property (readonly) TDictionaryling *(^floopIN)(NSInteger from, NSInteger to, TlingILoopIN block);

@property (readonly) TDictionaryling *(^outer)(id _Nullable * _Nullable toPtr);

@property (readonly) TDictionaryling *(^kvcOuter)(id forObj,NSString *forKey);

@property (readonly) TDictionaryling *(^kvcGet)(NSString *forKey);

#pragma mark - 控制
/// continuee([TargetType,] CODE)
@property (readonly) TDictionaryling *(^continuee)(id CODE_OBJ_x);

@property (readonly) TDictionaryling *(^continueeIN)(TlingConditionIN block);

#pragma mark - 其他

/// description
@property (readonly) TDictionaryling *log;
/// debug description
@property (readonly) TDictionaryling *delog;
/// 自定义指定格式的打印 : logFormat(@"...%@...")
@property (readonly) TDictionaryling *(^logStyled)(NSString *format);
/// copy for taget
@property (readonly) TDictionaryling *copied;
/// mutable copy for taget
@property (readonly) TDictionaryling *mCopied;
@end

NS_ASSUME_NONNULL_END
