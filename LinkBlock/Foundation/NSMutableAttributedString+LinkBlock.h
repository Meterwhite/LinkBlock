//
//  NSMutableAttributedString+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef NSMutableAttributedStringNew
#define NSMutableAttributedStringNew ([NSMutableAttributedString new])
#endif
@interface NSObject(NSMutableAttributedStringLinkBlock)
/** <^(NSAttributedString* attrStr)> */
@property (nonatomic,copy,readonly) NSMutableAttributedString* (^m_attr_strAppendAttrStr)(NSAttributedString* attrStr);
/** <^(NSString* str)> */
@property (nonatomic,copy,readonly) NSMutableAttributedString* (^m_attr_strAppendStr)(NSString* str);
/** <^(NSString *str,NSString *attrName, id attrValue)> */
@property (nonatomic,copy,readonly) NSMutableAttributedString* (^m_attr_strAppendStrAndAttr)(NSString *str,NSString *attrName, id attrValue);
/** <^(NSString* str, NSDictionary* attrDic)> */
@property (nonatomic,copy,readonly) NSMutableAttributedString* (^m_attr_strAppendStrWithAttrDict)(NSString* str, NSDictionary* attrDic);
/** <^(NSAttributedString* attrStr, NSUInteger index)> */
@property (nonatomic,copy,readonly) NSMutableAttributedString* (^m_attr_strInsertAttrStrAtIndex)(NSAttributedString* attrStr, NSUInteger index);
/** <^(NSString* str , NSUInteger index)> */
@property (nonatomic,copy,readonly) NSMutableAttributedString* (^m_attr_strInsertStrAtIndex)(NSString* str , NSUInteger index);
/** <^(NSString *str,NSString *attrName, id attrValue,NSUInteger idx)> */
@property (nonatomic,copy,readonly) NSMutableAttributedString* (^m_attr_strInsertStrWithAttrAtIndex)(NSString *str,NSString *attrName, id attrValue,NSUInteger idx);
/** <^(NSString* str, NSDictionary* attrDic, NSUInteger index)> */
@property (nonatomic,copy,readonly) NSMutableAttributedString* (^m_attr_strInsertStrWithAttrDict)(NSString* str, NSDictionary* attrDic, NSUInteger index);

/** <^(UIFont* font)>注意：需要计算大小时必须设置的属性 */
@property (nonatomic,copy,readonly) NSMutableAttributedString* (^m_attr_strAddAttrFont)(UIFont* font);
/** <^(UIColor* color)>注意：需要计算大小时必须设置的属性 */
@property (nonatomic,copy,readonly) NSMutableAttributedString* (^m_attr_strAddAttrTextColor)(UIColor* color);
/** <^(NSString*attrName, id attrValue, NSRange range)> */
@property (nonatomic,copy,readonly) NSMutableAttributedString* (^m_attr_strAddAttrInRange)(NSString*attrName, id attrValue, NSRange range);
/** <^(NSString*attrName, id attrValue)> */
@property (nonatomic,copy,readonly) NSMutableAttributedString* (^m_attr_strAddAttr)(NSString*attrName, id attrValue);
/** <^(NSDictionary* attrDict)> */
@property (nonatomic,copy,readonly) NSMutableAttributedString* (^m_attr_strAddAttrDict)(NSDictionary* attrDict);
/** <^(UIColor* bgColor)> */
@property (nonatomic,copy,readonly) NSMutableAttributedString* (^m_attr_strAddAttrBGColor)(UIColor* bgColor);
/** <^(NSString* attrName)> */
@property (nonatomic,copy,readonly) NSMutableAttributedString* (^m_attr_strRemoveAttr)(NSString* attrName);
/** <^(NSString* attrName, NSRange range)> */
@property (nonatomic,copy,readonly) NSMutableAttributedString* (^m_attr_strRemoveAttrInRange)(NSString* attrName, NSRange range);
/** <^(NSRange range)> */
@property (nonatomic,copy,readonly) NSMutableAttributedString* (^m_attr_strDeleteStrInRange)(NSRange range);
/** <^(NSString *str,NSRange range)> */
@property (nonatomic,copy,readonly) NSMutableAttributedString* (^m_attr_strReplaceStrWithStrInRange)(NSString *str,NSRange range);

/** <^(NSString *forStr,NSDictionary* attrDict)>给匹配的内容设置属性 */
@property (nonatomic,copy,readonly) NSMutableAttributedString* (^m_attr_strSetAttrForStr)(NSString *forStr,NSDictionary* attrDict);
/** <^(NSString *forStr,NSDictionary* attrDict, NSRange range)>给匹配的内容设置属性 */
@property (nonatomic,copy,readonly) NSMutableAttributedString* (^m_attr_strSetAttrForStrInRange)(NSString *forStr,NSDictionary* attrDict, NSRange range);
/** <^(NSDictionary *attrDict, NSRange range)> */
@property (nonatomic,copy,readonly) NSMutableAttributedString* (^m_attr_strSetAttrDictInRange)(NSDictionary *attrDict, NSRange range);
/** <^(NSDictionary* attrDict)> */
@property (nonatomic,copy,readonly) NSMutableAttributedString* (^m_attr_strSetAttrDict)(NSDictionary* attrDict);

@end
