//
//  NSMutableAttributedString+LinkBlock.h

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString(LinkBlock)
@property (nonatomic,copy) NSMutableAttributedString* (^blockAppendAttrStr)(NSAttributedString* attrStr);
@property (nonatomic,copy) NSMutableAttributedString* (^blockAppendStr)(NSString* str);
@property (nonatomic,copy) NSMutableAttributedString* (^blockAppendStrWithAttr)(NSString *str,NSString *attrName, id attrValue);
@property (nonatomic,copy) NSMutableAttributedString* (^blockAppendStrWithAttrDict)(NSString* str, NSDictionary* attrDic);

@property (nonatomic,copy) NSMutableAttributedString* (^blockInsertAttrStrAtIndex)(NSAttributedString* attrStr, NSUInteger index);
@property (nonatomic,copy) NSMutableAttributedString* (^blockInsertStrAtIndex)(NSString* str , NSUInteger index);
@property (nonatomic,copy) NSMutableAttributedString* (^blockInsertStrWithAttrAtIndex)(NSString *str,NSString *attrName, id attrValue,NSUInteger idx);
@property (nonatomic,copy) NSMutableAttributedString* (^blockInsertStrWithAttrDict)(NSString* str, NSDictionary* attrDic, NSUInteger index);

/** 注意：需要计算大小时必须设置的属性 */
/** !:This is when you need to calculate the size of the property must be set */
@property (nonatomic,copy) NSMutableAttributedString* (^blockAddAttrFont)(UIFont* font);
/** 注意：需要计算大小时必须设置的属性 */
/** !:This is when you need to calculate the size of the property must be set */
@property (nonatomic,copy) NSMutableAttributedString* (^blockAddAttrTextColor)(UIColor* color);

@property (nonatomic,copy) NSMutableAttributedString* (^blockAddAttrInRange)(NSString*attrName, id attrValue, NSRange range);
@property (nonatomic,copy) NSMutableAttributedString* (^blockAddAttr)(NSString*attrName, id attrValue);
@property (nonatomic,copy) NSMutableAttributedString* (^blockAddAttrDict)(NSDictionary* attrDict);

@property (nonatomic,copy) NSMutableAttributedString* (^blockAddAttrBGColor)(UIColor* bgColor);

@property (nonatomic,copy) NSMutableAttributedString* (^blockRemoveAttr)(NSString* attrName);
@property (nonatomic,copy) NSMutableAttributedString* (^blockRemoveAttrInRange)(NSString* attrName, NSRange range);

@property (nonatomic,copy) NSMutableAttributedString* (^blockDeleteStrInRange)(NSRange range);
@property (nonatomic,copy) NSMutableAttributedString* (^blockReplaceStrWithStrInRange)(NSString *str,NSRange range);

/** 给匹配的内容设置属性 */
/** Set this property to match the string  */
@property (nonatomic,copy) NSMutableAttributedString* (^blockSetAttrForStr)(NSString *forStr,NSDictionary* attrDict);
/** 给匹配的内容设置属性 */
/** Set this property to match the string  */
@property (nonatomic,copy) NSMutableAttributedString* (^blockSetAttrForStrInRange)(NSString *forStr,NSDictionary* attrDict, NSRange);

@property (nonatomic,copy) NSMutableAttributedString* (^blockSetAttrDictInRange)(NSDictionary *attrDict, NSRange range);
@property (nonatomic,copy) NSMutableAttributedString* (^blockSetAttrDict)(NSDictionary* attrDict);

@end
