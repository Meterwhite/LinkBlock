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
    return ^(id<NSCopying> key  , id value){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if(!value || !key )
            return _self;
        _self[key]= value;
        return _self;
    };
}
- (void)setM_dictSetValue:(NSMutableDictionary *(^)(id<NSCopying>, id))m_dictSetValue{};

- (NSMutableDictionary *(^)(id<NSCopying>, id<NSCopying>))m_dictReplaceKey
{
    return ^(id<NSCopying> replaceKey, id<NSCopying> withKey){
        return self.dictReplaceKey(replaceKey, withKey);
    };
}
- (void)setM_dictReplaceKey:(NSMutableDictionary *(^)(id<NSCopying>, id<NSCopying>))m_dictReplaceKey{};

- (NSMutableDictionary *(^)(id<NSCopying>, id<NSCopying>))m_dictReplaceKeyWithoutDeep
{
    return ^(id<NSCopying> replaceKey, id<NSCopying> withKey){
        return self.m_dictReplaceKeyWithoutDeep(replaceKey, withKey);
    };
}
- (void)setM_dictReplaceKeyWithoutDeep:(NSMutableDictionary *(^)(id<NSCopying>, id<NSCopying>))m_dictReplaceKeyWithoutDeep{};

- (NSMutableDictionary *(^)(NSDictionary *))m_dictUnionDict
{
    return ^(NSDictionary* dict){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        [_self addEntriesFromDictionary:dict];
        return _self;
    };
}
- (void)setM_dictUnionDict:(NSMutableDictionary *(^)(NSDictionary *))m_dictUnionDict{};

/** ********************NSAttributeString部分******************** */
#pragma mark - NSAttributeString部分
- (NSMutableDictionary *(^)(UIFont *))makeAttrDictFont
{
    return ^(UIFont *font){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([font isKindOfClass:[UIFont class]]){
            _self[NSFontAttributeName]= font;
        }
        return _self;
    };
}
- (void)setMakeAttrDictFont:(NSMutableDictionary *(^)(UIFont *))makeAttrDictFont{};

- (NSMutableDictionary *(^)(UIColor *))makeAttrDictTextColor
{
    return ^(UIColor *color){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([color isKindOfClass:[UIColor class]]){
            _self[NSForegroundColorAttributeName]= color;
        }
        return _self;
    };
}
- (void)setMakeAttrDictTextColor:(NSMutableDictionary *(^)(UIColor *))makeAttrDictTextColor{};

- (NSMutableDictionary *(^)(UIColor *))makeAttrDictBGColor
{
    return ^(UIColor *color){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([color isKindOfClass:[UIColor class]]){
            _self[NSBackgroundColorAttributeName]= color;
        }
        return _self;
    };
}
- (void)setMakeAttrDictBGColor:(NSMutableDictionary *(^)(UIColor *))makeAttrDictBGColor{};

- (NSMutableDictionary *(^)(NSTextAttachment *))makeAttrDictAttachment
{
    return ^(NSTextAttachment* attachment){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([attachment isKindOfClass:[NSTextAttachment class]]){
            _self[NSAttachmentAttributeName]= attachment;
        }
        return _self;
    };
}
- (void)setMakeAttrDictAttachment:(NSMutableDictionary *(^)(NSTextAttachment *))makeAttrDictAttachment{};

- (NSMutableDictionary *(^)(NSParagraphStyle* paragraphStyle))makeAttrDictParagraphStyle
{
    return ^(NSParagraphStyle* paragraphStyle){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([paragraphStyle isKindOfClass:[NSParagraphStyle class]]){
            _self[NSParagraphStyleAttributeName]= paragraphStyle;
        }
        return _self;
    };
}
- (void)setMakeAttrDictParagraphStyle:(NSMutableDictionary *(^)(NSParagraphStyle *))makeAttrDictParagraphStyle{};

- (NSMutableDictionary *(^)(NSNumber*))makeAttrDictLigature
{
    return ^(NSNumber *num){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([num isKindOfClass:[NSNumber class]])
            _self[NSLigatureAttributeName]= num;
        return _self;
    };
}
- (void)setMakeAttrDictLigature:(NSMutableDictionary *(^)(NSNumber *))makeAttrDictLigature{};

- (NSMutableDictionary *(^)(NSNumber*))makeAttrDictKern
{
    return ^(NSNumber *num){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([num isKindOfClass:[NSNumber class]])
            _self[NSKernAttributeName]= num;
        return _self;
    };
}
- (void)setMakeAttrDictKern:(NSMutableDictionary *(^)(NSNumber *))makeAttrDictKern{};

- (NSMutableDictionary *(^)(NSNumber*))makeAttrDictStrikethroughStyle
{
    return ^(NSNumber *num){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([num isKindOfClass:[NSNumber class]])
            _self[NSStrikethroughStyleAttributeName]= num;
        return _self;
    };
}
- (void)setMakeAttrDictStrikethroughStyle:(NSMutableDictionary *(^)(NSNumber *))makeAttrDictStrikethroughStyle{};

- (NSMutableDictionary *(^)(NSUnderlineStyle))makeAttrDictUnderlineStyle
{
    return ^(NSUnderlineStyle underlineStyle){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        _self[NSUnderlineStyleAttributeName]= @(underlineStyle);
        return _self;
    };
}
- (void)setMakeAttrDictUnderlineStyle:(NSMutableDictionary *(^)(NSUnderlineStyle))makeAttrDictUnderlineStyle{};

- (NSMutableDictionary *(^)(UIColor*))makeAttrDictStrokeColor
{
    return ^(UIColor* color){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([color isKindOfClass:[UIColor class]]){
            _self[NSStrokeColorAttributeName]= color;
        }
        return _self;
    };
}
- (void)setMakeAttrDictStrokeColor:(NSMutableDictionary *(^)(UIColor *))makeAttrDictStrokeColor{};

- (NSMutableDictionary *(^)(NSNumber *))makeAttrDictStrokeWidth
{
    return ^(NSNumber *num){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([num isKindOfClass:[NSNumber class]]){
            _self[NSStrokeWidthAttributeName]= num;
        }
        return _self;
    };
}
- (void)setMakeAttrDictStrokeWidth:(NSMutableDictionary *(^)(NSNumber *))makeAttrDictStrokeWidth{};

- (NSMutableDictionary *(^)(NSShadow*))makeAttrDictShadow
{
    return ^(NSShadow* shadown){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([shadown isKindOfClass:[NSShadow class]]){
            _self[NSShadowAttributeName]= shadown;
        }
        return _self;
    };
}
- (void)setMakeAttrDictShadow:(NSMutableDictionary *(^)(NSShadow *))makeAttrDictShadow{};

- (NSMutableDictionary *(^)(NSString*))makeAttrDictTextEffect
{
    return ^(NSString* textEffect){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([textEffect isKindOfClass:[NSString class]]){
            _self[NSTextEffectAttributeName]= textEffect;
        }
        return _self;
    };
}
- (void)setMakeAttrDictTextEffect:(NSMutableDictionary *(^)(NSString *))makeAttrDictTextEffect{};

- (NSMutableDictionary *(^)(NSURL*))makeAttrDictLink
{
    return ^(NSURL* linkURL){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([linkURL isKindOfClass:[NSURL class]]){
            _self[NSLinkAttributeName]= linkURL;
        }
        return _self;
    };
}
- (void)setMakeAttrDictLink:(NSMutableDictionary *(^)(NSURL *))makeAttrDictLink{};

- (NSMutableDictionary *(^)(NSNumber *))makeAttrDictBaselineOffset
{
    return ^(NSNumber *num){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([num isKindOfClass:[NSNumber class]]){
            _self[NSBaselineOffsetAttributeName]= num;
        }
        return _self;
    };
}
- (void)setMakeAttrDictBaselineOffset:(NSMutableDictionary *(^)(NSNumber *))makeAttrDictBaselineOffset{};

- (NSMutableDictionary *(^)(UIColor*))makeAttrDictUnderlineColor
{
    return ^(UIColor* underlineColor){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([underlineColor isKindOfClass:[UIColor class]]){
            _self[NSUnderlineColorAttributeName]= underlineColor;
        }
        return _self;
    };
}
- (void)setMakeAttrDictUnderlineColor:(NSMutableDictionary *(^)(UIColor *))makeAttrDictUnderlineColor{};

- (NSMutableDictionary *(^)(UIColor*))makeAttrDictStrikethroughColor
{
    return ^(UIColor* bgColor){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([bgColor isKindOfClass:[UIColor class]]){
            _self[NSStrikethroughColorAttributeName]= bgColor;
        }
        return _self;
    };
}
- (void)setMakeAttrDictStrikethroughColor:(NSMutableDictionary *(^)(UIColor *))makeAttrDictStrikethroughColor{};

- (NSMutableDictionary *(^)(NSNumber *))makeAttrDictObliquenes
{
    return ^(NSNumber *num){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([num isKindOfClass:[NSNumber class]]){
            _self[NSObliquenessAttributeName]= num;
        }
        return _self;
    };
}
- (void)setMakeAttrDictObliquenes:(NSMutableDictionary *(^)(NSNumber *))makeAttrDictObliquenes{};

- (NSMutableDictionary *(^)(NSNumber *n))makeAttrDictExpansion
{
    return ^(NSNumber *num){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([num isKindOfClass:[NSNumber class]]){
            _self[NSExpansionAttributeName]= num;
        }
        return _self;
    };
}
- (void)setMakeAttrDictExpansion:(NSMutableDictionary *(^)(NSNumber *))makeAttrDictExpansion{};

- (NSMutableDictionary *(^)(NSArray*))makeAttrDictWritingDirection
{
    return ^(NSArray* writingDirection){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([writingDirection isKindOfClass:[NSArray class]]){
            _self[NSWritingDirectionAttributeName]= writingDirection;
        }
        return _self;
    };
}
- (void)setMakeAttrDictWritingDirection:(NSMutableDictionary *(^)(NSArray *))makeAttrDictWritingDirection{};

- (NSMutableDictionary *(^)(NSNumber *))makeAttrDictVerticalGlyphForm
{
    return ^(NSNumber *num){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([num isKindOfClass:[NSNumber class]]){
            _self[NSVerticalGlyphFormAttributeName]= num;
        }
        return _self;
    };
}
- (void)setMakeAttrDictVerticalGlyphForm:(NSMutableDictionary *(^)(NSNumber *))makeAttrDictVerticalGlyphForm{};

- (id (^)(id<NSCopying>))m_dictGet
{
    return ^(id<NSCopying> key){
        return self.dictGet(key);
    };
}
- (void)setM_dictGet:(id (^)(id<NSCopying>))m_dictGet{};

- (id (^)(id<NSCopying>))m_dictGetNoNSNull
{
    return ^(id<NSCopying> key){
        return self.dictGetNoNSNull(key);
    };
}
- (void)setM_dictGetNoNSNull:(id (^)(id<NSCopying>))m_dictGetNoNSNull{};

- (NSArray *(^)(id<NSCopying>))m_dictGetArrNoNullType
{
    return ^(id<NSCopying> key){
        return self.dictGetArrNoNullType(key);
    };
}
- (void)setM_dictGetArrNoNullType:(NSArray *(^)(id<NSCopying>))m_dictGetArrNoNullType{};

- (NSDictionary *(^)(id<NSCopying>))m_dictGetDictNoNullType
{
    return ^(id<NSCopying> key){
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
    return ^(id<NSCopying> key){
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
    return ^(){
        return self.dictAllKeys();
    };
}
- (void)setM_dictAllKeys:(NSArray *(^)())m_dictAllKeys{};

- (NSArray *(^)())m_dictAllValues
{
    return ^(){
        return self.dictAllValues();
    };
}
- (void)setM_dictAllValues:(NSArray *(^)())m_dictAllValues{};

- (NSArray *(^)(id))m_dictKeysForValue
{
    return ^(id value){
        return self.dictKeysForValue(value);
    };
}
- (void)setM_dictKeysForValue:(NSArray *(^)(id))m_dictKeysForValue{};


@end
