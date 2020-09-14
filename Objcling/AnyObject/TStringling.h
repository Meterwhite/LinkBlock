//
//  TStringling.h
//  Objcling
//
//  Created by meterwhite on 2020/8/22.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TObjectling.h"

@class TStringling, TNumberling, UIImageView, TURLling;

NS_ASSUME_NONNULL_BEGIN

@protocol TStringLetling <NSObject>

/// 倒序的字符串
@property (readonly) TStringling<TStringLetling> *reversed;
/// @"我" => @"\u6211"
@property (readonly) TStringling<TStringLetling> *unicodeEncoding;
/// @"\u6211" => @"我"
@property (readonly) TStringling<TStringLetling> *deUnicodeEncoding;

@property (readonly) TStringling<TStringLetling> *urlEncoding;

@property (readonly) TStringling<TStringLetling> *deUrlEncoding;

@property (readonly) TStringling<TStringLetling> *nonSpaceAndWrap;

/// ImageView Button
@property (readonly) TStringling *(^imageNamedImageInto)(id control);

@property (readonly) TStringling *(^textInto)(id control);

#pragma mark - URL
@property (readonly) TStringling *(^urlpathAppend)(NSString *pathComponent);

@property (readonly) TStringling *(^urlpathAppendDirectory)(NSString *component);

@property (readonly) TStringling *(^urlpathAppendExtension)(NSString *s);

@property (readonly) TStringling *urlpathDeleteLastComponent;

@property (readonly) TStringling *urlpathGetLastComponent;

@property (readonly) TStringling *urlpathGetExtension;

@property (readonly) TStringling *urlpathGetComponents;

@end

@interface TStringling : TObjectling<TlingLetBranch>

@property (readonly) TStringling<TStringLetling> *let;

#pragma mark - 增
@property (readonly) TStringling *(^append)(NSString *s);

@property (readonly) TStringling *(^appendLine)(NSString *s);
#pragma mark - 删
@property (readonly) TStringling *(^deletee)(NSString *s);

@property (readonly) TStringling *(^deleteLeft)(NSString *s);

@property (readonly) TStringling *(^deleteRight)(NSString *s);

@property (readonly) TStringling *(^trim)(NSString *s);

@property (readonly) TStringling *(^trimLeft)(NSString *s);

@property (readonly) TStringling *(^trimRight)(NSString *s);


#pragma mark - 改
@property (readonly) TStringling *(^replace)(NSString *substr, NSString* with);

@property (readonly) TStringling *(^split)(NSString* with);

@property (readonly) TStringling *(^subFrom)(NSUInteger from);

@property (readonly) TStringling *(^subString)(NSUInteger to, NSUInteger from);

@property (readonly) TStringling *(^subTo)(NSUInteger to);

@property (readonly) TStringling *(^subRange)(NSRange ran);

@property (readonly) TStringling *(^subElement)(NSUInteger to, NSUInteger from);

@property (readonly) TStringling *(^subElementFrom)(NSUInteger from);

@property (readonly) TStringling *(^subElementTo)(NSUInteger to);

#pragma mark - 查
@property (readonly) TStringling *(^at)(NSUInteger idx);

@property (readonly) TStringling *(^contains)(NSString *substr, NSString* with);

@property (readonly) TStringling *(^hasPrefix)(NSString* s);

@property (readonly) TStringling *(^hasSuffix)(NSString* s);

@property (readonly) TStringling *lenth;

@property (readonly) TStringling *lenthASCII;

@property (readonly) TStringling *lenthUnicode;

@property (readonly) TStringling *lenthElement;

#pragma mark - 转换
/// @""
@property (readonly) TNumberling *isEmpty;
/// <#Description#>
@property (readonly) TNumberling *isMeaningNone;

@property (readonly) TNumberling *containsEmoji;

@property (readonly) TNumberling *isEmoji;

@property (readonly) TNumberling *scannedNumber;

@property (readonly) TURLling    *asURL;

@end

#pragma mark - 类型协助

@interface TStringling (ObjclingGoing)

#pragma mark - Tling
/// 在用户的闭包中处理通知
@property (nonatomic,readonly) TStringling *(^notifiedIN)(NSNotificationName nam, TlingNotifiedIN block);
/// 使用作用到target的谓词控制链条的返回
@property (nonatomic,readonly) TStringling *(^stopWhile)(NSPredicate *predicate);
/// 展开链条，允许返回新的链条。
@property (nonatomic,readonly) TStringling *(^branchIN)(TlingBranchIN block);
/// 断言
@property (nonatomic,readonly) TStringling *(^asserttBy)(NSPredicate *predicate);
/// 断言；在行内判断，如`assertt(x == nil)`。变量x为当前对象，`assertt(Type, x.value > 0)`.
@property (nonatomic,readonly) TStringling *(^assertt)(id CODE_TYPE_x);
/// 断言；在闭包中判断
@property (nonatomic,readonly) TStringling *(^asserttIN)(TlingConditionIN block);
/// 执行动态链. var x = danamiling.go.get
@property (nonatomic,readonly) TStringling *go;
/// 使用指定的对象来执行动态链。
@property (nonatomic,readonly) TStringling *(^goBy)(id target);
/// 使用指定的多个对象来执行动态链。
@property (nonatomic,readonly) TStringling *(^goBys)(NSArray *targets);
/// 通过通知来触发动态链的执行。
@property (nonatomic,readonly) TStringling *(^notifiedGo)(NSNotificationName ntf);

#pragma mark - TObjectling
#pragma mark - 增
/**
 * 增量功能的抽象
 * 拼接字符串，添加集合内容，数字的加法，子视图的增加，字典的拼接
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TStringling *(^more)(id obj);

/// more()的可变参数版本。
@property (readonly) TStringling *(^moreN)(id obj1, ...);
/**
 * 增量功能的抽象
 * 拼接字符串，添加集合内容，数字的加法，子视图的增加
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TStringling *(^moreAt)(id obj1, NSUInteger idx);
/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容，有拼接字符串，添加集合内容，子视图的增加
 */
@property (readonly) TStringling *(^appendto)(id dst);
/**
 * 增量功能的抽象
 * 将对象作为被拼接的内容追加到其他内容，有拼接字符串，添加集合内容，子视图的增加
 */
@property (readonly) TStringling *(^appendtoAt)(id dst, NSUInteger idx);

#pragma mark - 删
/**
 * 减量功能的抽象
 * 剪切字符串，减少集合内容，数字的减法，字典内容的移除（传key）
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TStringling *(^less)(id obj);

/// less()的可变参数版本。
@property (readonly) TStringling *(^lessN)(id obj1, ...) ;
/**
 * 减量功能的抽象
 * 剪切字符串，减少集合内容，数字的减法
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TStringling *(^lessAt)(NSUInteger idx);
/**
 * 减量功能的抽象
 * 将对象从其他内容中移除，剪切字符串，减少集合内容，数字的减法
 */
@property (readonly) TStringling *(^deleteFrom)(id dst);
/**
 * 减量功能的抽象
 * 集合的清空，字符串的清空
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TStringling *clean;
/**
 * 减量功能的抽象
 * 指定字段下的集合的清空，字符串的清空，数字的归零，对象的置为nil
 */
@property (readonly) TURLling *(^kvcClean)(NSString *k, ...);

#pragma mark - 改
/**
 * 替换内容
 * 注：如果必要则会潜在的把target提升为可变类型
 */
@property (readonly) TStringling *(^instead)(id neww, id old);

@property (readonly) TStringling *(^insteadAt)(id neww, NSUInteger idx);

#pragma mark - 查
/// floop(from, to[, TargetType, CODE]) 链上的for循环
@property (readonly) TStringling *(^floop)(NSInteger from, NSInteger to, id CODE_OBJ_x_INT_i);

@property (readonly) TStringling *(^floopIN)(NSInteger from, NSInteger to, TlingILoopIN block);

@property (readonly) TStringling *(^outer)(id _Nullable * _Nullable toPtr);

@property (readonly) TStringling *(^kvcOuter)(id forObj,NSString *forKey);

@property (readonly) TStringling *(^kvcGet)(NSString *forKey);

#pragma mark - 控制
/// continuee([TargetType,] CODE)
@property (readonly) TStringling *(^continuee)(id CODE_OBJ_x);

@property (readonly) TStringling *(^continueeIN)(TlingConditionIN block);

#pragma mark - 其他
/// description
@property (readonly) TStringling *log;
/// debug description
@property (readonly) TStringling *delog;
/// 自定义指定格式的打印 : logFormat(@"...%@...")
@property (readonly) TStringling *(^logStyled)(NSString *format);
/// copy for taget
@property (readonly) TStringling *copied;
/// mutable copy for taget
@property (readonly) TStringling *mCopied;

@end

NS_ASSUME_NONNULL_END
