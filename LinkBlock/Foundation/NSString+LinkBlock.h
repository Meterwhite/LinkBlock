//
//  NSString+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject(NSStringLinkBlock)
@property (nonatomic,copy) NSString*    (^strAt)(NSUInteger index);
@property (nonatomic,copy) BOOL         (^strIsEqualStr)(NSString* str);
@property (nonatomic,copy) NSMutableString* (^strMutableCopy)();
@property (nonatomic,copy) NSString*    (^strAppend)(NSString* str);
@property (nonatomic,copy) NSString*    (^strAppendFormat)(NSString* formatStr , ...);
@property (nonatomic,copy) NSString*    (^strAppendLine)(NSString* str);
@property (nonatomic,copy) NSString*    (^strInsertAt)(NSString* str, NSUInteger index);
@property (nonatomic,copy) NSString*    (^strDeleteInRange)(NSRange range);
@property (nonatomic,copy) NSString*    (^strDeleteStr)(NSString* str);
@property (nonatomic,copy) NSString*    (^strReplaceInRange)(NSString* str, NSRange range);
@property (nonatomic,copy) NSString*    (^strReplace)(NSString* replaceStr, NSString* withStr);
@property (nonatomic,copy) BOOL         (^strIsContain)(NSString* str);
/** 字符串是否含有汉字 */
@property (nonatomic,copy) BOOL         (^strIsContainzh_CN)();
/** 范围内是否都是汉字 */
@property (nonatomic,copy) BOOL         (^strIszh_CNInRange)(NSRange range);
@property (nonatomic,copy) NSRange      (^strRangeOfStr)(NSString* str);
@property (nonatomic,copy) NSInteger    (^strIndexOfStr)(NSString* str);
@property (nonatomic,copy) NSInteger    (^strIndexOfStrStartAt)(NSString* str, NSUInteger startIndex);

/** 是否是表示空的字符串，包括全部空白符和字符串：@"<null>"，@"(null)" */
@property (nonatomic,copy) BOOL         (^strIsBlank)();
/** 判断emoji */
@property (nonatomic,copy) BOOL         (^strIsEmoji)();
@property (nonatomic,copy) BOOL         (^strIsContainEmoji)();
/** 计算尺寸 */
@property (nonatomic,copy) CGSize       (^strSizeWithFont)(UIFont* font);
@property (nonatomic,copy) CGSize       (^strSizeWithFontAndMaxWidth)(UIFont* font , CGFloat maxWidth);
@property (nonatomic,copy) CGSize       (^strSizeWithFontAndMaxSize)(UIFont* font, CGSize maxSize);
/** 计算字符串的高度，参数：属性字典 */
@property (nonatomic,copy) double       (^strHeight)(NSDictionary* attrDict);
/** 计算字符串的行高，参数：属性字典 */
@property (nonatomic,copy) double       (^strLineHeight)(NSDictionary* attrDict);
/** 视图排版中计算的字符串的行数 */
@property (nonatomic,copy) NSInteger    (^strLinesCountAboutView)(CGFloat maxWidth,NSDictionary* attrDict);
/** 字符串的换行数 */
@property (nonatomic,copy) NSUInteger    (^strLinesCount)();
/** 视图排版中截一定行的字符串，参数：目标行数，最大宽度，属性字典 */
@property (nonatomic,copy) NSString*    (^strSubToLineAboutView)(NSInteger toLine, CGFloat maxWidth,NSDictionary* attrDict);
/** 截取到一定数换行的字符串 */
@property (nonatomic,copy) NSString*    (^strSubToLine)(NSUInteger toLine);
@property (nonatomic,copy) NSUInteger   (^strLength)();
/** 字符串按ASCII的长度 */
@property (nonatomic,copy) NSUInteger   (^strLengthASCII)();
/** 字符串按Unicode的长度 */
@property (nonatomic,copy) NSUInteger   (^strLengthUnicode)();
/** 字符串按元字符组成的序列的长度，即汉字，emoji，都作为一个字符 */
@property (nonatomic,copy) NSUInteger   (^strLengthComposed)();
/** 字符串按元字符组成的序列和自定义正则规则的长度，即一个规格匹配，汉字，emoji，都作为一个字符 */
@property (nonatomic,copy) NSUInteger   (^strLengthComposedAndCustom)(NSString* reg);
@property (nonatomic,copy) NSString*    (^strClearSpaceAndWrap)();
/** 对数字敏感的比较两个字符串：12.3 < 12.4; Foo2.txt < Foo7.txt ; */
/** Compares two strings of sensitive to Numbers  */
@property (nonatomic,copy) NSComparisonResult (^strCompareNumberSensitive)(NSString* str);
/** 通用字符串比较 */
/** Generic string comparison  */
@property (nonatomic,copy) NSComparisonResult (^strCompare)(NSString* str);
/** 是否是整型字符串 */
@property (nonatomic,copy) BOOL         (^strIsInteger)();
/** 是否是浮点数字符串 */
@property (nonatomic,copy) BOOL         (^strIsFloating)();
/** 是否是数字类型 */
@property (nonatomic,copy) BOOL         (^strIsNumber)();
/** 反转字符串 */
@property (nonatomic,copy) NSString*    (^strReversed)();
/** 从左删除第一次匹配的字符串 */
@property (nonatomic,copy) NSString*    (^strDeleteLeft)(NSString* str);
/** 从右删除第一次匹配的字符串 */
@property (nonatomic,copy) NSString*    (^strDeleteRight)(NSString* str);
/** 从左删除所有匹配的字符串，直到第一次不匹配 */
@property (nonatomic,copy) NSString*    (^strTrimLeft)(NSString* str);
/** 从右删除所有匹配的字符串，直到第一次不匹配 */
@property (nonatomic,copy) NSString*    (^strTrimRight)(NSString* str);
@property (nonatomic,copy) NSString*    (^strTrim)(NSString* str);
/** 分割字符串， 传入 "." ，"0-a.b.c.e-0" 变为  "0-a" "b" "c" "d" "e-0" */
@property (nonatomic,copy) NSArray<NSString*>*     (^strSplitWithStr)(NSString* splitStr);
/** 分割字符串，传入字符集类似@".-_" */
@property (nonatomic,copy) NSArray<NSString*>*     (^strSplitWithCharsStr)(NSString* splitStr);

@property (nonatomic,copy) BOOL         (^strHasPrefix)(NSString* prefix);
@property (nonatomic,copy) BOOL         (^strHasSuffix)(NSString* suffix);
@property (nonatomic,copy) NSString*    (^strSubFrom)(NSUInteger from);
@property (nonatomic,copy) NSString*    (^strSubTo)(NSUInteger to);
@property (nonatomic,copy) NSString*    (^strSubFromTo)(NSUInteger from , NSUInteger to);
#pragma mark - 创建
/** 根据字符串类名调用new方法创建对象 */
@property (nonatomic,copy) NSObject*            (^strCreateObj)();
/** 根据图片名创键图片控件 */
@property (nonatomic,copy) UIImageView*         (^strCreateImgView)(CGFloat x, CGFloat y, CGFloat w, CGFloat h);
@property (nonatomic,copy) UILabel*             (^strCreateLab)(CGRect frame);
#pragma mrak - 转换
/** 格式如：0xcccccc , #cccccc , cccccc */
@property (nonatomic,copy) UIColor*             (^strToUIColorFromHexStr)();
@property (nonatomic,copy) NSURL*               (^strToNSURL)();
@property (nonatomic,copy) UIImage*             (^strToUIImage)();
@property (nonatomic,copy) NSInteger            (^strToInteger)();
@property (nonatomic,copy) long long            (^strToLongLong)();
@property (nonatomic,copy) double               (^strToDouble)();
@property (nonatomic,copy) float                (^strToFloat)();
@property (nonatomic,copy) BOOL                 (^strToBOOL)();
@property (nonatomic,copy) double               (^strToDoubleFromHexStr)();
@property (nonatomic,copy) unsigned int         (^strToIntFromHexStr)();
@property (nonatomic,copy) CGRect               (^strToCGRect)();
@property (nonatomic,copy) CGVector             (^strToCGVector)();
@property (nonatomic,copy) CGSize               (^strToCGSize)();
@property (nonatomic,copy) CGPoint              (^strToCGPoint)();
@property (nonatomic,copy) CGAffineTransform    (^strToCGAffineTransform)();
@property (nonatomic,copy) UIEdgeInsets         (^strToUIEdgeInsets)();
@property (nonatomic,copy) UIOffset             (^strToUIOffset)();
/** 路径转NSData */
@property (nonatomic,copy) NSData*              (^strToNSDataWithContentsOfFile)();
/** 转NSData */
@property (nonatomic,copy) NSData*              (^strToNSDataUseEncoding)(NSStringEncoding);
/** 日期字符串转日期 */
@property (nonatomic,copy) NSDate*              (^strToNSDateWithFormat)(NSString* formatStr);
/** 数字字符串转日期 */
@property (nonatomic,copy) NSDate*              (^strToNSDateSince1970)();
/** 转字典 */
@property (nonatomic,copy) NSDictionary*        (^strToNSDictionary)(NSStringEncoding encoding);
/** json形式字符串转数组 */
@property (nonatomic,copy) NSArray*             (^strToNSArrary)(NSStringEncoding encoding);

@property (nonatomic,copy) BOOL                 (^strRegexIsMatch)(NSString* regex);
/**
 *  正则表达式替换字符串子串
 *  regex : "http://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?".
 *  replaceTemplate : "<a href=\"$0\">$0</a>".
 */
@property (nonatomic,copy) NSString*            (^strRegexReplace)(NSString* regex, NSString* replaceTemplate);

/** 十六进制字符串颜色设置到控件 */
@property (nonatomic,copy) NSString*            (^strSetBGColorHexToViews)(NSArray* views);
/** 主要针对主要控件设置文本 */
@property (nonatomic,copy) NSString*            (^strSetTextToControls)(NSArray* controls);
@property (nonatomic,copy) NSString*            (^strSetTextColorToControls)(NSArray* controls);
/** 查找字符串中的第一组数字 */
@property (nonatomic,copy) double               (^strFindNumber)();

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
@end