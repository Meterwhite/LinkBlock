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
#pragma mark - Foundation Mirror/镜像
LBDeclare NSMutableDictionary* (^m_dictSetWithKeyObject)(id key , id object);
LBDeclare NSMutableDictionary* (^m_dictAddEntries)(NSDictionary* dict);

//#pragma mark - Foundation Extend/多择
//#pragma mark - Weak coding/弱类型编码

#pragma mark - LinkBlock
/** 替换字典中的key */
LBDeclare NSMutableDictionary* (^m_dictReplaceForKey)(id key, id newKey);
/** 深度遍历 */
LBDeclare NSMutableDictionary* (^m_dictReplaceForKeyDepth)(id key, id newKey);


#pragma mark - Foundation Speed/速度
#pragma  mark - NSAttributeString
/** ********************For NSAttributeString******************** */

#ifndef AttrDictNew
#define AttrDictNew NSMutableDictionaryNew
#endif

#ifndef AttrDictNewWithSize
#define AttrDictNewWithSize(size) (NSMutableDictionaryNew.makeAttrDictFontSizeAndTextColor(size, [UIColor blackColor]))
#endif


LBDeclare NSMutableDictionary* (^makeAttrDictFontSizeAndTextColor)(CGFloat fontSize , UIColor* titleColor);
LBDeclare NSMutableDictionary* (^makeAttrDictFont)(UIFont* font);
LBDeclare NSMutableDictionary* (^makeAttrDictTextColor)(UIColor* textColor);
LBDeclare NSMutableDictionary* (^makeAttrDictBGColor)(UIColor* bgColor);
LBDeclare NSMutableDictionary* (^makeAttrDictAttachment)(NSTextAttachment* attachment);
LBDeclare NSMutableDictionary* (^makeAttrDictParagraphStyle)(NSParagraphStyle* paragraphStyle);
LBDeclare NSMutableDictionary* (^makeAttrDictLigature)(NSNumber *num);
LBDeclare NSMutableDictionary* (^makeAttrDictKern)(NSNumber *num);
LBDeclare NSMutableDictionary* (^makeAttrDictStrikethroughStyle)(NSNumber *num);
LBDeclare NSMutableDictionary* (^makeAttrDictUnderlineStyle)(NSUnderlineStyle underlineStyle);
LBDeclare NSMutableDictionary* (^makeAttrDictStrokeColor)(UIColor* bgColor);
LBDeclare NSMutableDictionary* (^makeAttrDictStrokeWidth)(NSNumber *num);
LBDeclare NSMutableDictionary* (^makeAttrDictShadow)(NSShadow* shadown);
LBDeclare NSMutableDictionary* (^makeAttrDictTextEffect)(NSString* textEffect);
LBDeclare NSMutableDictionary* (^makeAttrDictLink)(NSURL* linkURL);
LBDeclare NSMutableDictionary* (^makeAttrDictBaselineOffset)(NSNumber *num);
LBDeclare NSMutableDictionary* (^makeAttrDictUnderlineColor)(UIColor* underlineColor);
LBDeclare NSMutableDictionary* (^makeAttrDictStrikethroughColor)(UIColor* bgColor);
LBDeclare NSMutableDictionary* (^makeAttrDictObliquenes)(NSNumber *num);
LBDeclare NSMutableDictionary* (^makeAttrDictExpansion)(NSNumber *num);
LBDeclare NSMutableDictionary* (^makeAttrDictWritingDirection)(NSArray* writingDirection);
LBDeclare NSMutableDictionary* (^makeAttrDictVerticalGlyphForm)(NSNumber *num);
@end

