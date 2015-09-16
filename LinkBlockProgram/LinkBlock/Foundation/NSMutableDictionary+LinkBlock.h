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
/** set value safely */
@property (nonatomic,copy) NSMutableDictionary* (^m_dictSetValue)(id<NSCopying> key , id value);
@property (nonatomic,copy) NSMutableDictionary* (^m_dictReplaceKey)(id<NSCopying> key , id<NSCopying>  withKey);
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
/** Union. Adds to the receiving dictionary the entries from another dictionary. */
@property (nonatomic,copy) NSMutableDictionary* (^m_dictUnionDict)(NSDictionary* dict);
/** ********************NSAttributeString设置部分******************** */
/** ********************NSAttributeString Settings section ******************** */
@property (nonatomic,copy) NSMutableDictionary* (^m_dictAttrStrFont)(UIFont* font);
@property (nonatomic,copy) NSMutableDictionary* (^m_dictAttrStrTextColor)(UIColor* textColor);
@property (nonatomic,copy) NSMutableDictionary* (^m_dictAttrStrBGColor)(UIColor* bgColor);
@property (nonatomic,copy) NSMutableDictionary* (^m_dictAttrStrAttachment)(NSTextAttachment* attachment);

@property (nonatomic,copy) NSMutableDictionary* (^m_dictAttrStrParagraphStyle)(NSParagraphStyle* paragraphStyle);
@property (nonatomic,copy) NSMutableDictionary* (^m_dictAttrStrLigature)(NSNumber *num);
@property (nonatomic,copy) NSMutableDictionary* (^m_dictAttrStrKern)(NSNumber *num);
@property (nonatomic,copy) NSMutableDictionary* (^m_dictAttrStrStrikethroughStyle)(NSNumber *num);
@property (nonatomic,copy) NSMutableDictionary* (^m_dictAttrStrUnderlineStyle)(NSUnderlineStyle underlineStyle);
@property (nonatomic,copy) NSMutableDictionary* (^m_dictAttrStrStrokeColor)(UIColor* bgColor);
@property (nonatomic,copy) NSMutableDictionary* (^m_dictAttrStrStrokeWidth)(NSNumber *num);
@property (nonatomic,copy) NSMutableDictionary* (^m_dictAttrStrShadow)(NSShadow* shadown);
@property (nonatomic,copy) NSMutableDictionary* (^m_dictAttrStrTextEffect)(NSString* textEffect);
@property (nonatomic,copy) NSMutableDictionary* (^m_dictAttrStrLink)(NSURL* linkURL);
@property (nonatomic,copy) NSMutableDictionary* (^m_dictAttrStrBaselineOffset)(NSNumber *num);
@property (nonatomic,copy) NSMutableDictionary* (^m_dictAttrStrUnderlineColor)(UIColor* underlineColor);
@property (nonatomic,copy) NSMutableDictionary* (^m_dictAttrStrStrikethroughColor)(UIColor* bgColor);
@property (nonatomic,copy) NSMutableDictionary* (^m_dictAttrStrObliquenes)(NSNumber *num);
@property (nonatomic,copy) NSMutableDictionary* (^m_dictAttrStrExpansion)(NSNumber *num);
@property (nonatomic,copy) NSMutableDictionary* (^m_dictAttrStrWritingDirection)(NSArray* writingDirection);
@property (nonatomic,copy) NSMutableDictionary* (^m_dictAttrStrVerticalGlyphForm)(NSNumber *num);
@end

