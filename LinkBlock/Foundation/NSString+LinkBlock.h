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
/** <^(NSRange range)> */
LBDeclare NSString*    (^strSubWithRange)(NSRange range);




#pragma mark - Foundation Speed/速度
LBDeclare NSString*    (^strAt)(NSUInteger index);
/** 元字符 */
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
/** 逆序字符串 */
LBDeclare NSString*    (^strReversed)(void);





#pragma mark - Foundation Extend/延伸
/** 字符串按ASCII的长度 */
LBDeclare NSUInteger   (^strLengthASCII)(void);
/** 字符串按Unicode的长度 */
LBDeclare NSUInteger   (^strLengthUnicode)(void);
/** 按元字符的长度 */
LBDeclare NSUInteger   (^strLengthComposed)(void);
LBDeclare NSString*    (^strAppendLine)(NSString* str);

#pragma mark - LinkBlock
/** 从左删除第一次匹配的字符串 */
LBDeclare NSString*    (^strDeleteLeft)(NSString* str);
/** 从右删除第一次匹配的字符串 */
LBDeclare NSString*    (^strDeleteRight)(NSString* str);
/** 从左删除所有匹配的字符串，直到第一次不匹配 */
LBDeclare NSString*    (^strTrimLeft)(NSString* str);
/** 从右删除所有匹配的字符串，直到第一次不匹配 */
LBDeclare NSString*    (^strTrimRight)(NSString* str);
/** 删除首尾字符 */
LBDeclare NSString*    (^strTrim)(NSString* str);

/** 按元字符截取字符串 */
LBDeclare NSString*    (^strSubComposeFrom)(NSUInteger from);
/** 不能取到to>按元字符截取字符串 */
LBDeclare NSString*    (^strSubComposeTo)(NSUInteger to);
/** 包含to>按元字符截取字符串 */
LBDeclare NSString*    (^strSubComposeFromTo)(NSUInteger from , NSUInteger to);

/** 表示空白的字符串，包括全部空白符和字符串以及"<null>"，"(null)" */
LBDeclare BOOL         (^strIsBlank)(void);
LBDeclare NSNumber*    (^strIsBlankAs)(void);
/** 是否是整型字符串 */
LBDeclare BOOL         (^strIsInteger)(void);
/** 是否是浮点数字符串 */
LBDeclare BOOL         (^strIsFloating)(void);
/** 是否是数字类型 */
LBDeclare BOOL         (^strIsNumber)(void);
LBDeclare NSNumber*    (^strIsNumberAs)(void);
/** 字符串是否含有汉字 */
LBDeclare BOOL         (^strContainszh_CN)(void);
LBDeclare NSNumber*    (^strContainszh_CNAs)(void);
LBDeclare BOOL         (^strContainsEmoji)(void);
LBDeclare NSNumber*    (^strContainsEmojiAs)(void);
LBDeclare BOOL         (^strIsEmoji)(void);
LBDeclare NSNumber*    (^strIsEmojiAs)(void);
/** <^()>转unicode编码: @"我" => @"\u6211" */
LBDeclare NSString*    (^strToUnicoding)(void);
/** <^()>unicode编码转: @"\u6211" => @"我" */
LBDeclare NSString*    (^strFromUnicoding)(void);
/** 范围内是否是汉字 */
LBDeclare BOOL         (^strIszh_CNInRange)(NSRange range);
LBDeclare NSNumber*    (^strIszh_CNInRangeAs)(NSRange range);
LBDeclare NSRange      (^strRange)(void);
/** 索引处寻找，字符串的位置 */
LBDeclare NSInteger    (^strIndexOfStrStartAt)(NSString* str, NSUInteger startIndex);
/** <^(NSString* reg元字符正则)>按元字符和自定义正则规则作为元字符的长度，即每个字符，汉字，emoji，一次匹配，都视为一个元字符；参数传nil时和strLengthComposed()相同 */
LBDeclare NSUInteger   (^strLengthComposedAndCustom)(NSString* customReg);
/** 字符串的行数'\n' */
LBDeclare NSUInteger   (^strLinesCount)(void);
/** des to '\n' */
LBDeclare NSString*    (^strSubToLine)(NSUInteger toLine);

/** 视图排版中的文字的行数，不支持包含图片的计算，内部使用折半查找效率尚可 */
LBDeclare NSInteger    (^strUILinesCount)(CGFloat maxWidth,NSDictionary<NSAttributedStringKey,id>* attrDict);
/** 视图排版中截一定视觉行数的字符串，不支持包含图片的计算；内部使用折半查找效率尚可 */
LBDeclare NSString*    (^strSubToUILine)(NSInteger toLine, CGFloat maxWidth,NSDictionary<NSAttributedStringKey,id>* attrDict);
/**
 获取特定的文本长度，指定最大宽度下满足:
 如果指定结尾字符，例如：@"全文"（可以做点击功能）、@""（可以去掉末尾省略号刚好显示完整，也可以传空）
 ，那么返回文本在指定行高下不会截断以展示系统省略号，而是刚好排满指定行数或者未能排满最后一行，如果内容已经超出指定行数则计算时应用'...XXX'，如果未排满则应用'XXX'；根据isFullOfLines的返回值来判断用哪种形式拼接
 应用场景1：在文本最后做：...全文
 应用场景2：不展示系统省略号
 不支持包含图片的计算!
 内部使用折半查找效率尚可
 
 @param maxLine 最大行数
 @param ifAppendStr 结尾文本
 @param isFullOfLines 是否填满指定行数，如果返回YES则用户在拼接时使用@"..."+ifAppendStr形式
 
 @return 返回需要的内容范围
 */
LBDeclare NSRange (^strSubRangeToMaxUILineIfAppendStr)
(   NSUInteger maxLine ,
    CGFloat maxWidth,
    NSString* ifAppendStr ,
    NSDictionary<NSAttributedStringKey,id>* attrDict ,
    BOOL* isFullOfLines
 );
/** 去除所有空白符 */
LBDeclare NSString*    (^strClearSpaceAndWrap)(void);
/** 对数字敏感的比较两个字符串：12.3 < 12.4; Foo2.txt < Foo7.txt ; */
LBDeclare NSComparisonResult (^strCompareNumberSensitive)(NSString* str);
/** <^()>将字符串复制到通用剪贴板 */
LBDeclare NSString*    (^strCopyToGeneralPasteboard)(void);


#pragma mark - weaken strong type  类型弱化
/** 调用后将链条切换到参数 */
LBDeclare UIView*              (^strSetToViewContentAsWhatSet)(UIView* textControl);
/** <^()>根据字符串类名调用new方法创建对象，没有该类型时返回NSNull */
LBDeclare NSObject*            (^strToObjectFromName)(void);
/** <^()>字符串转颜色；包含格式：0xcccccc , #cccccc , cccccc */
LBDeclare UIColor*             (^strToUIColorFromHex)(void);
/** <^()> */
LBDeclare NSURL*               (^strToNSURL)(void);
LBDeclare NSAttributedString*  (^strToNSAttributedString)(NSDictionary<NSAttributedStringKey,id>* attrbute);
LBDeclare NSMutableAttributedString*  (^strToNSMutableAttributedString)(NSDictionary<NSAttributedStringKey,id>* attrbute);
/** <^(NSStringEncoding encoding)> */
LBDeclare NSIndexPath*         (^strToNSIndexPathFromJsonArray)(NSStringEncoding encoding);
/** 根据文件名创建UIImage，不存在图片时返回NSNull */
LBDeclare UIImage*             (^strToUIImage)(void);
/** <^()>可以解析NSInteger,double,十六进制整数(unsigned int) */
LBDeclare NSNumber*            (^strToNSNumber)(void);
/** <^()>根据文件名创建UIImageView，控件尺寸与图片原尺寸相同 */
LBDeclare UIImageView*         (^strToUIImageView)(void);
/** <^()>十六进制字符串转double */
LBDeclare double               (^strToDoubleFromHex)(void);
/** <^()>十六进制字符串转unsigned int */
LBDeclare unsigned int         (^strToIntFromHex)(void);
/** <^()>@"{{x,y},{w,h}}".strToCGRect() */
LBDeclare CGRect               (^strToCGRect)(void);
/** <^()>@"{x,y}".strToCGVector() */
LBDeclare CGVector             (^strToCGVector)(void);
/** <^()>@"{w,h}".strToCGSize() */
LBDeclare CGSize               (^strToCGSize)(void);
/** <^()>@"{x,y}".strToCGPoint() */
LBDeclare CGPoint              (^strToCGPoint)(void);
/** <^()>@"{a, b, c, d, tx, ty}".strToCGAffineTransform() */
LBDeclare CGAffineTransform    (^strToCGAffineTransform)(void);
/** <^()>@"{top, left, bottom, right}".strToUIEdgeInsets() */
LBDeclare UIEdgeInsets         (^strToUIEdgeInsets)(void);
/** <^()>@"{x,y}".strToUIOffset() */
LBDeclare UIOffset             (^strToUIOffset)(void);
/** <^()>路径转NSData */
LBDeclare NSData*              (^strToNSDataWithContentsOfFile)(void);
/** <^(NSStringEncoding encodeing)>转NSData */
LBDeclare NSData*              (^strToNSDataUseEncoding)(NSStringEncoding encodeing);
/** <^(NSString* formatStr)>日期字符串转日期 */
LBDeclare NSDate*              (^strToNSDateWithFormat)(NSString* formatStr);
/** <^()>数字字符串转日期 */
LBDeclare NSDate*              (^strToNSDateSince1970)(void);
/** <^(NSStringEncoding encoding)>json形式字符串转字典 */
LBDeclare NSDictionary*        (^strToNSDictionary)(NSStringEncoding encoding);
/** <^(NSStringEncoding encoding)>json形式字符串转数组 */
LBDeclare NSArray*             (^strToNSArrary)(NSStringEncoding encoding);
/** <^()>字符串转谓词 */
LBDeclare NSPredicate*         (^strToPredicate)(void);
/** <^(id obj1 , ...)>字符串转谓词，可带参数 */
LBDeclare NSPredicate*         (^strToPredicateWidthFormatArgs)(id obj1 , ...);
/** <^()>路径转系统音效ID；注意释放 */
LBDeclare UInt32               (^strToSystemSoundID)(void);


#pragma mark - string as name
/** <^(NSUInteger index)>加载XIB，越界时返回NSNull */
LBDeclare __kindof UIView*     (^strLoadNibNamedAt)(NSUInteger index);
/** <^(NSUInteger index)>加载第一个XIB，越界时返回NSNull */
LBDeclare __kindof UIView*     (^strLoadNibNamedFirst)(void);
/** <^(NSUInteger index)>加载最后一个XIB，越界时返回NSNull */
LBDeclare __kindof UIView*     (^strLoadNibNamedLast)(void);


#pragma mark - string as path
/** <^(NSString* type)>根据文件名获取Bundle中的文件 */
LBDeclare NSString*    (^strPathByFileNameInBundle)(NSString* type);
LBDeclare NSString*    (^strPathAppendingComponent)(NSString* component);
/** <^()>路径下文件是否存在 */
LBDeclare BOOL         (^strPathFileExists)(void);
LBDeclare NSNumber*    (^strPathFileExistsAs)(void);
/** 
 <^()>播放路径下音效并释放
 播放系统键盘音：@"/System/Library/Audio/UISounds/Tock.caf".strPathSoundPlay();
 */
LBDeclare NSString*    (^strPathSoundPlay)(void);
/** <^(id<NSCoding>obj)>解档 */
LBDeclare NSString*    (^strPathArchiveObject)(id<NSCoding>obj);
/** <^()>归档，并以归档对象作为链条 */
LBDeclare NSObject*    (^strPathUnarchiveObjectAsWhatReturn)(void);


#pragma mark - string as regex
LBDeclare BOOL                 (^strRegexIsMatch)(NSString* regex);
LBDeclare NSNumber*            (^strRegexIsMatchAs)(NSString* regex);
/** <^(NSString* regex)>正则匹配，返回多个匹配结果 */
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
