//
//  NSMutableDictionary+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(NSMutableDictionaryLinkBlock)
- (NSMutableDictionary *(^)(id<NSCopying>  , id))m_dictSetValue
{
    return ^id(id<NSCopying> key  , id value){
        LinkHandle_REF(NSMutableDictionary, NSMutableDictionary)
        if(!value || !key )
            return _self;
        _self[key]= value;
        return _self;
    };
}
- (void)setM_dictSetValue:(NSMutableDictionary *(^)(id<NSCopying>, id))m_dictSetValue{};

- (NSMutableDictionary *(^)(id<NSCopying>, id<NSCopying>))m_dictReplaceKey
{
    return ^id(id<NSCopying> replaceKey, id<NSCopying> withKey){
        return self.dictReplaceKey(replaceKey, withKey);
    };
}
- (void)setM_dictReplaceKey:(NSMutableDictionary *(^)(id<NSCopying>, id<NSCopying>))m_dictReplaceKey{};

- (NSMutableDictionary *(^)(id<NSCopying>, id<NSCopying>))m_dictReplaceKeyWithoutDeep
{
    return ^id(id<NSCopying> replaceKey, id<NSCopying> withKey){
        return self.m_dictReplaceKeyWithoutDeep(replaceKey, withKey);
    };
}
- (void)setM_dictReplaceKeyWithoutDeep:(NSMutableDictionary *(^)(id<NSCopying>, id<NSCopying>))m_dictReplaceKeyWithoutDeep{};

- (NSMutableDictionary *(^)(NSDictionary *))m_dictUnionDict
{
    return ^id(NSDictionary* dict){
        LinkHandle_REF(NSMutableDictionary, NSMutableDictionary)
        [_self addEntriesFromDictionary:dict];
        return _self;
    };
}
- (void)setM_dictUnionDict:(NSMutableDictionary *(^)(NSDictionary *))m_dictUnionDict{};

/** ********************NSAttributeString部分******************** */
#pragma mark - NSAttributeString部分
- (NSMutableDictionary *(^)(UIFont *))makeAttrDictFont
{
    return ^id(UIFont *font){
        LinkHandle_REF(NSMutableDictionary, NSMutableDictionary)
        if([font isKindOfClass:[UIFont class]]){
            _self[NSFontAttributeName]= font;
        }
        return _self;
    };
}
- (void)setMakeAttrDictFont:(NSMutableDictionary *(^)(UIFont *))makeAttrDictFont{};

- (NSMutableDictionary *(^)(UIColor *))makeAttrDictTextColor
{
    return ^id(UIColor *color){
        LinkHandle_REF(NSMutableDictionary, NSMutableDictionary)
        if([color isKindOfClass:[UIColor class]]){
            _self[NSForegroundColorAttributeName]= color;
        }
        return _self;
    };
}
- (void)setMakeAttrDictTextColor:(NSMutableDictionary *(^)(UIColor *))makeAttrDictTextColor{};

- (NSMutableDictionary *(^)(UIColor *))makeAttrDictBGColor
{
    return ^id(UIColor *color){
        LinkHandle_REF(NSMutableDictionary, NSMutableDictionary)
        if([color isKindOfClass:[UIColor class]]){
            _self[NSBackgroundColorAttributeName]= color;
        }
        return _self;
    };
}
- (void)setMakeAttrDictBGColor:(NSMutableDictionary *(^)(UIColor *))makeAttrDictBGColor{};

- (NSMutableDictionary *(^)(NSTextAttachment *))makeAttrDictAttachment
{
    return ^id(NSTextAttachment* attachment){
        LinkHandle_REF(NSMutableDictionary, NSMutableDictionary)
        if([attachment isKindOfClass:[NSTextAttachment class]]){
            _self[NSAttachmentAttributeName]= attachment;
        }
        return _self;
    };
}
- (void)setMakeAttrDictAttachment:(NSMutableDictionary *(^)(NSTextAttachment *))makeAttrDictAttachment{};

- (NSMutableDictionary *(^)(NSParagraphStyle* paragraphStyle))makeAttrDictParagraphStyle
{
    return ^id(NSParagraphStyle* paragraphStyle){
        LinkHandle_REF(NSMutableDictionary, NSMutableDictionary)
        if([paragraphStyle isKindOfClass:[NSParagraphStyle class]]){
            _self[NSParagraphStyleAttributeName]= paragraphStyle;
        }
        return _self;
    };
}
- (void)setMakeAttrDictParagraphStyle:(NSMutableDictionary *(^)(NSParagraphStyle *))makeAttrDictParagraphStyle{};

- (NSMutableDictionary *(^)(NSNumber*))makeAttrDictLigature
{
    return ^id(NSNumber *num){
        LinkHandle_REF(NSMutableDictionary, NSMutableDictionary)
        if([num isKindOfClass:[NSNumber class]])
            _self[NSLigatureAttributeName]= num;
        return _self;
    };
}
- (void)setMakeAttrDictLigature:(NSMutableDictionary *(^)(NSNumber *))makeAttrDictLigature{};

- (NSMutableDictionary *(^)(NSNumber*))makeAttrDictKern
{
    return ^id(NSNumber *num){
        LinkHandle_REF(NSMutableDictionary, NSMutableDictionary)
        if([num isKindOfClass:[NSNumber class]])
            _self[NSKernAttributeName]= num;
        return _self;
    };
}
- (void)setMakeAttrDictKern:(NSMutableDictionary *(^)(NSNumber *))makeAttrDictKern{};

- (NSMutableDictionary *(^)(NSNumber*))makeAttrDictStrikethroughStyle
{
    return ^id(NSNumber *num){
        LinkHandle_REF(NSMutableDictionary, NSMutableDictionary)
        if([num isKindOfClass:[NSNumber class]])
            _self[NSStrikethroughStyleAttributeName]= num;
        return _self;
    };
}
- (void)setMakeAttrDictStrikethroughStyle:(NSMutableDictionary *(^)(NSNumber *))makeAttrDictStrikethroughStyle{};

- (NSMutableDictionary *(^)(NSUnderlineStyle))makeAttrDictUnderlineStyle
{
    return ^id(NSUnderlineStyle underlineStyle){
        LinkHandle_REF(NSMutableDictionary, NSMutableDictionary)
        _self[NSUnderlineStyleAttributeName]= @(underlineStyle);
        return _self;
    };
}
- (void)setMakeAttrDictUnderlineStyle:(NSMutableDictionary *(^)(NSUnderlineStyle))makeAttrDictUnderlineStyle{};

- (NSMutableDictionary *(^)(UIColor*))makeAttrDictStrokeColor
{
    return ^id(UIColor* color){
        LinkHandle_REF(NSMutableDictionary, NSMutableDictionary)
        if([color isKindOfClass:[UIColor class]]){
            _self[NSStrokeColorAttributeName]= color;
        }
        return _self;
    };
}
- (void)setMakeAttrDictStrokeColor:(NSMutableDictionary *(^)(UIColor *))makeAttrDictStrokeColor{};

- (NSMutableDictionary *(^)(NSNumber *))makeAttrDictStrokeWidth
{
    return ^id(NSNumber *num){
        LinkHandle_REF(NSMutableDictionary, NSMutableDictionary)
        if([num isKindOfClass:[NSNumber class]]){
            _self[NSStrokeWidthAttributeName]= num;
        }
        return _self;
    };
}
- (void)setMakeAttrDictStrokeWidth:(NSMutableDictionary *(^)(NSNumber *))makeAttrDictStrokeWidth{};

- (NSMutableDictionary *(^)(NSShadow*))makeAttrDictShadow
{
    return ^id(NSShadow* shadown){
        LinkHandle_REF(NSMutableDictionary, NSMutableDictionary)
        if([shadown isKindOfClass:[NSShadow class]]){
            _self[NSShadowAttributeName]= shadown;
        }
        return _self;
    };
}
- (void)setMakeAttrDictShadow:(NSMutableDictionary *(^)(NSShadow *))makeAttrDictShadow{};

- (NSMutableDictionary *(^)(NSString*))makeAttrDictTextEffect
{
    return ^id(NSString* textEffect){
        LinkHandle_REF(NSMutableDictionary, NSMutableDictionary)
        if([textEffect isKindOfClass:[NSString class]]){
            _self[NSTextEffectAttributeName]= textEffect;
        }
        return _self;
    };
}
- (void)setMakeAttrDictTextEffect:(NSMutableDictionary *(^)(NSString *))makeAttrDictTextEffect{};

- (NSMutableDictionary *(^)(NSURL*))makeAttrDictLink
{
    return ^id(NSURL* linkURL){
        LinkHandle_REF(NSMutableDictionary, NSMutableDictionary)
        if([linkURL isKindOfClass:[NSURL class]]){
            _self[NSLinkAttributeName]= linkURL;
        }
        return _self;
    };
}
- (void)setMakeAttrDictLink:(NSMutableDictionary *(^)(NSURL *))makeAttrDictLink{};

- (NSMutableDictionary *(^)(NSNumber *))makeAttrDictBaselineOffset
{
    return ^id(NSNumber *num){
        LinkHandle_REF(NSMutableDictionary, NSMutableDictionary)
        if([num isKindOfClass:[NSNumber class]]){
            _self[NSBaselineOffsetAttributeName]= num;
        }
        return _self;
    };
}
- (void)setMakeAttrDictBaselineOffset:(NSMutableDictionary *(^)(NSNumber *))makeAttrDictBaselineOffset{};

- (NSMutableDictionary *(^)(UIColor*))makeAttrDictUnderlineColor
{
    return ^id(UIColor* underlineColor){
        LinkHandle_REF(NSMutableDictionary, NSMutableDictionary)
        if([underlineColor isKindOfClass:[UIColor class]]){
            _self[NSUnderlineColorAttributeName]= underlineColor;
        }
        return _self;
    };
}
- (void)setMakeAttrDictUnderlineColor:(NSMutableDictionary *(^)(UIColor *))makeAttrDictUnderlineColor{};

- (NSMutableDictionary *(^)(UIColor*))makeAttrDictStrikethroughColor
{
    return ^id(UIColor* bgColor){
        LinkHandle_REF(NSMutableDictionary, NSMutableDictionary)
        if([bgColor isKindOfClass:[UIColor class]]){
            _self[NSStrikethroughColorAttributeName]= bgColor;
        }
        return _self;
    };
}
- (void)setMakeAttrDictStrikethroughColor:(NSMutableDictionary *(^)(UIColor *))makeAttrDictStrikethroughColor{};

- (NSMutableDictionary *(^)(NSNumber *))makeAttrDictObliquenes
{
    return ^id(NSNumber *num){
        LinkHandle_REF(NSMutableDictionary, NSMutableDictionary)
        if([num isKindOfClass:[NSNumber class]]){
            _self[NSObliquenessAttributeName]= num;
        }
        return _self;
    };
}
- (void)setMakeAttrDictObliquenes:(NSMutableDictionary *(^)(NSNumber *))makeAttrDictObliquenes{};

- (NSMutableDictionary *(^)(NSNumber *n))makeAttrDictExpansion
{
    return ^id(NSNumber *num){
        LinkHandle_REF(NSMutableDictionary, NSMutableDictionary)
        if([num isKindOfClass:[NSNumber class]]){
            _self[NSExpansionAttributeName]= num;
        }
        return _self;
    };
}
- (void)setMakeAttrDictExpansion:(NSMutableDictionary *(^)(NSNumber *))makeAttrDictExpansion{};

- (NSMutableDictionary *(^)(NSArray*))makeAttrDictWritingDirection
{
    return ^id(NSArray* writingDirection){
        LinkHandle_REF(NSMutableDictionary, NSMutableDictionary)
        if([writingDirection isKindOfClass:[NSArray class]]){
            _self[NSWritingDirectionAttributeName]= writingDirection;
        }
        return _self;
    };
}
- (void)setMakeAttrDictWritingDirection:(NSMutableDictionary *(^)(NSArray *))makeAttrDictWritingDirection{};

- (NSMutableDictionary *(^)(NSNumber *))makeAttrDictVerticalGlyphForm
{
    return ^id(NSNumber *num){
        LinkHandle_REF(NSMutableDictionary, NSMutableDictionary)
        if([num isKindOfClass:[NSNumber class]]){
            _self[NSVerticalGlyphFormAttributeName]= num;
        }
        return _self;
    };
}
- (void)setMakeAttrDictVerticalGlyphForm:(NSMutableDictionary *(^)(NSNumber *))makeAttrDictVerticalGlyphForm{};

- (id (^)(id<NSCopying>))m_dictGet
{
    return ^id(id<NSCopying> key){
        return self.dictGet(key);
    };
}
- (void)setM_dictGet:(id (^)(id<NSCopying>))m_dictGet{};

- (id (^)(id<NSCopying>))m_dictGetNoNSNull
{
    return ^id(id<NSCopying> key){
        return self.dictGetNoNSNull(key);
    };
}
- (void)setM_dictGetNoNSNull:(id (^)(id<NSCopying>))m_dictGetNoNSNull{};

- (NSArray *(^)(id<NSCopying>))m_dictGetArrNoNullType
{
    return ^id(id<NSCopying> key){
        return self.dictGetArrNoNullType(key);
    };
}
- (void)setM_dictGetArrNoNullType:(NSArray *(^)(id<NSCopying>))m_dictGetArrNoNullType{};

- (NSDictionary *(^)(id<NSCopying>))m_dictGetDictNoNullType
{
    return ^id(id<NSCopying> key){
        return self.dictGetDictNoNullType(key);
    };
}
- (void)setM_dictGetDictNoNullType:(NSDictionary *(^)(id<NSCopying>))m_dictGetDictNoNullType{};

- (BOOL (^)(id<NSCopying>))m_dictGetBOOLNoNullType
{
    return ^(id<NSCopying> key){
        return self.dictGetBOOLNoNullType(key);
    };
}
- (void)setM_dictGetBOOLNoNullType:(BOOL (^)(id<NSCopying>))m_dictGetBOOLNoNullType{};

- (UIView *(^)(id<NSCopying>))m_dictGetViewNoNullType
{
    return ^id(id<NSCopying> key){
        return self.dictGetViewNoNullType(key);
    };
}
- (void)setM_dictGetViewNoNullType:(UIView *(^)(id<NSCopying>))m_dictGetViewNoNullType{};

- (BOOL (^)(id<NSCopying>))m_dictContainerKey
{
    return ^(id<NSCopying> key){
        return self.dictContainerKey(key);
    };
}
- (void)setM_dictContainerKey:(BOOL (^)(id<NSCopying>))m_dictContainerKey{};

- (BOOL (^)(id value))m_dictContainerValue
{
    return ^(id value){
        return self.dictContainerValue(value);
    };
}
- (void)setM_dictContainerValue:(BOOL (^)(id))m_dictContainerValue{};

- (NSArray *(^)())m_dictAllKeys
{
    return ^id(){
        return self.dictAllKeys();
    };
}
- (void)setM_dictAllKeys:(NSArray *(^)())m_dictAllKeys{};

- (NSArray *(^)())m_dictAllValues
{
    return ^id(){
        return self.dictAllValues();
    };
}
- (void)setM_dictAllValues:(NSArray *(^)())m_dictAllValues{};

- (NSArray *(^)(id))m_dictKeysForValue
{
    return ^id(id value){
        return self.dictKeysForValue(value);
    };
}
- (void)setM_dictKeysForValue:(NSArray *(^)(id))m_dictKeysForValue{};


@end
