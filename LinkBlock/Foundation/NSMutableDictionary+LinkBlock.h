//
//  NSMutableDictionary+Linkm_dict.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

#ifndef NSMutableDictionaryNew
#define NSMutableDictionaryNew ([NSMutableDictionary new])
#endif
@interface NSObject(NSMutableDictionaryLinkBlock)
/** <^(id<NSCopying> key , id value)>赋值 */
LBDeclare NSMutableDictionary* (^m_dictSetValue)(id<NSCopying> key , id value);
/* <^(id<NSCopying> replaceKey, id<NSCopying> withKey)>替换字典中的key，层次遍历字典和数组 */
LBDeclare NSMutableDictionary* (^m_dictReplaceKey)(id<NSCopying> replaceKey, id<NSCopying> withKey);
/** <^(id<NSCopying> replaceKey, id<NSCopying> withKey)>替换字典中的key，非遍历的 */
LBDeclare NSMutableDictionary* (^m_dictReplaceKeyWithoutDeep)(id<NSCopying> replaceKey, id<NSCopying> withKey);
/** <^(NSDictionary* dict)>并集，由传入参数覆盖原来数据 */
LBDeclare NSMutableDictionary* (^m_dictUnionDict)(NSDictionary* dict);

/** ********************NSAttributeString设置部分******************** */

#ifndef AttrDictNew
#define AttrDictNew NSMutableDictionaryNew
#endif

#ifdef AttrDictNewWithSize
#define AttrDictNewWithSize(size) (NSMutableDictionaryNew.makeAttrDictFontSizeAndTextColor(15, [UIColor blackColor]))
#endif

/** <^(CGFloat fontSize , UIColor* titleColor)>titleColor默认为黑色 */
LBDeclare NSMutableDictionary* (^makeAttrDictFontSizeAndTextColor)(CGFloat fontSize , UIColor* titleColor);
/** <^(UIFont* font)> */
LBDeclare NSMutableDictionary* (^makeAttrDictFont)(UIFont* font);
/** <^(UIColor* textColor)> */
LBDeclare NSMutableDictionary* (^makeAttrDictTextColor)(UIColor* textColor);
/** <^(UIColor* bgColor)> */
LBDeclare NSMutableDictionary* (^makeAttrDictBGColor)(UIColor* bgColor);
/** <^(NSTextAttachment* attachment)> */
LBDeclare NSMutableDictionary* (^makeAttrDictAttachment)(NSTextAttachment* attachment);
/** <^(NSParagraphStyle* paragraphStyle)> */
LBDeclare NSMutableDictionary* (^makeAttrDictParagraphStyle)(NSParagraphStyle* paragraphStyle);
/** <^(NSNumber *num)> */
LBDeclare NSMutableDictionary* (^makeAttrDictLigature)(NSNumber *num);
/** <^(NSNumber *num)> */
LBDeclare NSMutableDictionary* (^makeAttrDictKern)(NSNumber *num);
/** <^(NSNumber *num)> */
LBDeclare NSMutableDictionary* (^makeAttrDictStrikethroughStyle)(NSNumber *num);
/** <^(NSUnderlineStyle underlineStyle)> */
LBDeclare NSMutableDictionary* (^makeAttrDictUnderlineStyle)(NSUnderlineStyle underlineStyle);
/** <^(UIColor* bgColor)> */
LBDeclare NSMutableDictionary* (^makeAttrDictStrokeColor)(UIColor* bgColor);
/** <^(NSNumber *num)> */
LBDeclare NSMutableDictionary* (^makeAttrDictStrokeWidth)(NSNumber *num);
/** <^(NSShadow* shadown)> */
LBDeclare NSMutableDictionary* (^makeAttrDictShadow)(NSShadow* shadown);
/** <^(NSString* textEffect)> */
LBDeclare NSMutableDictionary* (^makeAttrDictTextEffect)(NSString* textEffect);
/** <^(NSURL* linkURL)> */
LBDeclare NSMutableDictionary* (^makeAttrDictLink)(NSURL* linkURL);
/** <^(NSNumber *num)> */
LBDeclare NSMutableDictionary* (^makeAttrDictBaselineOffset)(NSNumber *num);
/** <^(UIColor* underlineColor)> */
LBDeclare NSMutableDictionary* (^makeAttrDictUnderlineColor)(UIColor* underlineColor);
/** <^(UIColor* bgColor)> */
LBDeclare NSMutableDictionary* (^makeAttrDictStrikethroughColor)(UIColor* bgColor);
/** <^(NSNumber *num)> */
LBDeclare NSMutableDictionary* (^makeAttrDictObliquenes)(NSNumber *num);
/** <^(NSNumber *num)> */
LBDeclare NSMutableDictionary* (^makeAttrDictExpansion)(NSNumber *num);
/** <^(NSArray* writingDirection)> */
LBDeclare NSMutableDictionary* (^makeAttrDictWritingDirection)(NSArray* writingDirection);
/** <^(NSNumber *num)> */
LBDeclare NSMutableDictionary* (^makeAttrDictVerticalGlyphForm)(NSNumber *num);
@end

