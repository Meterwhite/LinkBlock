//
//  NSString+LinkBlock.h

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString(LinkBlock)
@property (nonatomic,copy) BOOL         (^blockIsEqualStr)(NSString* str);
@property (nonatomic,copy) NSMutableString* (^blockMutableCopy)();
@property (nonatomic,copy) NSString*    (^blockAppendStr)(NSString* str);
@property (nonatomic,copy) NSString*    (^blockAppendFormate)(NSString* formateStr , ...);
@property (nonatomic,copy) NSString*    (^blockInsertStrAtIndex)(NSString* str, NSUInteger index);
@property (nonatomic,copy) NSString*    (^blockDeleteStrInRange)(NSRange range);
@property (nonatomic,copy) NSString*    (^blockDeleteStr)(NSString* str);
@property (nonatomic,copy) NSString*    (^blockReplaceStrInRange)(NSString* str, NSRange range);
@property (nonatomic,copy) NSString*    (^blockReplaceStrWithStr)(NSString* replaceStr, NSString* withStr);
@property (nonatomic,copy) BOOL         (^blockIsContainStr)(NSString* str);
@property (nonatomic,copy) NSRange      (^blockRangeOfStr)(NSString* str);
@property (nonatomic,copy) NSInteger    (^blockIndexOfStr)(NSString* str);
@property (nonatomic,copy) NSInteger    (^blockIndexOfStrStartIndex)(NSString* str, NSUInteger startIndex);
@property (nonatomic,copy) NSString*    (^blockStrAtIndex)(NSUInteger index);


/** 是否是表示空的字符串"","<null>","(null)" */
@property (nonatomic,copy) BOOL         (^blockIsBlank)();
@property (nonatomic,copy) BOOL         (^blockIsEmoji)();
@property (nonatomic,copy) BOOL         (^blockIsContainEmoji)();

@property (nonatomic,copy) CGSize       (^blockSizeWithFont)(UIFont* font);
@property (nonatomic,copy) CGSize       (^blockSizeWithFontAndMaxWidth)(UIFont* font , CGFloat maxWidth);
@property (nonatomic,copy) CGSize       (^blockSizeWithFontAndMaxSize)(UIFont* font, CGSize maxSize);

@property (nonatomic,copy) NSUInteger   (^blockLength)();
@property (nonatomic,copy) NSUInteger   (^blockLengthASCII)();
@property (nonatomic,copy) NSUInteger   (^blockLengthUniCode)();
@property (nonatomic,copy) NSString*    (^blockClearSpaceAndWrap)();
/** 对数字敏感的比较两个字符串：12.3 < 12.4; Foo2.txt < Foo7.txt ; */
/** Compares two strings of sensitive to Numbers  */
@property (nonatomic,copy) NSComparisonResult (^blockCompareStrNumberScan)(NSString* str1 , NSString* str2);
/** 通用字符串比较 */
/** Generic string comparison  */
@property (nonatomic,copy) NSComparisonResult (^blockCompareStr)(NSString* str1, NSString* str2);
/** 是否是整型字符串 */
@property (nonatomic,copy) BOOL         (^blockIsInteger)();
/** 是否是浮点数字符串 */
@property (nonatomic,copy) BOOL         (^blockIsFloating)();
/** 是否是数字类型 */
@property (nonatomic,copy) BOOL         (^blockIsNumber)();
/** 从左删除第一次匹配的字符串 */
/** Removed from the left of the matched string for the first time */
@property (nonatomic,copy) NSString*    (^blockDeleteStrLeft)(NSString* str);
/** 从右删除第一次匹配的字符串 */
/** Removed from the right of the matched string for the first time */
@property (nonatomic,copy) NSString*    (^blockDeleteStrRight)(NSString* str);
/** 从左删除所有匹配的字符串，直到第一次不匹配 */
/** Delete all matching string from the left, until the first don't match  */
@property (nonatomic,copy) NSString*    (^blockTrimCharLeft)(NSString* str);
/** 从右删除所有匹配的字符串，直到第一次不匹配 */
/** Delete all matching string from the right, until the first don't match  */
@property (nonatomic,copy) NSString*    (^blockTrimCharRight)(NSString* str);
/** 分割字符串， 传入 "." ，"0-a.b.c.e-0" 变为  "0-a" "b" "c" "d" "e-0" */
/** Returns an array containing substrings from the receiver that have been divided by a given separator. */
@property (nonatomic,copy) NSArray*     (^blockSplitStrWithStr)(NSString* splitStr);
/** Returns an array containing substrings from the receiver that have been divided by characters in a given string. */
@property (nonatomic,copy) NSArray*     (^blockSplitStrWithCharsStr)(NSString* splitStr);

#pragma mrak - convert（转换
/** 0xcccccc , #cccccc , cccccc */
@property (nonatomic,copy) UIColor*             (^blockToColorFromHexStr)();
@property (nonatomic,copy) NSURL*               (^blockToNSURL)();
@property (nonatomic,copy) UIImage*             (^blockToUIImage)();
@property (nonatomic,copy) NSInteger            (^blockToInteger)();
@property (nonatomic,copy) long long            (^blockToLongLong)();
@property (nonatomic,copy) double               (^blockToDouble)();
@property (nonatomic,copy) float                (^blockToFloat)();
@property (nonatomic,copy) BOOL                 (^blockToBOOL)();
@property (nonatomic,copy) double               (^blockToDoubleFromHexStr)();
@property (nonatomic,copy) unsigned int         (^blockToIntFromHexStr)();
@property (nonatomic,copy) CGRect               (^blockToCGRect)();
@property (nonatomic,copy) CGVector             (^blockToCGVector)();
@property (nonatomic,copy) CGSize               (^blockToCGSize)();
@property (nonatomic,copy) CGPoint              (^blockToCGPoint)();
@property (nonatomic,copy) CGAffineTransform    (^blockToCGAffineTransform)();
@property (nonatomic,copy) UIEdgeInsets         (^blockToUIEdgeInsets)();
@property (nonatomic,copy) UIOffset             (^blockToUIOffset)();

@end
