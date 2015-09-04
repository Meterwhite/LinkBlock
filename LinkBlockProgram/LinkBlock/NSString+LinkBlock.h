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
@property (nonatomic,copy) NSString*    (^strAppendFormate)(NSString* formateStr , ...);
@property (nonatomic,copy) NSString*    (^strAppendLine)(NSString* str);
@property (nonatomic,copy) NSString*    (^strInsertAt)(NSString* str, NSUInteger index);
@property (nonatomic,copy) NSString*    (^strDeleteInRange)(NSRange range);
@property (nonatomic,copy) NSString*    (^strDeleteStr)(NSString* str);
@property (nonatomic,copy) NSString*    (^strReplaceInRange)(NSString* str, NSRange range);
@property (nonatomic,copy) NSString*    (^strReplace)(NSString* replaceStr, NSString* withStr);
@property (nonatomic,copy) BOOL         (^strIsContain)(NSString* str);
@property (nonatomic,copy) NSRange      (^strRangeOfStr)(NSString* str);
@property (nonatomic,copy) NSInteger    (^strIndexOfStr)(NSString* str);
@property (nonatomic,copy) NSInteger    (^strIndexOfStrStartAt)(NSString* str, NSUInteger startIndex);

/** 是否是表示空的字符串"","<null>","(null)" */
@property (nonatomic,copy) BOOL         (^strIsBlank)();
@property (nonatomic,copy) BOOL         (^strIsEmoji)();
@property (nonatomic,copy) BOOL         (^strIsContainEmoji)();
/** 计算尺寸 */
@property (nonatomic,copy) CGSize       (^strSizeWithFont)(UIFont* font);
@property (nonatomic,copy) CGSize       (^strSizeWithFontAndMaxWidth)(UIFont* font , CGFloat maxWidth);
@property (nonatomic,copy) CGSize       (^strSizeWithFontAndMaxSize)(UIFont* font, CGSize maxSize);

@property (nonatomic,copy) NSUInteger   (^strLength)();
@property (nonatomic,copy) NSUInteger   (^strLengthASCII)();
@property (nonatomic,copy) NSUInteger   (^strLengthUnicode)();
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
/** 从左删除第一次匹配的字符串 */
/** Removed from the left of the matched string for the first time */
@property (nonatomic,copy) NSString*    (^strDeleteLeft)(NSString* str);
/** 从右删除第一次匹配的字符串 */
/** Removed from the right of the matched string for the first time */
@property (nonatomic,copy) NSString*    (^strDeleteRight)(NSString* str);
/** 从左删除所有匹配的字符串，直到第一次不匹配 */
/** Delete all matching string from the left, until the first don't match  */
@property (nonatomic,copy) NSString*    (^strTrimLeft)(NSString* str);
/** 从右删除所有匹配的字符串，直到第一次不匹配 */
/** Delete all matching string from the right, until the first don't match  */
@property (nonatomic,copy) NSString*    (^strTrimRight)(NSString* str);
@property (nonatomic,copy) NSString*    (^strTrim)(NSString* str);
/** 分割字符串， 传入 "." ，"0-a.b.c.e-0" 变为  "0-a" "b" "c" "d" "e-0" */
/** Returns an array containing substrings from the receiver that have been divided by a given separator. */
@property (nonatomic,copy) NSArray*     (^strSplitWithStr)(NSString* splitStr);
/** Returns an array containing substrings from the receiver that have been divided by characters in a given string. */
@property (nonatomic,copy) NSArray*     (^strSplitWithCharsStr)(NSString* splitStr);

@property (nonatomic,copy) BOOL         (^strHasPrefix)(NSString* prefix);
@property (nonatomic,copy) BOOL         (^strHasSuffix)(NSString* suffix);
@property (nonatomic,copy) NSString*    (^strSubFrom)(NSUInteger from);
@property (nonatomic,copy) NSString*    (^strSubTo)(NSUInteger to);
@property (nonatomic,copy) NSString*    (^strSubFromTo)(NSUInteger from , NSUInteger to);
#pragma mrak - convert（转换
/** 0xcccccc , #cccccc , cccccc */
@property (nonatomic,copy) UIColor*             (^strToColorFromHexStr)();
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
@property (nonatomic,copy) NSData*              (^strToNSDataFromContents)();
@property (nonatomic,copy) NSDate*              (^strToNSDateWithFormate)(NSString* formateStr);
#pragma mark - regex（正则表达式
@property (nonatomic,copy) BOOL                 (^strRegexIsMatch)(NSString* regex);
/** NSTextCheckingResult arrary  */
@property (nonatomic,copy) NSArray*             (^strRegexMatchs)(NSString* regex);
/**
 *  regex : "http://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?".
 *  replaceTemplate : "<a href=\"$0\">$0</a>".
 */
@property (nonatomic,copy) NSString*            (^strRegexReplace)(NSString* regex, NSString* replaceTemplate);
@end