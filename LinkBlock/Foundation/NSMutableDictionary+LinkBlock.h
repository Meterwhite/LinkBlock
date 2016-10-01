//
//  NSMutableDictionary+Linkm_dict.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef NSMutableDictionaryNew
#define NSMutableDictionaryNew ([NSMutableDictionary new])
#endif
@interface NSObject(NSMutableDictionaryLinkBlock)
/** <^(id<NSCopying> key , id value)>赋值 */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^m_dictSetValue)(id<NSCopying> key , id value);
/* <^(id<NSCopying> replaceKey, id<NSCopying> withKey)>替换字典中的key，层次遍历字典和数组 */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^m_dictReplaceKey)(id<NSCopying> replaceKey, id<NSCopying> withKey);
/** <^(id<NSCopying> replaceKey, id<NSCopying> withKey)>替换字典中的key，非遍历的 */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^m_dictReplaceKeyWithoutDeep)(id<NSCopying> replaceKey, id<NSCopying> withKey);
/** <^(NSDictionary* dict)>并集，由传入参数覆盖原来数据 */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^m_dictUnionDict)(NSDictionary* dict);

/** ********************NSAttributeString设置部分******************** */

#define AttrDictNew NSMutableDictionaryNew
/** <^(UIFont* font)> */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictFont)(UIFont* font);
/** <^(UIColor* textColor)> */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictTextColor)(UIColor* textColor);
/** <^(UIColor* bgColor)> */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictBGColor)(UIColor* bgColor);
/** <^(NSTextAttachment* attachment)> */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictAttachment)(NSTextAttachment* attachment);
/** <^(NSParagraphStyle* paragraphStyle)> */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictParagraphStyle)(NSParagraphStyle* paragraphStyle);
/** <^(NSNumber *num)> */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictLigature)(NSNumber *num);
/** <^(NSNumber *num)> */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictKern)(NSNumber *num);
/** <^(NSNumber *num)> */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictStrikethroughStyle)(NSNumber *num);
/** <^(NSUnderlineStyle underlineStyle)> */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictUnderlineStyle)(NSUnderlineStyle underlineStyle);
/** <^(UIColor* bgColor)> */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictStrokeColor)(UIColor* bgColor);
/** <^(NSNumber *num)> */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictStrokeWidth)(NSNumber *num);
/** <^(NSShadow* shadown)> */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictShadow)(NSShadow* shadown);
/** <^(NSString* textEffect)> */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictTextEffect)(NSString* textEffect);
/** <^(NSURL* linkURL)> */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictLink)(NSURL* linkURL);
/** <^(NSNumber *num)> */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictBaselineOffset)(NSNumber *num);
/** <^(UIColor* underlineColor)> */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictUnderlineColor)(UIColor* underlineColor);
/** <^(UIColor* bgColor)> */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictStrikethroughColor)(UIColor* bgColor);
/** <^(NSNumber *num)> */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictObliquenes)(NSNumber *num);
/** <^(NSNumber *num)> */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictExpansion)(NSNumber *num);
/** <^(NSArray* writingDirection)> */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictWritingDirection)(NSArray* writingDirection);
/** <^(NSNumber *num)> */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^makeAttrDictVerticalGlyphForm)(NSNumber *num);
@end

