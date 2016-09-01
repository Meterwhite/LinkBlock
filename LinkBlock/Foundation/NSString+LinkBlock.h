//
//  NSString+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject(NSStringLinkBlock)
@property (nonatomic,copy,readonly) NSString*    (^strAt)(NSUInteger index);
@property (nonatomic,copy,readonly) BOOL         (^strIsEqualStr)(NSString* str);
@property (nonatomic,copy,readonly) NSMutableString* (^strMutableCopy)();
@property (nonatomic,copy,readonly) NSString*    (^strAppend)(NSString* str);
@property (nonatomic,copy,readonly) NSString*    (^strAppendFormat)(NSString* formatStr , ...);
@property (nonatomic,copy,readonly) NSString*    (^strAppendLine)(NSString* str);
@property (nonatomic,copy,readonly) NSString*    (^strInsertAt)(NSString* str, NSUInteger index);
@property (nonatomic,copy,readonly) NSString*    (^strDeleteInRange)(NSRange range);
@property (nonatomic,copy,readonly) NSString*    (^strDeleteStr)(NSString* str);
@property (nonatomic,copy,readonly) NSString*    (^strReplaceInRange)(NSString* str, NSRange range);
@property (nonatomic,copy,readonly) NSString*    (^strReplace)(NSString* replaceStr, NSString* withStr);
@property (nonatomic,copy,readonly) BOOL         (^strIsContain)(NSString* str);
/** 字符串是否含有汉字 */
@property (nonatomic,copy,readonly) BOOL         (^strIsContainzh_CN)();
/** 范围内是否都是汉字 */
@property (nonatomic,copy,readonly) BOOL         (^strIszh_CNInRange)(NSRange range);
@property (nonatomic,copy,readonly) NSRange      (^strRangeOfStr)(NSString* str);
@property (nonatomic,copy,readonly) NSInteger    (^strIndexOfStr)(NSString* str);
@property (nonatomic,copy,readonly) NSInteger    (^strIndexOfStrStartAt)(NSString* str, NSUInteger startIndex);

/** 是否是表示空的字符串，包括全部空白符和字符串：@"<null>"，@"(null)" */
@property (nonatomic,copy,readonly) BOOL         (^strIsBlank)();
/** 判断emoji */
@property (nonatomic,copy,readonly) BOOL         (^strIsEmoji)();
@property (nonatomic,copy,readonly) BOOL         (^strIsContainEmoji)();
/** 计算尺寸 */
@property (nonatomic,copy,readonly) CGSize       (^strSizeWithFont)(UIFont* font);
@property (nonatomic,copy,readonly) CGSize       (^strSizeWithFontAndMaxWidth)(UIFont* font , CGFloat maxWidth);
@property (nonatomic,copy,readonly) CGSize       (^strSizeWithFontAndMaxSize)(UIFont* font, CGSize maxSize);
/** 计算字符串的高度，参数：属性字典 */
@property (nonatomic,copy,readonly) double       (^strHeight)(NSDictionary* attrDict);
/** 计算字符串的行高，参数：属性字典 */
@property (nonatomic,copy,readonly) double       (^strLineHeight)(NSDictionary* attrDict);
/** 视图排版中计算的字符串的行数 */
@property (nonatomic,copy,readonly) NSInteger    (^strLinesCountAboutView)(CGFloat maxWidth,NSDictionary* attrDict);
/** 字符串的换行数 */
@property (nonatomic,copy,readonly) NSUInteger    (^strLinesCount)();
/** 视图排版中截一定行的字符串，参数：目标行数，最大宽度，属性字典 */
@property (nonatomic,copy,readonly) NSString*    (^strSubToLineAboutView)(NSInteger toLine, CGFloat maxWidth,NSDictionary* attrDict);
/** 截取到一定数换行的字符串 */
@property (nonatomic,copy,readonly) NSString*    (^strSubToLine)(NSUInteger toLine);
@property (nonatomic,copy,readonly) NSUInteger   (^strLength)();
/** 字符串按ASCII的长度 */
@property (nonatomic,copy,readonly) NSUInteger   (^strLengthASCII)();
/** 字符串按Unicode的长度 */
@property (nonatomic,copy,readonly) NSUInteger   (^strLengthUnicode)();
/** 字符串按元字符组成的序列的长度，即汉字，emoji，都作为一个字符 */
@property (nonatomic,copy,readonly) NSUInteger   (^strLengthComposed)();
/** 字符串按元字符组成的序列和自定义正则规则的长度，即一个规格匹配，汉字，emoji，都作为一个字符 */
@property (nonatomic,copy,readonly) NSUInteger   (^strLengthComposedAndCustom)(NSString* reg);
@property (nonatomic,copy,readonly) NSString*    (^strClearSpaceAndWrap)();
/** 对数字敏感的比较两个字符串：12.3 < 12.4; Foo2.txt < Foo7.txt ; */
/** Compares two strings of sensitive to Numbers  */
@property (nonatomic,copy,readonly) NSComparisonResult (^strCompareNumberSensitive)(NSString* str);
/** 通用字符串比较 */
/** Generic string comparison  */
@property (nonatomic,copy,readonly) NSComparisonResult (^strCompare)(NSString* str);
/** 是否是整型字符串 */
@property (nonatomic,copy,readonly) BOOL         (^strIsInteger)();
/** 是否是浮点数字符串 */
@property (nonatomic,copy,readonly) BOOL         (^strIsFloating)();
/** 是否是数字类型 */
@property (nonatomic,copy,readonly) BOOL         (^strIsNumber)();
/** 反转字符串 */
@property (nonatomic,copy,readonly) NSString*    (^strReversed)();
/** 从左删除第一次匹配的字符串 */
@property (nonatomic,copy,readonly) NSString*    (^strDeleteLeft)(NSString* str);
/** 从右删除第一次匹配的字符串 */
@property (nonatomic,copy,readonly) NSString*    (^strDeleteRight)(NSString* str);
/** 从左删除所有匹配的字符串，直到第一次不匹配 */
@property (nonatomic,copy,readonly) NSString*    (^strTrimLeft)(NSString* str);
/** 从右删除所有匹配的字符串，直到第一次不匹配 */
@property (nonatomic,copy,readonly) NSString*    (^strTrimRight)(NSString* str);
@property (nonatomic,copy,readonly) NSString*    (^strTrim)(NSString* str);
/** 分割字符串， 传入 "." ，"0-a.b.c.e-0" 变为  "0-a" "b" "c" "d" "e-0" */
@property (nonatomic,copy,readonly) NSArray<NSString*>*     (^strSplitWithStr)(NSString* splitStr);
/** 分割字符串，传入字符集类似@".-_" */
@property (nonatomic,copy,readonly) NSArray<NSString*>*     (^strSplitWithCharsStr)(NSString* splitStr);

@property (nonatomic,copy,readonly) BOOL         (^strHasPrefix)(NSString* prefix);
@property (nonatomic,copy,readonly) BOOL         (^strHasSuffix)(NSString* suffix);
@property (nonatomic,copy,readonly) NSString*    (^strSubFrom)(NSUInteger from);
@property (nonatomic,copy,readonly) NSString*    (^strSubTo)(NSUInteger to);
@property (nonatomic,copy,readonly) NSString*    (^strSubFromTo)(NSUInteger from , NSUInteger to);

@property (nonatomic,copy,readonly) NSString*    (^strPathWithName)(NSString* type);
@property (nonatomic,copy,readonly) NSString*    (^strPathAppendingComponent)(NSString* component);
/** 将字符串复制到通用剪贴板 */
@property (nonatomic,copy,readonly) NSString*    (^strCopyToGeneralPasteboard)();
#pragma mark - 创建
/** 根据字符串类名调用new方法创建对象 */
@property (nonatomic,copy,readonly) NSObject*            (^strCreateObj)();
#pragma mrak - 转换
/** 格式如：0xcccccc , #cccccc , cccccc */
@property (nonatomic,copy,readonly) UIColor*             (^strToUIColorFromHexStr)();
@property (nonatomic,copy,readonly) NSURL*               (^strToNSURL)();
@property (nonatomic,copy,readonly) UIImage*             (^strToUIImage)();
@property (nonatomic,copy,readonly) UIImageView*         (^strToUIImageView)();
@property (nonatomic,copy,readonly) NSInteger            (^strToInteger)();
@property (nonatomic,copy,readonly) long long            (^strToLongLong)();
@property (nonatomic,copy,readonly) double               (^strToDouble)();
@property (nonatomic,copy,readonly) float                (^strToFloat)();
@property (nonatomic,copy,readonly) BOOL                 (^strToBOOL)();
@property (nonatomic,copy,readonly) double               (^strToDoubleFromHexStr)();
@property (nonatomic,copy,readonly) unsigned int         (^strToIntFromHexStr)();
@property (nonatomic,copy,readonly) CGRect               (^strToCGRect)();
@property (nonatomic,copy,readonly) CGVector             (^strToCGVector)();
@property (nonatomic,copy,readonly) CGSize               (^strToCGSize)();
@property (nonatomic,copy,readonly) CGPoint              (^strToCGPoint)();
@property (nonatomic,copy,readonly) CGAffineTransform    (^strToCGAffineTransform)();
@property (nonatomic,copy,readonly) UIEdgeInsets         (^strToUIEdgeInsets)();
@property (nonatomic,copy,readonly) UIOffset             (^strToUIOffset)();
/** 路径转NSData */
@property (nonatomic,copy,readonly) NSData*              (^strToNSDataWithContentsOfFile)();
/** 转NSData */
@property (nonatomic,copy,readonly) NSData*              (^strToNSDataUseEncoding)(NSStringEncoding);
/** 日期字符串转日期 */
@property (nonatomic,copy,readonly) NSDate*              (^strToNSDateWithFormat)(NSString* formatStr);
/** 数字字符串转日期 */
@property (nonatomic,copy,readonly) NSDate*              (^strToNSDateSince1970)();
/** 转字典 */
@property (nonatomic,copy,readonly) NSDictionary*        (^strToNSDictionary)(NSStringEncoding encoding);
/** json形式字符串转数组 */
@property (nonatomic,copy,readonly) NSArray*             (^strToNSArrary)(NSStringEncoding encoding);

@property (nonatomic,copy,readonly) BOOL                 (^strRegexIsMatch)(NSString* regex);
/**
 *  正则表达式替换字符串子串
 *  regex : "http://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?".
 *  replaceTemplate : "<a href=\"$0\">$0</a>".
 */
@property (nonatomic,copy,readonly) NSString*            (^strRegexReplace)(NSString* regex, NSString* replaceTemplate);

/** 十六进制字符串颜色设置到控件 */
@property (nonatomic,copy,readonly) NSString*            (^strSetBGColorHexToViews)(NSArray* views);
/** 主要针对主要控件设置文本 */
@property (nonatomic,copy,readonly) NSString*            (^strSetTextToControls)(NSArray* controls);
@property (nonatomic,copy,readonly) NSString*            (^strSetTextColorToControls)(NSArray* controls);
/** 查找字符串中的第一组数字 */
@property (nonatomic,copy,readonly) double               (^strFindNumber)();
#pragma mark - URL操作
///** 可用于获取BaseURL，获取参数前的URL（即?前部分），但不对内容做验证 */
@property (nonatomic,copy,readonly) NSString*            (^strURLBeforeKeyValues)();
@property (nonatomic,copy,readonly) NSString*            (^strURLValueForKey)(NSString* key);
@property (nonatomic,copy,readonly) NSString*            (^strURLSetValueForKey)(NSString* value,NSString* key);
@property (nonatomic,copy,readonly) NSString*            (^strURLSetKeyValueWithDict)(NSDictionary<NSString*,NSString*>* keyValues);
@property (nonatomic,copy,readonly) NSDictionary*        (^strURLKeyValues)();
@property (nonatomic,copy,readonly) NSArray*             (^strURLAllKeys)();
@property (nonatomic,copy,readonly) NSArray*             (^strURLAllValues)();
/** 移除相关键及参数 */
@property (nonatomic,copy,readonly) NSString*            (^strURLRemoveValueForKey)(NSString* key);
/** 替换键 */
@property (nonatomic,copy,readonly) NSString*            (^strURLReplaceKeyWithKey)(NSString* replaceKey,NSString* withKey);
/** 替换键，字典结构为:key = replacedKey ;value = newKey */
@property (nonatomic,copy,readonly) NSString*            (^strURLReplaceKeyWithDict)(NSDictionary<NSString*,NSString*>* replaceKey_withKey);

@property (nonatomic,copy,readonly) NSString*            (^strURLEncodeUTF8)();
@property (nonatomic,copy,readonly) NSString*            (^strURLDecodeUTF8)();
@property (nonatomic,copy,readonly) NSString*            (^strURLEncode)(NSStringEncoding encode);
@property (nonatomic,copy,readonly) NSString*            (^strURLDecode)(NSStringEncoding encode);

@end

@interface NSString (NSStringLinkBlock)

/** 遍历字符串中的整型数据 */
- (void)strEnumerateScanIntegerUsingBlock:(void (^)(NSInteger num, NSUInteger idx, BOOL * stop))block;
/** 遍历字符串中的小数数据
 *  例如: "price: .32 , price: 432. , price 32.32"
 *  => 0.3200 432.000 32.320
 */
- (void)strEnumerateScanFloatingUsingBlock:(void(^)(double num, NSUInteger idx, BOOL *stop))block;
/** 遍历字符串中的所有数值类型，统一遍历为double类型 */
- (void)strEnumerateScanNumberUsingBlock:(void(^)(double num, NSUInteger idx, BOOL *stop))block;
/** 遍历字符串按元字符组成的序列，即汉字，emoji，都作为一个字符 */
- (void)strEnumerateComposedUsingBlock:(void(^)(NSString* string,NSRange range,BOOL *stop))block;
/** 遍历同时可修改字符串，遍历按元字符组成的序列，即汉字，emoji，都作为一个字符。返回修改后结果 */
- (NSMutableString*)strEnumerateComposedModifiedUsingBlock:(void(^)(NSString** string,NSRange range,BOOL *stop))block;
/** 遍历字符串按元字符组成的序列和自定义字符串如表情规则，regx：正则表达式 */
- (void)strEnumerateComposedAndCustom:(NSString*)regx usingBlock:(void(^)(NSString* string,NSRange range,BOOL isCustom,BOOL *stop))block;

/**
 *  遍历URL字符串参数
 *
 *  @param block 可以使用空字符串抹去一个值，而非nil
 *
 *  @return 结果
 */
- (NSString *)strEnumerateURLUsingBlock:(void(^)(NSString** urlBeforeKeyValue , NSString** key , NSString** value , BOOL* stop))block;
@end