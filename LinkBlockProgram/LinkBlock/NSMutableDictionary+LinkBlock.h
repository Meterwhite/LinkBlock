//
//  NSMutableDictionary+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableDictionary(LinkBlock)
/** 安全赋值 */
@property (nonatomic,copy) NSMutableDictionary*(^blockSetValue)(id<NSCopying> key , id value);
@property (nonatomic,copy) NSMutableDictionary* (^blockReplaceKey)(id<NSCopying> key , id<NSCopying>  withKey);
/** 并集，由传入参数覆盖原来数据 */
@property (nonatomic,copy) NSMutableDictionary* (^blockUnionDict)(NSDictionary* dict);
/** ********************NSAttributeString设置部分******************** */
@property (nonatomic,copy) NSMutableDictionary* (^blockAttrStrFont)(UIFont* font);
@property (nonatomic,copy) NSMutableDictionary* (^blockAttrStrTextColor)(UIColor* textColor);
@property (nonatomic,copy) NSMutableDictionary* (^blockAttrStrBGColor)(UIColor* bgColor);
@property (nonatomic,copy) NSMutableDictionary* (^blockAttrStrAttachment)(NSTextAttachment* attachment);

@property (nonatomic,copy) NSMutableDictionary* (^blockAttrStrParagraphStyle)(NSParagraphStyle* paragraphStyle);
@property (nonatomic,copy) NSMutableDictionary* (^blockAttrStrLigature)(NSNumber *num);
@property (nonatomic,copy) NSMutableDictionary* (^blockAttrStrKern)(NSNumber *num);
@property (nonatomic,copy) NSMutableDictionary* (^blockAttrStrStrikethroughStyle)(NSNumber *num);
@property (nonatomic,copy) NSMutableDictionary* (^blockAttrStrUnderlineStyle)(NSUnderlineStyle underlineStyle);
@property (nonatomic,copy) NSMutableDictionary* (^blockAttrStrStrokeColor)(UIColor* bgColor);
@property (nonatomic,copy) NSMutableDictionary* (^blockAttrStrStrokeWidth)(NSNumber *num);
@property (nonatomic,copy) NSMutableDictionary* (^blockAttrStrShadow)(NSShadow* shadown);
@property (nonatomic,copy) NSMutableDictionary* (^blockAttrStrTextEffect)(NSString* textEffect);
@property (nonatomic,copy) NSMutableDictionary* (^blockAttrStrLink)(NSURL* linkURL);
@property (nonatomic,copy) NSMutableDictionary* (^blockAttrStrBaselineOffset)(NSNumber *num);
@property (nonatomic,copy) NSMutableDictionary* (^blockAttrStrUnderlineColor)(UIColor* underlineColor);
@property (nonatomic,copy) NSMutableDictionary* (^blockAttrStrStrikethroughColor)(UIColor* bgColor);
@property (nonatomic,copy) NSMutableDictionary* (^blockAttrStrObliquenes)(NSNumber *num);
@property (nonatomic,copy) NSMutableDictionary* (^blockAttrStrExpansion)(NSNumber *num);
@property (nonatomic,copy) NSMutableDictionary* (^blockAttrStrWritingDirection)(NSArray* writingDirection);
@property (nonatomic,copy) NSMutableDictionary* (^blockAttrStrVerticalGlyphForm)(NSNumber *num);
@end
