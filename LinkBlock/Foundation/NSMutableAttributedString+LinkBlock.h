//
//  NSMutableAttributedString+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

#ifndef NSMutableAttributedStringNew
#define NSMutableAttributedStringNew ([NSMutableAttributedString new])
#endif
@interface NSObject(NSMutableAttributedStringLinkBlock)
/** <^(NSAttributedString* attrStr)> */
LBDeclare NSMutableAttributedString* (^m_attr_strAppendAttrStr)(NSAttributedString* attrStr);
/** <^(NSString* str)> */
LBDeclare NSMutableAttributedString* (^m_attr_strAppendStr)(NSString* str);
/** <^(NSString *str,NSString *attrName, id attrValue)> */
LBDeclare NSMutableAttributedString* (^m_attr_strAppendStrAndAttr)(NSString *str,NSString *attrName, id attrValue);
/** <^(NSString* str, NSDictionary* attrDic)> */
LBDeclare NSMutableAttributedString* (^m_attr_strAppendStrWithAttrDict)(NSString* str, NSDictionary* attrDic);
/** <^(NSAttributedString* attrStr, NSUInteger index)> */
LBDeclare NSMutableAttributedString* (^m_attr_strInsertAttrStrAtIndex)(NSAttributedString* attrStr, NSUInteger index);
/** <^(NSString* str , NSUInteger index)> */
LBDeclare NSMutableAttributedString* (^m_attr_strInsertStrAtIndex)(NSString* str , NSUInteger index);
/** <^(NSString *str,NSString *attrName, id attrValue,NSUInteger idx)> */
LBDeclare NSMutableAttributedString* (^m_attr_strInsertStrWithAttrAtIndex)(NSString *str,NSString *attrName, id attrValue,NSUInteger idx);
/** <^(NSString* str, NSDictionary* attrDic, NSUInteger index)> */
LBDeclare NSMutableAttributedString* (^m_attr_strInsertStrWithAttrDict)(NSString* str, NSDictionary* attrDic, NSUInteger index);

/** <^(UIFont* font)>注意：需要计算大小时必须设置的属性 */
LBDeclare NSMutableAttributedString* (^m_attr_strAddAttrFont)(UIFont* font);
/** <^(UIColor* color)>注意：需要计算大小时必须设置的属性 */
LBDeclare NSMutableAttributedString* (^m_attr_strAddAttrTextColor)(UIColor* color);
/** <^(NSString*attrName, id attrValue, NSRange range)> */
LBDeclare NSMutableAttributedString* (^m_attr_strAddAttrInRange)(NSString*attrName, id attrValue, NSRange range);
/** <^(NSString*attrName, id attrValue)> */
LBDeclare NSMutableAttributedString* (^m_attr_strAddAttr)(NSString*attrName, id attrValue);
/** <^(NSDictionary* attrDict)> */
LBDeclare NSMutableAttributedString* (^m_attr_strAddAttrDict)(NSDictionary* attrDict);
/** <^(UIColor* bgColor)> */
LBDeclare NSMutableAttributedString* (^m_attr_strAddAttrBGColor)(UIColor* bgColor);
/** <^(NSString* attrName)> */
LBDeclare NSMutableAttributedString* (^m_attr_strRemoveAttr)(NSString* attrName);
/** <^(NSString* attrName, NSRange range)> */
LBDeclare NSMutableAttributedString* (^m_attr_strRemoveAttrInRange)(NSString* attrName, NSRange range);
/** <^(NSRange range)> */
LBDeclare NSMutableAttributedString* (^m_attr_strDeleteStrInRange)(NSRange range);
/** <^(NSString *str,NSRange range)> */
LBDeclare NSMutableAttributedString* (^m_attr_strReplaceStrWithStrInRange)(NSString *str,NSRange range);

/** <^(NSString *forStr,NSDictionary* attrDict)>给匹配的内容设置属性 */
LBDeclare NSMutableAttributedString* (^m_attr_strSetAttrForStr)(NSString *forStr,NSDictionary* attrDict);
/** <^(NSString *forStr,NSDictionary* attrDict, NSRange range)>给匹配的内容设置属性 */
LBDeclare NSMutableAttributedString* (^m_attr_strSetAttrForStrInRange)(NSString *forStr,NSDictionary* attrDict, NSRange range);
/** <^(NSDictionary *attrDict, NSRange range)> */
LBDeclare NSMutableAttributedString* (^m_attr_strSetAttrDictInRange)(NSDictionary *attrDict, NSRange range);
/** <^(NSDictionary* attrDict)> */
LBDeclare NSMutableAttributedString* (^m_attr_strSetAttrDict)(NSDictionary* attrDict);
/** <^(UILabel* lab)>属性文本设置到Label，切换链条到参数 */
LBDeclare UILabel* (^m_attr_strSetToLabelAsWhatSet)(UILabel* lab);
@end
