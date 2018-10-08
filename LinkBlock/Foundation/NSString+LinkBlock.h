//
//  NSString+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

@interface NSObject(NSStringLinkBlock)

#pragma mark - Foundation Mirror/镜像
LBDeclare NSMutableString* (^strMutableCopy)(void);
LBDeclare BOOL         (^strIsEqualStr)(NSString* str);
LBDeclare NSNumber*    (^strIsEqualStrAs)(NSString* str);
LBDeclare NSNumber*    (^strLengthAs)(void);
LBDeclare NSString*    (^strAppend)(id obj);
LBDeclare NSString*    (^strAppendFormat)(NSString* formatStr , ...);
LBDeclare NSString*    (^strReplaceInRange)(NSString* str, NSRange range);
LBDeclare NSString*    (^strReplace)(NSString* replaceStr, NSString* withStr);
LBDeclare NSString*    (^strInsertAt)(NSString* str, NSUInteger index);
LBDeclare NSString*    (^strDeleteInRange)(NSRange range);
LBDeclare BOOL         (^strContains)(id obj);
LBDeclare NSNumber*    (^strContainsAs)(id obj);
LBDeclare NSRange      (^strRangeOfStr)(NSString* str);
LBDeclare NSComparisonResult (^strCompare)(NSString* str);
LBDeclare NSArray<NSString*>*     (^strSplitWithStr)(NSString* splitStr);
LBDeclare NSArray<NSString*>*     (^strSplitWithCharsStr)(NSString* splitStr);
LBDeclare BOOL         (^strHasPrefix)(NSString* prefix);
LBDeclare NSNumber*    (^strHasPrefixAs)(NSString* prefix);
LBDeclare BOOL         (^strHasSuffix)(NSString* suffix);
LBDeclare NSNumber*    (^strHasSuffixAs)(NSString* suffix);
LBDeclare NSString*    (^strSubFrom)(NSUInteger from);
LBDeclare NSString*    (^strSubTo)(NSUInteger to);
LBDeclare NSString*    (^strSubFromTo)(NSUInteger from , NSUInteger to);
LBDeclare NSString*    (^strSubWithRange)(NSRange range);
LBDeclare CGRect               (^strToCGRect)(void);
LBDeclare CGVector             (^strToCGVector)(void);
LBDeclare CGSize               (^strToCGSize)(void);
LBDeclare CGPoint              (^strToCGPoint)(void);
LBDeclare CGAffineTransform    (^strToCGAffineTransform)(void);
LBDeclare UIEdgeInsets         (^strToUIEdgeInsets)(void);
LBDeclare UIOffset             (^strToUIOffset)(void);



#pragma mark - Foundation Speed/速度
LBDeclare NSString*    (^strAt)(NSUInteger index);
/** compose string at */
LBDeclare NSString*    (^strComposeAt)(NSUInteger index);
LBDeclare NSString*    (^strDeleteStr)(NSString* str);
/** true mutable string */
LBDeclare NSNumber*    (^strIsMutableAs)(void);
LBDeclare NSString*    (^strAppendTo)(NSString* str);
LBDeclare NSInteger    (^strIndexOfStr)(NSString* str);

LBDeclare CGSize       (^strSizeWithFont)(UIFont* font);
LBDeclare NSValue*     (^strSizeWithFontAs)(UIFont* font);
LBDeclare CGSize       (^strSizeWithFontAndMaxWidth)(UIFont* font , CGFloat maxWidth);
LBDeclare NSValue*     (^strSizeWithFontAndMaxWidthAs)(UIFont* font , CGFloat maxWidth);
LBDeclare CGSize       (^strSizeWithFontAndMaxSize)(UIFont* font, CGSize maxSize);
LBDeclare NSValue*     (^strSizeWithFontAndMaxSizeAs)(UIFont* font, CGSize maxSize);
LBDeclare CGFloat      (^strHeight)(NSDictionary<NSAttributedStringKey,id>* attrDict);
LBDeclare CGFloat      (^strLineHeight)(NSDictionary<NSAttributedStringKey,id>* attrDict);
/** Reverse string */
LBDeclare NSString*    (^strReversed)(void);





#pragma mark - Foundation Extend/补充
LBDeclare NSUInteger   (^strLengthASCII)(void);
LBDeclare NSUInteger   (^strLengthUnicode)(void);
LBDeclare NSUInteger   (^strLengthComposed)(void);
LBDeclare NSString*    (^strAppendLine)(NSString* str);
/** set customRegex to find string as composed  */
LBDeclare NSUInteger   (^strCustomComposedLength)(NSString* customRegex);

#pragma mark - LinkBlock
/** Delete first matching string from left */
LBDeclare NSString*    (^strDeleteLeft)(NSString* str);
LBDeclare NSString*    (^strDeleteRight)(NSString* str);
/** Delete all matching strings from left until not match */
LBDeclare NSString*    (^strTrimLeft)(NSString* str);
LBDeclare NSString*    (^strTrimRight)(NSString* str);
/** Delete specified string at start and end */
LBDeclare NSString*    (^strTrim)(NSString* str);

LBDeclare NSString*    (^strSubComposeFrom)(NSUInteger from);
LBDeclare NSString*    (^strSubComposeTo)(NSUInteger to);
LBDeclare NSString*    (^strSubComposeFromTo)(NSUInteger from , NSUInteger to);

/** Empty string and "<null>","(null)" */
LBDeclare BOOL         (^strIsBlank)(void);
LBDeclare NSNumber*    (^strIsBlankAs)(void);
/** Determine Integer string/整型字符串 */
LBDeclare BOOL         (^strIsInteger)(void);
/** Determine Floating string/浮点数字符串 */
LBDeclare BOOL         (^strIsFloating)(void);

LBDeclare BOOL         (^strIsNumber)(void);
LBDeclare NSNumber*    (^strIsNumberAs)(void);
/** 判断包含汉字 */
LBDeclare BOOL         (^strContainszh_CN)(void);
LBDeclare NSNumber*    (^strContainszh_CNAs)(void);
LBDeclare BOOL         (^strContainsEmoji)(void);
LBDeclare NSNumber*    (^strContainsEmojiAs)(void);
LBDeclare BOOL         (^strIsEmoji)(void);
LBDeclare NSNumber*    (^strIsEmojiAs)(void);
/** 转unicode编码: @"我" => @"\u6211" */
LBDeclare NSString*    (^strToUnicoding)(void);
LBDeclare NSString*    (^strFromUnicoding)(void);
/** 范围内是否是汉字 */
LBDeclare BOOL         (^strIszh_CNInRange)(NSRange range);
LBDeclare NSNumber*    (^strIszh_CNInRangeAs)(NSRange range);
LBDeclare NSRange      (^strRange)(void);

LBDeclare NSInteger    (^strIndexOfStrStartAt)(NSString* str, NSUInteger startIndex);

/** '\n' */
LBDeclare NSUInteger   (^strLinesCount)(void);
/** '\n' */
LBDeclare NSString*    (^strSubToLine)(NSUInteger toLine);

/** line count of UI(Half-fold)/折半查找 */
LBDeclare NSInteger    (^strUILinesCount)(CGFloat maxWidth,NSDictionary<NSAttributedStringKey,id>* attrDict);
/** sub line of UI(Half-fold)/折半查找 */
LBDeclare NSString*    (^strSubToUILine)(NSInteger toLine, CGFloat maxWidth,NSDictionary<NSAttributedStringKey,id>* attrDict);
/**
 
 ... ... ... ...
 ... ... ... ...
 ... ifAppendStr
 
 The return value use to sub string,then append "ifAppendStr"
 Not suport image
 @param isFullOfLines if YES.May do this "...+ifAppendStr",or not contain"..."
 简单的计算反向挤压后的字符串可见范围
 */
LBDeclare NSRange (^strSubRangeToMaxUILineIfAppendStr)
(   NSUInteger maxLine ,
    CGFloat maxWidth,
    NSString* ifAppendStr ,
    NSDictionary<NSAttributedStringKey,id>* attrDict ,
    BOOL* isFullOfLines
 );

LBDeclare NSString*    (^strClearSpaceAndWrap)(void);
/** 12.3 < 12.4 , Foo2.txt , Foo7.txt ; */
LBDeclare NSComparisonResult (^strCompareNumberSensitive)(NSString* str);
/** copy to GeneralPasteboard */
LBDeclare NSString*    (^strCopyToGeneralPasteboard)(void);


#pragma mark - Weak coding  弱类型编码
LBDeclare UIView*              (^strSetToControlContentAsWhatSet)(UIView* textControl);
/** return NSNull is class did not exist */
LBDeclare NSObject*            (^strToObjectFromName)(void);
/** 0xcccccc , #cccccc , cccccc */
LBDeclare UIColor*             (^strToUIColorFromHex)(void);
LBDeclare NSURL*               (^strToNSURL)(void);
LBDeclare NSAttributedString*  (^strToNSAttributedString)(NSDictionary<NSAttributedStringKey,id>* attrbute);
LBDeclare NSMutableAttributedString*  (^strToNSMutableAttributedString)(NSDictionary<NSAttributedStringKey,id>* attrbute);
LBDeclare NSIndexPath*         (^strToNSIndexPathFromJsonArray)(NSStringEncoding encoding);

LBDeclare UIImage*             (^strToUIImage)(void);
LBDeclare NSNumber*            (^strToNSNumber)(void);
/** size is equal to UIImage */
LBDeclare UIImageView*         (^strToUIImageView)(void);
LBDeclare double               (^strToDoubleFromHex)(void);
LBDeclare unsigned int         (^strToIntFromHex)(void);
LBDeclare NSData*              (^strToNSDataWithContentsOfFile)(void);
LBDeclare NSData*              (^strToNSDataUseEncoding)(NSStringEncoding encodeing);
LBDeclare NSDate*              (^strToNSDateWithFormat)(NSString* formatStr);
LBDeclare NSDate*              (^strToNSDateSince1970)(void);
LBDeclare NSDictionary*        (^strToNSDictionary)(NSStringEncoding encoding);
LBDeclare NSArray*             (^strToNSArrary)(NSStringEncoding encoding);
LBDeclare NSPredicate*         (^strToPredicate)(void);
LBDeclare NSPredicate*         (^strToPredicateWidthFormatArgs)(id obj1 , ...);
/** note:you should relase it */
LBDeclare UInt32               (^strToSystemSoundID)(void);


#pragma mark - string as name
LBDeclare UIView*     (^strLoadNibNamedAt)(NSUInteger index);
LBDeclare UIView*     (^strLoadNibNamedFirst)(void);
LBDeclare UIView*     (^strLoadNibNamedLast)(void);


#pragma mark - string as path
/** get file in bundle by name */
LBDeclare NSString*    (^strPathByFileNameInBundle)(NSString* type);
LBDeclare NSString*    (^strPathAppendingComponent)(NSString* component);

LBDeclare BOOL         (^strPathFileExists)(void);
LBDeclare NSNumber*    (^strPathFileExistsAs)(void);
/** 
 Play sound and release
 exp:@"/System/Library/Audio/UISounds/Tock.caf".strPathSoundPlay();
 */
LBDeclare NSString*    (^strPathSoundPlay)(void);

LBDeclare NSString*    (^strPathArchiveObject)(id<NSCoding>obj);
LBDeclare NSObject*    (^strPathUnarchiveObjectAsWhatReturn)(void);


#pragma mark - string as regex
LBDeclare BOOL                 (^strRegexIsMatch)(NSString* regex);
LBDeclare NSNumber*            (^strRegexIsMatchAs)(NSString* regex);
/** 正则匹配，返回多个匹配结果 */
LBDeclare NSMutableArray<NSString*>* (^strRegexMatchs)(NSString* regex);
/**
 *  <^(NSString* regex, NSString* replaceTemplate)>
 *  正则表达式替换字符串子串
 *  regex : "http://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?".
 *  replaceTemplate : "<a href=\"$0\">$0</a>".
 */
LBDeclare NSString*            (^strRegexReplace)(NSString* regex, NSString* replaceTemplate);
/** 查找字符串中的第一组数字 */
LBDeclare double               (^strFindNumber)(void);


#pragma mark - string as predicate
/** <^(id obj)>谓词 */
LBDeclare BOOL                 (^strPredicateEvaluate)(id obj);
LBDeclare NSNumber*            (^strPredicateEvaluateAs)(id obj);
/** <^(id obj)>谓词 过滤数组；返回结果 */
LBDeclare NSArray*             (^strPredicateFilteredArray)(NSArray* arr);
/** <^(id obj)>谓词 过滤可变集合 NSMutableArray,NSMutableSet,NSMutableOrderedSet；返回谓词语句 */
LBDeclare NSString*            (^strPredicateFilterMutable)(id collection);
#pragma mark - string as URL string
/** <^(NSString* key)>字符串进行URL编码 */
LBDeclare NSString*            (^strByAddingPercentEncodingWithURLQueryAllowedCharacterSet)(void);
/** <^()>获取URL上键值对前的部分，可用于获取BaseURL，获取参数前的URL（即?前部分），但不对内容做验证 */
LBDeclare NSString*            (^strURLBeforeKeyValues)(void);
/** <^(NSString* key)>URL取值 */
LBDeclare NSString*            (^strURLValueForKey)(NSString* key);
/** <^(NSString* value,NSString* key)> */
LBDeclare NSString*            (^strURLSetValueForKey)(NSString* value,NSString* key);
/** <^(NSDictionary<NSString* key,NSString* value>* keyValues)> */
LBDeclare NSString*            (^strURLSetKeyValueWithDict)(NSDictionary<NSString*,NSString*>* keyValues);
/** <^()>URL键值对转字典 */
LBDeclare NSDictionary*        (^strURLKeyValues)(void);
/** <^()>获取URL上所有键 */
LBDeclare NSArray*             (^strURLAllKeys)(void);
/** <^()>获取URL上所有值 */
LBDeclare NSArray*             (^strURLAllValues)(void);
/** <^(NSString* key)>移除相关键及参数 */
LBDeclare NSString*            (^strURLRemoveValueForKey)(NSString* key);
/** <^(NSString* replaceKey,NSString* withKey)>替换键 */
LBDeclare NSString*            (^strURLReplaceKeyWithKey)(NSString* replaceKey,NSString* withKey);
/** <^(NSDictionary<NSString* key,NSString* value>* replaceKey_withKey)>替换键，字典结构为:key = replacedKey ;value = newKey */
LBDeclare NSString*            (^strURLReplaceKeyWithDict)(NSDictionary<NSString*,NSString*>* replaceKey_withKey);
/** <^()> */
LBDeclare NSString*            (^strURLEncodeUTF8)(void);
/** <^()> */
LBDeclare NSString*            (^strURLDecodeUTF8)(void);
/** <^(NSStringEncoding encode)> */
LBDeclare NSString*            (^strURLEncode)(NSStringEncoding encode);
/** <^(NSStringEncoding encode)> */
LBDeclare NSString*            (^strURLDecode)(NSStringEncoding encode);


#pragma mark - 键
/** KVC */
LBDeclare NSObject*            (^strKeyForValueWith)(id obj);
/** KVC */
LBDeclare NSObject*            (^strKeyPathForValueWith)(id obj);




#pragma mark - DynamicLink 动态
/**
 @param ... 参数以"nll,NSNotFond"结尾，以其可以区分结构体
 */
LBDeclare NSObject*    (^linkCodeEval)(id obj, ...);



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
 *  @param block 可以使用空字符串抹去一个值，而非nil；其中urlBeforeKeyValue为'?'前的部分
 *
 *  @return 结果
 */
- (NSString *)strEnumerateURLUsingBlock:(void(^)(NSString** urlBeforeKeyValue , NSString** key , NSString** value , BOOL* stop))block;
@end
