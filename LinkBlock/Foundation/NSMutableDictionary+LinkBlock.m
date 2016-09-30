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
        LinkHandle_REF(NSMutableDictionary)
        LinkGroupHandle_REF(m_dictSetValue,key,value)
        if(!value || !key )
            return _self;
        _self[key]= value;
        return _self;
    };
}

- (NSMutableDictionary *(^)(id<NSCopying>, id<NSCopying>))m_dictReplaceKey
{
    return ^id(id<NSCopying> replaceKey, id<NSCopying> withKey){
        return self.dictReplaceKey(replaceKey, withKey);
    };
}

- (NSMutableDictionary *(^)(id<NSCopying>, id<NSCopying>))m_dictReplaceKeyWithoutDeep
{
    return ^id(id<NSCopying> replaceKey, id<NSCopying> withKey){
        return self.m_dictReplaceKeyWithoutDeep(replaceKey, withKey);
    };
}

- (NSMutableDictionary *(^)(NSDictionary *))m_dictUnionDict
{
    return ^id(NSDictionary* dict){
        LinkHandle_REF(NSMutableDictionary)
        LinkGroupHandle_REF(m_dictUnionDict,dict)
        [_self addEntriesFromDictionary:dict];
        return _self;
    };
}


/** ********************NSAttributeString部分******************** */
#pragma mark - NSAttributeString部分
- (NSMutableDictionary *(^)(UIFont *))makeAttrDictFont
{
    return ^id(UIFont *font){
        LinkHandle_REF(NSMutableDictionary)
        LinkGroupHandle_REF(makeAttrDictFont,font)
        if([font isKindOfClass:[UIFont class]]){
            _self[NSFontAttributeName]= font;
        }
        return _self;
    };
}

- (NSMutableDictionary *(^)(UIColor *))makeAttrDictTextColor
{
    return ^id(UIColor *color){
        LinkHandle_REF(NSMutableDictionary)
        LinkGroupHandle_REF(makeAttrDictTextColor,color)
        if([color isKindOfClass:[UIColor class]]){
            _self[NSForegroundColorAttributeName]= color;
        }
        return _self;
    };
}

- (NSMutableDictionary *(^)(UIColor *))makeAttrDictBGColor
{
    return ^id(UIColor *color){
        LinkHandle_REF(NSMutableDictionary)
        LinkGroupHandle_REF(makeAttrDictBGColor,color)
        if([color isKindOfClass:[UIColor class]]){
            _self[NSBackgroundColorAttributeName]= color;
        }
        return _self;
    };
}

- (NSMutableDictionary *(^)(NSTextAttachment *))makeAttrDictAttachment
{
    return ^id(NSTextAttachment* attachment){
        LinkHandle_REF(NSMutableDictionary)
        LinkGroupHandle_REF(makeAttrDictAttachment,attachment)
        if([attachment isKindOfClass:[NSTextAttachment class]]){
            _self[NSAttachmentAttributeName]= attachment;
        }
        return _self;
    };
}

- (NSMutableDictionary *(^)(NSParagraphStyle* paragraphStyle))makeAttrDictParagraphStyle
{
    return ^id(NSParagraphStyle* paragraphStyle){
        LinkHandle_REF(NSMutableDictionary)
        LinkGroupHandle_REF(makeAttrDictParagraphStyle,paragraphStyle)
        if([paragraphStyle isKindOfClass:[NSParagraphStyle class]]){
            _self[NSParagraphStyleAttributeName]= paragraphStyle;
        }
        return _self;
    };
}

- (NSMutableDictionary *(^)(NSNumber*))makeAttrDictLigature
{
    return ^id(NSNumber *num){
        LinkHandle_REF(NSMutableDictionary)
        LinkGroupHandle_REF(makeAttrDictLigature,num)
        if([num isKindOfClass:[NSNumber class]])
            _self[NSLigatureAttributeName]= num;
        return _self;
    };
}

- (NSMutableDictionary *(^)(NSNumber*))makeAttrDictKern
{
    return ^id(NSNumber *num){
        LinkHandle_REF(NSMutableDictionary)
        LinkGroupHandle_REF(makeAttrDictKern,num)
        if([num isKindOfClass:[NSNumber class]])
            _self[NSKernAttributeName]= num;
        return _self;
    };
}

- (NSMutableDictionary *(^)(NSNumber*))makeAttrDictStrikethroughStyle
{
    return ^id(NSNumber *num){
        LinkHandle_REF(NSMutableDictionary)
        LinkGroupHandle_REF(makeAttrDictStrikethroughStyle,num)
        if([num isKindOfClass:[NSNumber class]])
            _self[NSStrikethroughStyleAttributeName]= num;
        return _self;
    };
}

- (NSMutableDictionary *(^)(NSUnderlineStyle))makeAttrDictUnderlineStyle
{
    return ^id(NSUnderlineStyle underlineStyle){
        LinkHandle_REF(NSMutableDictionary)
        LinkGroupHandle_REF(makeAttrDictUnderlineStyle,underlineStyle)
        _self[NSUnderlineStyleAttributeName]= @(underlineStyle);
        return _self;
    };
}

- (NSMutableDictionary *(^)(UIColor*))makeAttrDictStrokeColor
{
    return ^id(UIColor* color){
        LinkHandle_REF(NSMutableDictionary)
        LinkGroupHandle_REF(makeAttrDictStrokeColor,color)
        if([color isKindOfClass:[UIColor class]]){
            _self[NSStrokeColorAttributeName]= color;
        }
        return _self;
    };
}

- (NSMutableDictionary *(^)(NSNumber *))makeAttrDictStrokeWidth
{
    return ^id(NSNumber *num){
        LinkHandle_REF(NSMutableDictionary)
        LinkGroupHandle_REF(makeAttrDictStrokeWidth,num)
        if([num isKindOfClass:[NSNumber class]]){
            _self[NSStrokeWidthAttributeName]= num;
        }
        return _self;
    };
}

- (NSMutableDictionary *(^)(NSShadow*))makeAttrDictShadow
{
    return ^id(NSShadow* shadown){
        LinkHandle_REF(NSMutableDictionary)
        LinkGroupHandle_REF(makeAttrDictShadow,shadown)
        if([shadown isKindOfClass:[NSShadow class]]){
            _self[NSShadowAttributeName]= shadown;
        }
        return _self;
    };
}

- (NSMutableDictionary *(^)(NSString*))makeAttrDictTextEffect
{
    return ^id(NSString* textEffect){
        LinkHandle_REF(NSMutableDictionary)
        LinkGroupHandle_REF(makeAttrDictTextEffect,textEffect)
        if([textEffect isKindOfClass:[NSString class]]){
            _self[NSTextEffectAttributeName]= textEffect;
        }
        return _self;
    };
}

- (NSMutableDictionary *(^)(NSURL*))makeAttrDictLink
{
    return ^id(NSURL* linkURL){
        LinkHandle_REF(NSMutableDictionary)
        LinkGroupHandle_REF(makeAttrDictLink,linkURL)
        if([linkURL isKindOfClass:[NSURL class]]){
            _self[NSLinkAttributeName]= linkURL;
        }
        return _self;
    };
}

- (NSMutableDictionary *(^)(NSNumber *))makeAttrDictBaselineOffset
{
    return ^id(NSNumber *num){
        LinkHandle_REF(NSMutableDictionary)
        LinkGroupHandle_REF(makeAttrDictBaselineOffset,num)
        if([num isKindOfClass:[NSNumber class]]){
            _self[NSBaselineOffsetAttributeName]= num;
        }
        return _self;
    };
}

- (NSMutableDictionary *(^)(UIColor*))makeAttrDictUnderlineColor
{
    return ^id(UIColor* underlineColor){
        LinkHandle_REF(NSMutableDictionary)
        LinkGroupHandle_REF(makeAttrDictUnderlineColor,underlineColor)
        if([underlineColor isKindOfClass:[UIColor class]]){
            _self[NSUnderlineColorAttributeName]= underlineColor;
        }
        return _self;
    };
}

- (NSMutableDictionary *(^)(UIColor*))makeAttrDictStrikethroughColor
{
    return ^id(UIColor* bgColor){
        LinkHandle_REF(NSMutableDictionary)
        LinkGroupHandle_REF(makeAttrDictStrikethroughColor,bgColor)
        if([bgColor isKindOfClass:[UIColor class]]){
            _self[NSStrikethroughColorAttributeName]= bgColor;
        }
        return _self;
    };
}

- (NSMutableDictionary *(^)(NSNumber *))makeAttrDictObliquenes
{
    return ^id(NSNumber *num){
        LinkHandle_REF(NSMutableDictionary)
        LinkGroupHandle_REF(makeAttrDictObliquenes,num)
        if([num isKindOfClass:[NSNumber class]]){
            _self[NSObliquenessAttributeName]= num;
        }
        return _self;
    };
}

- (NSMutableDictionary *(^)(NSNumber *n))makeAttrDictExpansion
{
    return ^id(NSNumber *num){
        LinkHandle_REF(NSMutableDictionary)
        LinkGroupHandle_REF(makeAttrDictExpansion,num)
        if([num isKindOfClass:[NSNumber class]]){
            _self[NSExpansionAttributeName]= num;
        }
        return _self;
    };
}

- (NSMutableDictionary *(^)(NSArray*))makeAttrDictWritingDirection
{
    return ^id(NSArray* writingDirection){
        LinkHandle_REF(NSMutableDictionary)
        LinkGroupHandle_REF(makeAttrDictWritingDirection,writingDirection)
        if([writingDirection isKindOfClass:[NSArray class]]){
            _self[NSWritingDirectionAttributeName]= writingDirection;
        }
        return _self;
    };
}

- (NSMutableDictionary *(^)(NSNumber *))makeAttrDictVerticalGlyphForm
{
    return ^id(NSNumber *num){
        LinkHandle_REF(NSMutableDictionary)
        LinkGroupHandle_REF(makeAttrDictVerticalGlyphForm,num)
        if([num isKindOfClass:[NSNumber class]]){
            _self[NSVerticalGlyphFormAttributeName]= num;
        }
        return _self;
    };
}

- (NSObject* (^)(id<NSCopying>))m_dictGet
{
    return ^id(id<NSCopying> key){
        return self.dictGet(key);
    };
}

- (NSObject* (^)(id<NSCopying>))m_dictGetNoNSNull
{
    return ^id(id<NSCopying> key){
        return self.dictGetNoNSNull(key);
    };
}


- (BOOL (^)(id<NSCopying>))m_dictGetBOOL
{
    return ^(id<NSCopying> key){
        return self.dictGetBOOL(key);
    };
}

- (BOOL (^)(id<NSCopying>))m_dictContainerKey
{
    return ^(id<NSCopying> key){
        return self.dictContainerKey(key);
    };
}

- (BOOL (^)(id value))m_dictContainerValue
{
    return ^(id value){
        return self.dictContainerValue(value);
    };
}

- (NSArray *(^)())m_dictAllKeys
{
    return ^id(){
        return self.dictAllKeys();
    };
}

- (NSArray *(^)())m_dictAllValues
{
    return ^id(){
        return self.dictAllValues();
    };
}

- (NSArray *(^)(id))m_dictKeysForValue
{
    return ^id(id value){
        return self.dictKeysForValue(value);
    };
}
@end
