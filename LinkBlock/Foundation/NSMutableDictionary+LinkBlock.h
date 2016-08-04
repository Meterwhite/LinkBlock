//
//  NSMutableDictionary+Linkm_dict.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define NSMutableDictionaryNew ([NSMutableDictionary new])
@interface NSObject(NSMutableDictionaryLinkBlock)
/** 安全赋值 */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^m_dictSetValue)(id<NSCopying> key , id value);
/* 字典转模型：替换字典中的key，层次遍历字典和数组 */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^m_dictReplaceKey)(id<NSCopying> replaceKey, id<NSCopying> withKey);
/** 字典转模型：替换字典中的key，非遍历的 */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^m_dictReplaceKeyWithoutDeep)(id<NSCopying> replaceKey, id<NSCopying> withKey);
@property (nonatomic,copy,readonly) NSObject*            (^m_dictGet)(id<NSCopying> key);
@property (nonatomic,copy,readonly) NSObject*            (^m_dictGetNoNSNull)(id<NSCopying> key);
@property (nonatomic,copy,readonly) NSDictionary*        (^m_dictGetDictNoNullType)(id<NSCopying> key);
@property (nonatomic,copy,readonly) NSArray*             (^m_dictGetArrNoNullType)(id<NSCopying> key);
@property (nonatomic,copy,readonly) BOOL                 (^m_dictGetBOOLNoNullType)(id<NSCopying> key);
@property (nonatomic,copy,readonly) UIView*              (^m_dictGetViewNoNullType)(id<NSCopying> key);
@property (nonatomic,copy,readonly) BOOL                 (^m_dictContainerKey)(id<NSCopying> key);
@property (nonatomic,copy,readonly) BOOL                 (^m_dictContainerValue)(id value);
@property (nonatomic,copy,readonly) NSArray*             (^m_dictAllKeys)();
@property (nonatomic,copy,readonly) NSArray*             (^m_dictAllValues)();
@property (nonatomic,copy,readonly) NSArray*             (^m_dictKeysForValue)(id value);
/** 并集，由传入参数覆盖原来数据 */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^m_dictUnionDict)(NSDictionary* dict);

/** ********************NSAttributeString设置部分******************** */

#define AttrDictNew NSMutableDictionaryNew

@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictFont)(UIFont* font);
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictTextColor)(UIColor* textColor);
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictBGColor)(UIColor* bgColor);
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictAttachment)(NSTextAttachment* attachment);

@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictParagraphStyle)(NSParagraphStyle* paragraphStyle);
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictLigature)(NSNumber *num);
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictKern)(NSNumber *num);
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictStrikethroughStyle)(NSNumber *num);
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictUnderlineStyle)(NSUnderlineStyle underlineStyle);
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictStrokeColor)(UIColor* bgColor);
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictStrokeWidth)(NSNumber *num);
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictShadow)(NSShadow* shadown);
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictTextEffect)(NSString* textEffect);
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictLink)(NSURL* linkURL);
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictBaselineOffset)(NSNumber *num);
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictUnderlineColor)(UIColor* underlineColor);
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictStrikethroughColor)(UIColor* bgColor);
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictObliquenes)(NSNumber *num);
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictExpansion)(NSNumber *num);
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictWritingDirection)(NSArray* writingDirection);
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictVerticalGlyphForm)(NSNumber *num);
@end

