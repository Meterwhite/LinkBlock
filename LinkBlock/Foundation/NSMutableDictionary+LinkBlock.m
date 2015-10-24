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

- (NSMutableDictionary *(^)(id<NSCopying> , id<NSCopying> ))m_dictReplaceKey
{
    return ^(id<NSCopying> key , id<NSCopying> withKey){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        NSArray* allKeys = [_self allKeys];
        if(![allKeys containsObject:key] || [allKeys containsObject:withKey])
            return _self;
        //替换数据
        id value = _self[key];
        [_self setObject:value forKey:withKey];
        [_self removeObjectForKey:key];
        return _self;
    };
}
- (void)setM_dictReplaceKey:(NSMutableDictionary *(^)(id<NSCopying> , id<NSCopying>))m_dictReplaceKey{}

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
- (NSMutableDictionary *(^)(UIFont *))m_dictAttrStrFont
{
    return ^(UIFont *font){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([font isKindOfClass:[UIFont class]]){
            _self[NSFontAttributeName]= font;
        }
        return _self;
    };
}
- (void)setM_dictAttrStrFont:(NSMutableDictionary *(^)(UIFont *))m_dictAttrStrFont{};

- (NSMutableDictionary *(^)(UIColor *))m_dictAttrStrTextColor
{
    return ^(UIColor *color){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([color isKindOfClass:[UIColor class]]){
            _self[NSForegroundColorAttributeName]= color;
        }
        return _self;
    };
}
- (void)setM_dictAttrStrTextColor:(NSMutableDictionary *(^)(UIColor *))m_dictAttrStrTextColor{};

- (NSMutableDictionary *(^)(UIColor *))m_dictAttrStrBGColor
{
    return ^(UIColor *color){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([color isKindOfClass:[UIColor class]]){
            _self[NSBackgroundColorAttributeName]= color;
        }
        return _self;
    };
}
- (void)setM_dictAttrStrBGColor:(NSMutableDictionary *(^)(UIColor *))m_dictAttrStrBGColor{};

- (NSMutableDictionary *(^)(NSTextAttachment *))m_dictAttrStrAttachment
{
    return ^(NSTextAttachment* attachment){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([attachment isKindOfClass:[NSTextAttachment class]]){
            _self[NSAttachmentAttributeName]= attachment;
        }
        return _self;
    };
}
- (void)setM_dictAttrStrAttachment:(NSMutableDictionary *(^)(NSTextAttachment *))m_dictAttrStrAttachment{};

- (NSMutableDictionary *(^)(NSParagraphStyle* paragraphStyle))m_dictAttrStrParagraphStyle
{
    return ^(NSParagraphStyle* paragraphStyle){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([paragraphStyle isKindOfClass:[NSParagraphStyle class]]){
            _self[NSParagraphStyleAttributeName]= paragraphStyle;
        }
        return _self;
    };
}
- (void)setM_dictAttrStrParagraphStyle:(NSMutableDictionary *(^)(NSParagraphStyle *))m_dictAttrStrParagraphStyle{};

- (NSMutableDictionary *(^)(NSNumber*))m_dictAttrStrLigature
{
    return ^(NSNumber *num){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([num isKindOfClass:[NSNumber class]])
            _self[NSLigatureAttributeName]= num;
        return _self;
    };
}
- (void)setM_dictAttrStrLigature:(NSMutableDictionary *(^)(NSNumber *))m_dictAttrStrLigature{};

- (NSMutableDictionary *(^)(NSNumber*))m_dictAttrStrKern
{
    return ^(NSNumber *num){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([num isKindOfClass:[NSNumber class]])
            _self[NSKernAttributeName]= num;
        return _self;
    };
}
- (void)setM_dictAttrStrKern:(NSMutableDictionary *(^)(NSNumber *))m_dictAttrStrKern{};

- (NSMutableDictionary *(^)(NSNumber*))m_dictAttrStrStrikethroughStyle
{
    return ^(NSNumber *num){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([num isKindOfClass:[NSNumber class]])
            _self[NSStrikethroughStyleAttributeName]= num;
        return _self;
    };
}
- (void)setM_dictAttrStrStrikethroughStyle:(NSMutableDictionary *(^)(NSNumber *))m_dictAttrStrStrikethroughStyle{};

- (NSMutableDictionary *(^)(NSUnderlineStyle))m_dictAttrStrUnderlineStyle
{
    return ^(NSUnderlineStyle underlineStyle){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        _self[NSUnderlineStyleAttributeName]= @(underlineStyle);
        return _self;
    };
}
- (void)setM_dictAttrStrUnderlineStyle:(NSMutableDictionary *(^)(NSUnderlineStyle))m_dictAttrStrUnderlineStyle{};

- (NSMutableDictionary *(^)(UIColor*))m_dictAttrStrStrokeColor
{
    return ^(UIColor* color){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([color isKindOfClass:[UIColor class]]){
            _self[NSStrokeColorAttributeName]= color;
        }
        return _self;
    };
}
- (void)setM_dictAttrStrStrokeColor:(NSMutableDictionary *(^)(UIColor *))m_dictAttrStrStrokeColor{};

- (NSMutableDictionary *(^)(NSNumber *))m_dictAttrStrStrokeWidth
{
    return ^(NSNumber *num){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([num isKindOfClass:[NSNumber class]]){
            _self[NSStrokeWidthAttributeName]= num;
        }
        return _self;
    };
}
- (void)setM_dictAttrStrStrokeWidth:(NSMutableDictionary *(^)(NSNumber *))m_dictAttrStrStrokeWidth{};

- (NSMutableDictionary *(^)(NSShadow*))m_dictAttrStrShadow
{
    return ^(NSShadow* shadown){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([shadown isKindOfClass:[NSShadow class]]){
            _self[NSShadowAttributeName]= shadown;
        }
        return _self;
    };
}
- (void)setM_dictAttrStrShadow:(NSMutableDictionary *(^)(NSShadow *))m_dictAttrStrShadow{};

- (NSMutableDictionary *(^)(NSString*))m_dictAttrStrTextEffect
{
    return ^(NSString* textEffect){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([textEffect isKindOfClass:[NSString class]]){
            _self[NSTextEffectAttributeName]= textEffect;
        }
        return _self;
    };
}
- (void)setM_dictAttrStrTextEffect:(NSMutableDictionary *(^)(NSString *))m_dictAttrStrTextEffect{};

- (NSMutableDictionary *(^)(NSURL*))m_dictAttrStrLink
{
    return ^(NSURL* linkURL){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([linkURL isKindOfClass:[NSURL class]]){
            _self[NSLinkAttributeName]= linkURL;
        }
        return _self;
    };
}
- (void)setM_dictAttrStrLink:(NSMutableDictionary *(^)(NSURL *))m_dictAttrStrLink{};

- (NSMutableDictionary *(^)(NSNumber *))m_dictAttrStrBaselineOffset
{
    return ^(NSNumber *num){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([num isKindOfClass:[NSNumber class]]){
            _self[NSBaselineOffsetAttributeName]= num;
        }
        return _self;
    };
}
- (void)setM_dictAttrStrBaselineOffset:(NSMutableDictionary *(^)(NSNumber *))m_dictAttrStrBaselineOffset{};

- (NSMutableDictionary *(^)(UIColor*))m_dictAttrStrUnderlineColor
{
    return ^(UIColor* underlineColor){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([underlineColor isKindOfClass:[UIColor class]]){
            _self[NSUnderlineColorAttributeName]= underlineColor;
        }
        return _self;
    };
}
- (void)setM_dictAttrStrUnderlineColor:(NSMutableDictionary *(^)(UIColor *))m_dictAttrStrUnderlineColor{};

- (NSMutableDictionary *(^)(UIColor*))m_dictAttrStrStrikethroughColor
{
    return ^(UIColor* bgColor){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([bgColor isKindOfClass:[UIColor class]]){
            _self[NSStrikethroughColorAttributeName]= bgColor;
        }
        return _self;
    };
}
- (void)setM_dictAttrStrStrikethroughColor:(NSMutableDictionary *(^)(UIColor *))m_dictAttrStrStrikethroughColor{};

- (NSMutableDictionary *(^)(NSNumber *))m_dictAttrStrObliquenes
{
    return ^(NSNumber *num){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([num isKindOfClass:[NSNumber class]]){
            _self[NSObliquenessAttributeName]= num;
        }
        return _self;
    };
}
- (void)setM_dictAttrStrObliquenes:(NSMutableDictionary *(^)(NSNumber *))m_dictAttrStrObliquenes{};

- (NSMutableDictionary *(^)(NSNumber *n))m_dictAttrStrExpansion
{
    return ^(NSNumber *num){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([num isKindOfClass:[NSNumber class]]){
            _self[NSExpansionAttributeName]= num;
        }
        return _self;
    };
}
- (void)setM_dictAttrStrExpansion:(NSMutableDictionary *(^)(NSNumber *))m_dictAttrStrExpansion{};

- (NSMutableDictionary *(^)(NSArray*))m_dictAttrStrWritingDirection
{
    return ^(NSArray* writingDirection){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([writingDirection isKindOfClass:[NSArray class]]){
            _self[NSWritingDirectionAttributeName]= writingDirection;
        }
        return _self;
    };
}
- (void)setM_dictAttrStrWritingDirection:(NSMutableDictionary *(^)(NSArray *))m_dictAttrStrWritingDirection{};

- (NSMutableDictionary *(^)(NSNumber *))m_dictAttrStrVerticalGlyphForm
{
    return ^(NSNumber *num){
        LinkError_REF_AUTO(NSMutableDictionary, NSMutableDictionary);
        if([num isKindOfClass:[NSNumber class]]){
            _self[NSVerticalGlyphFormAttributeName]= num;
        }
        return _self;
    };
}
- (void)setM_dictAttrStrVerticalGlyphForm:(NSMutableDictionary *(^)(NSNumber *))m_dictAttrStrVerticalGlyphForm{};

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
