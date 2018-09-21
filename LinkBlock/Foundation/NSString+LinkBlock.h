//
//  NSString+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

@interface NSObject(NSStringLinkBlock)
#pragma mark - DynamicLink
/**
 @param ... 参数以nll,NSNotFond结尾，以其可以区分结构体
 */
LBDeclare NSObject*    (^linkCodeEval)(id obj, ...);

#pragma mark - 通用
/** <^(NSUInteger index)> */
LBDeclare NSString*    (^strAt)(NSUInteger index);
/** <^(NSUInteger index)>元字符 */
LBDeclare NSString*    (^strComposeAt)(NSUInteger index);
/** <^(NSString* str)> */
LBDeclare BOOL         (^strIsEqualStr)(NSString* str);
LBDeclare NSNumber*    (^strIsEqualStr_n)(NSString* str);
/** <^()> */
LBDeclare NSMutableString* (^strMutableCopy)(void);
/** <^(NSString* str)> */
LBDeclare NSString*    (^strAppend)(id obj);

/** <^(NSString* str)> */
LBDeclare NSString*    (^strAppendTo)(NSString* str);
/** <^(NSString* formatStr , ...)> */
LBDeclare NSString*    (^strAppendFormat)(NSString* formatStr , ...);
/** <^(NSString* str)> */
LBDeclare NSString*    (^strAppendLine)(NSString* str);
/** <^(NSString* str, NSUInteger index)> */
LBDeclare NSString*    (^strInsertAt)(NSString* str, NSUInteger index);
/** <^(NSRange range)> */
LBDeclare NSString*    (^strDeleteInRange)(NSRange range);
/** <^(NSString* str)> */
LBDeclare NSString*    (^strDeleteStr)(NSString* str);
/** <^(NSString* str, NSRange range)> */
LBDeclare NSString*    (^strReplaceInRange)(NSString* str, NSRange range);
/** <^(NSString* replaceStr, NSString* withStr)> */
LBDeclare NSString*    (^strReplace)(NSString* replaceStr, NSString* withStr);
/** <^(NSString* str)> */
LBDeclare BOOL         (^strContain)(NSString* str);
LBDeclare NSNumber*    (^strContain_n)(NSString* str);
/** <^()>字符串是否含有汉字 */
LBDeclare BOOL         (^strContainzh_CN)(void);
LBDeclare NSNumber*    (^strContainzh_CN_n)(void);
/** <^(NSRange range)>范围内是否是汉字 */
LBDeclare BOOL         (^strIszh_CNInRange)(NSRange range);
LBDeclare NSNumber*    (^strIszh_CNInRange_n)(NSRange range);
/** <^()>转unicode编码: @"我" => @"\u6211" */
LBDeclare NSString*    (^strToUnicoding)(void);
/** <^()>unicode编码转: @"\u6211" => @"我" */
LBDeclare NSString*    (^strFromUnicoding)(void);
/** <^(NSString* str)>无结果时返回NSNotFound */
LBDeclare NSRange      (^strRangeOfStr)(NSString* str);
/** <^()> */
LBDeclare NSRange      (^strRange)(void);
/** <^(NSString* str)>无结果时返回NSNotFound */
LBDeclare NSInteger    (^strIndexOfStr)(NSString* str);
/** <^(NSString* str, NSUInteger startIndex)>从某处开始的某字符串的位置。无结果时返回NSNotFound */
LBDeclare NSInteger    (^strIndexOfStrStartAt)(NSString* str, NSUInteger startIndex);

/** <^()>是否是表示空的字符串，包括全部空白符和字符串以及"<null>"，"(null)" */
LBDeclare BOOL         (^strIsBlank)(void);
LBDeclare NSNumber*    (^strIsBlank_n)(void);
/** <^()>判断emoji */
LBDeclare BOOL         (^strIsEmoji)(void);
LBDeclare NSNumber*    (^strIsEmoji_n)(void);
/** <^()> */
LBDeclare BOOL         (^strContainEmoji)(void);
LBDeclare NSNumber*    (^strContainEmoji_n)(void);
/** <^(UIFont* font)>通用视图排版中计算字符串尺寸 */
LBDeclare CGSize       (^strSizeWithFont)(UIFont* font);
LBDeclare NSValue*     (^strSizeWithFont_n)(UIFont* font);
/** <^(UIFont* font , CGFloat maxWidth)>通用视图排版中计算字符串尺寸 */
LBDeclare CGSize       (^strSizeWithFontAndMaxWidth)(UIFont* font , CGFloat maxWidth);
LBDeclare NSValue*     (^strSizeWithFontAndMaxWidth_n)(UIFont* font , CGFloat maxWidth);
/** <^(UIFont* font, CGSize maxSize)>通用视图排版中计算字符串尺寸 */
LBDeclare CGSize       (^strSizeWithFontAndMaxSize)(UIFont* font, CGSize maxSize);
LBDeclare NSValue*     (^strSizeWithFontAndMaxSize_n)(UIFont* font, CGSize maxSize);
/** <^(NSDictionary* attrDict)>计算字符串本身高度，不支持包含图片的计算 */
LBDeclare CGFloat      (^strHeight)(NSDictionary<NSAttributedStringKey,id>* attrDict);
/** <^(NSDictionary* attrDict)>计算字符串的行高，不支持包含图片的计算 */
LBDeclare CGFloat      (^strLineHeight)(NSDictionary<NSAttributedStringKey,id>* attrDict);
/** <^(CGFloat maxWidth,NSDictionary* attrDict)>视图排版中的文字的行数，不支持包含图片的计算 */
LBDeclare NSInteger    (^strUILinesCount)(CGFloat maxWidth,NSDictionary<NSAttributedStringKey,id>* attrDict);
/** <^()>字符串的行数'\n' */
LBDeclare NSUInteger   (^strLinesCount)(void);
/** <^(NSInteger toLine截取行数, CGFloat maxWidth,NSDictionary* attrDict)>视图排版中截一定视觉行数的字符串，不支持包含图片的计算；内部使用折半查找效率尚可 */
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
LBDeclare NSRange (^strSubRangeToMaxUILineIfAppendStr)(NSUInteger maxLine , CGFloat maxWidth, NSString* ifAppendStr ,NSDictionary<NSAttributedStringKey,id>* attrDict , BOOL* isFullOfLines);
/** <^(NSUInteger toLine截取行数)>截取到一定行数（换行符）的字符串 */
LBDeclare NSString*    (^strSubToLine)(NSUInteger toLine);
/** <^()> */
LBDeclare NSUInteger   (^strLength)(void);
LBDeclare NSNumber*    (^strLength_n)(void);
/** <^()>字符串按ASCII的长度 */
LBDeclare NSUInteger   (^strLengthASCII)(void);
/** <^()>字符串按Unicode的长度 */
LBDeclare NSUInteger   (^strLengthUnicode)(void);
/** <^()>字符串按元字符组成的序列的长度，即汉字，emoji等都作为一个字符 */
LBDeclare NSUInteger   (^strLengthComposed)(void);
/** <^(NSString* reg元字符正则)>字符串按元字符组成的序列和自定义正则规则元字符的长度，即每个字符，汉字，emoji，匹配，都视为一个元字符；参数传nil时和strLengthComposed()相同 */
LBDeclare NSUInteger   (^strLengthComposedAndCustom)(NSString* customReg);
/** <^()>去除所有空白符 */
LBDeclare NSString*    (^strClearSpaceAndWrap)(void);
/** <^(NSString* str)>对数字敏感的比较两个字符串：12.3 < 12.4; Foo2.txt < Foo7.txt ; */
LBDeclare NSComparisonResult (^strCompareNumberSensitive)(NSString* str);
/** <^(NSString* str)>通用字符串比较 */
LBDeclare NSComparisonResult (^strCompare)(NSString* str);
/** <^()>是否是整型字符串 */
LBDeclare BOOL         (^strIsInteger)(void);
/** <^()>是否是浮点数字符串 */
LBDeclare BOOL         (^strIsFloating)(void);
/** <^()>是否是数字类型 */
LBDeclare BOOL         (^strIsNumber)(void);
LBDeclare NSNumber*    (^strIsNumber_n)(void);
/** <^()>反转字符串 */
LBDeclare NSString*    (^strReversed)(void);
/** <^(NSString* str)>从左删除第一次匹配的字符串 */
LBDeclare NSString*    (^strDeleteLeft)(NSString* str);
/** <^(NSString* str)>从右删除第一次匹配的字符串 */
LBDeclare NSString*    (^strDeleteRight)(NSString* str);
/** <^(NSString* str)>从左删除所有匹配的字符串，直到第一次不匹配 */
LBDeclare NSString*    (^strTrimLeft)(NSString* str);
/** <^(NSString* str)>从右删除所有匹配的字符串，直到第一次不匹配 */
LBDeclare NSString*    (^strTrimRight)(NSString* str);
/** <^(NSString* str)>删除首尾字符 */
LBDeclare NSString*    (^strTrim)(NSString* str);
/** <^(NSString* splitStr)>分割字符串， 传入 "." ，"0-a.b.c.e-0" 变为  "0-a" "b" "c" "d" "e-0" */
LBDeclare NSArray<NSString*>*     (^strSplitWithStr)(NSString* splitStr);
/** <^(NSString* splitStr)>分割字符串，传入字符集类似@".-_" */
LBDeclare NSArray<NSString*>*     (^strSplitWithCharsStr)(NSString* splitStr);
/** <^(NSString* prefix)>是否包含开头 */
LBDeclare BOOL         (^strHasPrefix)(NSString* prefix);
LBDeclare NSNumber*    (^strHasPrefix_n)(NSString* prefix);
/** <^(NSString* suffix)>是否包含结尾 */
LBDeclare BOOL         (^strHasSuffix)(NSString* suffix);
LBDeclare NSNumber*    (^strHasSuffix_n)(NSString* suffix);
/** <^(NSUInteger from)> */
LBDeclare NSString*    (^strSubFrom)(NSUInteger from);
/** <^(NSUInteger to)不能取到to> */
LBDeclare NSString*    (^strSubTo)(NSUInteger to);
/** <^(NSUInteger from , NSUInteger to)包含to> */
LBDeclare NSString*    (^strSubFromTo)(NSUInteger from , NSUInteger to);
/** <^(NSRange range)> */
LBDeclare NSString*    (^strSubWithRange)(NSRange range);
/** <^(NSUInteger from)>按元字符截取字符串 */
LBDeclare NSString*    (^strSubComposeFrom)(NSUInteger from);
/** <^(NSUInteger to)不能取到to>按元字符截取字符串 */
LBDeclare NSString*    (^strSubComposeTo)(NSUInteger to);
/** <^(NSUInteger from , NSUInteger to)包含to>按元字符截取字符串 */
LBDeclare NSString*    (^strSubComposeFromTo)(NSUInteger from , NSUInteger to);
/** <^()>将字符串复制到通用剪贴板 */
LBDeclare NSString*    (^strCopyToGeneralPasteboard)(void);
#pragma mark - 文件
/** <^(NSString* type)>根据文件名获取Bundle中的文件 */
LBDeclare NSString*    (^strPathByFileNameInBundle)(NSString* type);
LBDeclare NSString*    (^strPathAppendingComponent)(NSString* component);
/** <^()>路径下文件是否存在 */
LBDeclare BOOL         (^strPathFileExists)(void);
LBDeclare NSNumber*    (^strPathFileExists_n)(void);
/** 
 <^()>播放路径下音效并释放
 播放系统键盘音：@"/System/Library/Audio/UISounds/Tock.caf".strPathSoundPlay();
 */
LBDeclare NSString*    (^strPathSoundPlay)(void);
/** <^(id<NSCoding>obj)>解档 */
LBDeclare NSString*    (^strPathArchiveObject)(id<NSCoding>obj);
/** <^()>归档，并以归档对象作为链条 */
LBDeclare NSObject*    (^strPathUnarchiveObject_linkTo)(void);
/** <^(NSUInteger index)>加载XIB，越界时返回NSNull */
LBDeclare __kindof UIView*     (^strLoadNibNamedAt)(NSUInteger index);
/** <^(NSUInteger index)>加载第一个XIB，越界时返回NSNull */
LBDeclare __kindof UIView*     (^strLoadNibNamedFirst)(void);
/** <^(NSUInteger index)>加载最后一个XIB，越界时返回NSNull */
LBDeclare __kindof UIView*     (^strLoadNibNamedLast)(void);
#pragma mark - 转换
/** <^()>根据字符串类名调用new方法创建对象，没有该类型时返回NSNull */
LBDeclare NSObject*            (^strToObjectFromName)(void);
/** <^()>字符串转颜色；包含格式：0xcccccc , #cccccc , cccccc */
LBDeclare UIColor*             (^strToUIColorFromHex)(void);
/** <^()> */
LBDeclare NSURL*               (^strToNSURL)(void);
/** <^(NSDictionary<NSAttributedStringKey,id>* attrbute)> */
LBDeclare NSAttributedString*  (^strToNSAttributedString)(NSDictionary<NSAttributedStringKey,id>* attrbute);
/** <^(NSDictionary<NSAttributedStringKey,id>* attrbute)> */
LBDeclare NSMutableAttributedString*  (^strToNSMutableAttributedString)(NSDictionary<NSAttributedStringKey,id>* attrbute);
/** <^(NSStringEncoding encoding)> */
LBDeclare NSIndexPath*         (^strToNSIndexPathFromJsonArray)(NSStringEncoding encoding);
/** <^()>根据文件名创建UIImage，不存在图片时返回NSNull */
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
#pragma mark - 设置到
/** <^(UILabel* lab)> */
LBDeclare UILabel*             (^strSetToLab_linkTo)(UILabel* lab);
/** <^(UIButton* btn)> */
LBDeclare UIButton*            (^strSetToBtn_linkTo)(UIButton* btn, UIControlState state);
/** <^(UITextField* txtField)> */
LBDeclare UITextField*         (^strSetToTxtField_linkTo)(UITextField* txtField);
/** <^(UITextView* txtView)> */
LBDeclare UITextView*          (^strSetToTxtView_linkTo)(UITextView* txtView);
#pragma mark - 正则
/** <^(NSString* regex)> */
LBDeclare BOOL                 (^strRegexIsMatch)(NSString* regex);
LBDeclare NSNumber*            (^strRegexIsMatch_n)(NSString* regex);
/** <^(NSString* regex)>正则匹配，返回多个匹配结果 */
LBDeclare NSMutableArray<NSString*>* (^strRegexMatchs)(NSString* regex);
/**
 *  <^(NSString* regex, NSString* replaceTemplate)>
 *  正则表达式替换字符串子串
 *  regex : "http://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?".
 *  replaceTemplate : "<a href=\"$0\">$0</a>".
 */
LBDeclare NSString*            (^strRegexReplace)(NSString* regex, NSString* replaceTemplate);
/** <^()>查找字符串中的第一组数字 */
LBDeclare double               (^strFindNumber)(void);
#pragma mark - 键
/** <^(id obj)>KVC取值 */
LBDeclare NSObject*            (^strKeyForValueWith)(id obj);
/** <^(id obj)>KVC取值 */
LBDeclare NSObject*            (^strKeyPathForValueWith)(id obj);
#pragma mark - 谓词
/** <^(id obj)>谓词 */
LBDeclare BOOL                 (^strPredicateEvaluate)(id obj);
LBDeclare NSNumber*            (^strPredicateEvaluate_n)(id obj);
/** <^(id obj)>谓词 过滤数组；返回结果 */
LBDeclare NSArray*             (^strPredicateFilteredArray)(NSArray* arr);
/** <^(id obj)>谓词 过滤可变集合 NSMutableArray,NSMutableSet,NSMutableOrderedSet；返回谓词语句 */
LBDeclare NSString*            (^strPredicateFilterMutable)(id collection);
#pragma mark - URL字符串操作
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
