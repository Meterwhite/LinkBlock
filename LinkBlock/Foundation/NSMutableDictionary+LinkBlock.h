//
//  NSMutableDictionary+Linkm_dict.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject(NSMutableDictionaryLinkBlock)
/** 安全赋值 */
@property (nonatomic,copy) NSMutableDictionary* (^m_dictSetValue)(id<NSCopying> key , id value);
/* 字典转模型：替换字典中的key，层次遍历字典和数组 */
@property (nonatomic,copy) NSMutableDictionary* (^m_dictReplaceKey)(id<NSCopying> replaceKey, id<NSCopying> withKey);
/** 字典转模型：替换字典中的key，非遍历的 */
@property (nonatomic,copy) NSMutableDictionary* (^m_dictReplaceKeyWithoutDeep)(id<NSCopying> replaceKey, id<NSCopying> withKey);
@property (nonatomic,copy) id                   (^m_dictGet)(id<NSCopying> key);
@property (nonatomic,copy) id                   (^m_dictGetNoNSNull)(id<NSCopying> key);
@property (nonatomic,copy) NSDictionary*        (^m_dictGetDictNoNullType)(id<NSCopying> key);
@property (nonatomic,copy) NSArray*             (^m_dictGetArrNoNullType)(id<NSCopying> key);
@property (nonatomic,copy) BOOL                 (^m_dictGetBOOLNoNullType)(id<NSCopying> key);
@property (nonatomic,copy) UIView*              (^m_dictGetViewNoNullType)(id<NSCopying> key);
@property (nonatomic,copy) BOOL                 (^m_dictContainerKey)(id<NSCopying> key);
@property (nonatomic,copy) BOOL                 (^m_dictContainerValue)(id value);
@property (nonatomic,copy) NSArray*             (^m_dictAllKeys)();
@property (nonatomic,copy) NSArray*             (^m_dictAllValues)();
@property (nonatomic,copy) NSArray*             (^m_dictKeysForValue)(id value);
/** 并集，由传入参数覆盖原来数据 */
@property (nonatomic,copy) NSMutableDictionary* (^m_dictUnionDict)(NSDictionary* dict);

/** ********************NSAttributeString设置部分******************** */

#define AttrDictNew ([NSMutableDictionary new])

@property (nonatomic,copy) NSMutableDictionary* (^makeAttrDictFont)(UIFont* font);
@property (nonatomic,copy) NSMutableDictionary* (^makeAttrDictTextColor)(UIColor* textColor);
@property (nonatomic,copy) NSMutableDictionary* (^makeAttrDictBGColor)(UIColor* bgColor);
@property (nonatomic,copy) NSMutableDictionary* (^makeAttrDictAttachment)(NSTextAttachment* attachment);

@property (nonatomic,copy) NSMutableDictionary* (^makeAttrDictParagraphStyle)(NSParagraphStyle* paragraphStyle);
@property (nonatomic,copy) NSMutableDictionary* (^makeAttrDictLigature)(NSNumber *num);
@property (nonatomic,copy) NSMutableDictionary* (^makeAttrDictKern)(NSNumber *num);
@property (nonatomic,copy) NSMutableDictionary* (^makeAttrDictStrikethroughStyle)(NSNumber *num);
@property (nonatomic,copy) NSMutableDictionary* (^makeAttrDictUnderlineStyle)(NSUnderlineStyle underlineStyle);
@property (nonatomic,copy) NSMutableDictionary* (^makeAttrDictStrokeColor)(UIColor* bgColor);
@property (nonatomic,copy) NSMutableDictionary* (^makeAttrDictStrokeWidth)(NSNumber *num);
@property (nonatomic,copy) NSMutableDictionary* (^makeAttrDictShadow)(NSShadow* shadown);
@property (nonatomic,copy) NSMutableDictionary* (^makeAttrDictTextEffect)(NSString* textEffect);
@property (nonatomic,copy) NSMutableDictionary* (^makeAttrDictLink)(NSURL* linkURL);
@property (nonatomic,copy) NSMutableDictionary* (^makeAttrDictBaselineOffset)(NSNumber *num);
@property (nonatomic,copy) NSMutableDictionary* (^makeAttrDictUnderlineColor)(UIColor* underlineColor);
@property (nonatomic,copy) NSMutableDictionary* (^makeAttrDictStrikethroughColor)(UIColor* bgColor);
@property (nonatomic,copy) NSMutableDictionary* (^makeAttrDictObliquenes)(NSNumber *num);
@property (nonatomic,copy) NSMutableDictionary* (^makeAttrDictExpansion)(NSNumber *num);
@property (nonatomic,copy) NSMutableDictionary* (^makeAttrDictWritingDirection)(NSArray* writingDirection);
@property (nonatomic,copy) NSMutableDictionary* (^makeAttrDictVerticalGlyphForm)(NSNumber *num);
@end

