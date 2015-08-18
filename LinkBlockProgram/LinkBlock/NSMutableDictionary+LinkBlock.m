//
//  NSMutableDictionary+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"
#import "NSMutableDictionary+LinkBlock.h"
#import "NSObject+LinkBlock.h"


@implementation NSMutableDictionary(LinkBlock)
- (NSMutableDictionary *(^)(id<NSCopying>  , id))blockSetValue
{
    return ^(id<NSCopying> key  , id value){
        if(!value || !key )
            return self;
        self[key]= value;
        return self;
    };
}

- (NSMutableDictionary *(^)(id<NSCopying> , id<NSCopying> ))blockReplaceKey
{
    return ^(id<NSCopying> key , id<NSCopying> withKey){
        NSArray* allKeys = [self allKeys];
        if(![allKeys containsObject:key] || [allKeys containsObject:withKey])
            return self;
        //替换数据
        id value = self[key];
        [self setObject:value forKey:withKey];
        [self removeObjectForKey:key];
        return self;
    };
}
- (void)setBlockReplaceKey:(NSMutableDictionary *(^)(id<NSCopying> , id<NSCopying>))blockReplaceKey{}

- (NSMutableDictionary *(^)(NSDictionary *))blockUnionDict
{
    return ^(NSDictionary* dict){
        [self addEntriesFromDictionary:dict];
        return self;
    };
}
- (void)setBlockUnionDict:(NSMutableDictionary *(^)(NSDictionary *))blockCombineDict{};

/** ********************NSAttributeString部分******************** */
#pragma mark - NSAttributeString部分
- (NSMutableDictionary *(^)(UIFont *))blockAttrStrFont
{
    return ^(UIFont *font){
        if([font isKindOfClass:[UIFont class]]){
            self[NSFontAttributeName]= font;
        }
        return self;
    };
}

- (NSMutableDictionary *(^)(UIColor *))blockAttrStrTextColor
{
    return ^(UIColor *color){
        if([color isKindOfClass:[UIColor class]]){
            self[NSForegroundColorAttributeName]= color;
        }
        return self;
    };
}

- (NSMutableDictionary *(^)(UIColor *))blockAttrStrBGColor
{
    return ^(UIColor *color){
        if([color isKindOfClass:[UIColor class]]){
            self[NSBackgroundColorAttributeName]= color;
        }
        return self;
    };
}

- (NSMutableDictionary *(^)(NSTextAttachment *))blockAttrStrAttachment
{
    return ^(NSTextAttachment* attachment){
        if([attachment isKindOfClass:[NSTextAttachment class]]){
            self[NSAttachmentAttributeName]= attachment;
        }
        return self;
    };
}

- (NSMutableDictionary *(^)(NSParagraphStyle* paragraphStyle))blockAttrStrParagraphStyle
{
    return ^(NSParagraphStyle* paragraphStyle){
        if([paragraphStyle isKindOfClass:[NSParagraphStyle class]]){
            self[NSParagraphStyleAttributeName]= paragraphStyle;
        }
        return self;
    };
}

- (NSMutableDictionary *(^)(NSNumber*))blockAttrStrLigature
{
    return ^(NSNumber *num){
        if([num isKindOfClass:[NSNumber class]])
            self[NSLigatureAttributeName]= num;
        return self;
    };
}

- (NSMutableDictionary *(^)(NSNumber*))blockAttrStrKern
{
    return ^(NSNumber *num){
        if([num isKindOfClass:[NSNumber class]])
            self[NSKernAttributeName]= num;
        return self;
    };
}

- (NSMutableDictionary *(^)(NSNumber*))blockAttrStrStrikethroughStyle
{
    return ^(NSNumber *num){
        if([num isKindOfClass:[NSNumber class]])
            self[NSStrikethroughStyleAttributeName]= num;
        return self;
    };
}

- (NSMutableDictionary *(^)(NSUnderlineStyle))blockAttrStrUnderlineStyle
{
    return ^(NSUnderlineStyle underlineStyle){
        self[NSUnderlineStyleAttributeName]= @(underlineStyle);
        return self;
    };
}

- (NSMutableDictionary *(^)(UIColor*))blockAttrStrStrokeColor
{
    return ^(UIColor* color){
        if([color isKindOfClass:[UIColor class]]){
            self[NSStrokeColorAttributeName]= color;
        }
        return self;
    };
}

- (NSMutableDictionary *(^)(NSNumber *))blockAttrStrStrokeWidth
{
    return ^(NSNumber *num){
        if([num isKindOfClass:[NSNumber class]]){
            self[NSStrokeWidthAttributeName]= num;
        }
        return self;
    };
}

- (NSMutableDictionary *(^)(NSShadow*))blockAttrStrShadow
{
    return ^(NSShadow* shadown){
        if([shadown isKindOfClass:[NSShadow class]]){
            self[NSShadowAttributeName]= shadown;
        }
        return self;
    };
}
- (NSMutableDictionary *(^)(NSString*))blockAttrStrTextEffect
{
    return ^(NSString* textEffect){
        if([textEffect isKindOfClass:[NSString class]]){
            self[NSTextEffectAttributeName]= textEffect;
        }
        return self;
    };
}

- (NSMutableDictionary *(^)(NSURL*))blockAttrStrLink
{
    return ^(NSURL* linkURL){
        if([linkURL isKindOfClass:[NSURL class]]){
            self[NSLinkAttributeName]= linkURL;
        }
        return self;
    };
}

- (NSMutableDictionary *(^)(NSNumber *))blockAttrStrBaselineOffset
{
    return ^(NSNumber *num){
        if([num isKindOfClass:[NSNumber class]]){
            self[NSBaselineOffsetAttributeName]= num;
        }
        return self;
    };
}

- (NSMutableDictionary *(^)(UIColor*))blockAttrStrUnderlineColor
{
    return ^(UIColor* underlineColor){
        if([underlineColor isKindOfClass:[UIColor class]]){
            self[NSUnderlineColorAttributeName]= underlineColor;
        }
        return self;
    };
}

- (NSMutableDictionary *(^)(UIColor*))blockAttrStrStrikethroughColor
{
    return ^(UIColor* bgColor){
        if([bgColor isKindOfClass:[UIColor class]]){
            self[NSStrikethroughColorAttributeName]= bgColor;
        }
        return self;
    };
}

- (NSMutableDictionary *(^)(NSNumber *))blockAttrStrObliquenes
{
    return ^(NSNumber *num){
        if([num isKindOfClass:[NSNumber class]]){
            self[NSObliquenessAttributeName]= num;
        }
        return self;
    };
}

- (NSMutableDictionary *(^)(NSNumber *n))blockAttrStrExpansion
{
    return ^(NSNumber *num){
        if([num isKindOfClass:[NSNumber class]]){
            self[NSExpansionAttributeName]= num;
        }
        return self;
    };
}

- (NSMutableDictionary *(^)(NSArray*))blockAttrStrWritingDirection
{
    return ^(NSArray* writingDirection){
        if([writingDirection isKindOfClass:[NSArray class]]){
            self[NSWritingDirectionAttributeName]= writingDirection;
        }
        return self;
    };
}

- (NSMutableDictionary *(^)(NSNumber *))blockAttrStrVerticalGlyphForm
{
    return ^(NSNumber *num){
        if([num isKindOfClass:[NSNumber class]]){
            self[NSVerticalGlyphFormAttributeName]= num;
        }
        return self;
    };
}

- (void)setBlockSetValue:(NSMutableDictionary *(^)(id<NSCopying> , id))blockSetValue{};
- (void)setBlockGetValue:(id (^)(NSString *))blockGetValue{};

- (void)setBlockAttrStrAttachment:(NSMutableDictionary *(^)(NSTextAttachment *))blockAttrStrAttachment{};
- (void)setBlockAttrStrBaselineOffset:(NSMutableDictionary *(^)(NSNumber *))blockAttrStrBaselineOffset{};
- (void)setBlockAttrStrBGColor:(NSMutableDictionary *(^)(UIColor *))blockAttrStrBGColor{};
- (void)setBlockAttrStrExpansion:(NSMutableDictionary *(^)(NSNumber *))blockAttrStrExpansion{};
- (void)setBlockAttrStrFont:(NSMutableDictionary *(^)(UIFont *))blockAttrStrFont{};

- (void)setBlockAttrStrKern:(NSMutableDictionary *(^)(NSNumber *))blockAttrStrKern{};
- (void)setBlockAttrStrLigature:(NSMutableDictionary *(^)(NSNumber *))blockAttrStrLigature{};
- (void)setBlockAttrStrLink:(NSMutableDictionary *(^)(NSURL *))blockAttrStrLink{};
- (void)setBlockAttrStrObliquenes:(NSMutableDictionary *(^)(NSNumber *))blockAttrStrObliquenes{};
- (void)setBlockAttrStrParagraphStyle:(NSMutableDictionary *(^)(NSParagraphStyle *))blockAttrStrParagraphStyle{};

- (void)setBlockAttrStrShadow:(NSMutableDictionary *(^)(NSShadow *))blockAttrStrShadow{};
- (void)setBlockAttrStrStrikethroughColor:(NSMutableDictionary *(^)(UIColor *))blockAttrStrStrikethroughColor{};
- (void)setBlockAttrStrStrikethroughStyle:(NSMutableDictionary *(^)(NSNumber *))blockAttrStrStrikethroughStyle{};
- (void)setBlockAttrStrStrokeColor:(NSMutableDictionary *(^)(UIColor *))blockAttrStrStrokeColor{};
- (void)setBlockAttrStrStrokeWidth:(NSMutableDictionary *(^)(NSNumber *))blockAttrStrStrokeWidth{};

- (void)setBlockAttrStrTextColor:(NSMutableDictionary *(^)(UIColor *))blockAttrStrTextColor{};
- (void)setBlockAttrStrTextEffect:(NSMutableDictionary *(^)(NSString *))blockAttrStrTextEffect{};
- (void)setBlockAttrStrUnderlineColor:(NSMutableDictionary *(^)(UIColor *))blockAttrStrUnderlineColor{};
- (void)setBlockAttrStrUnderlineStyle:(NSMutableDictionary *(^)(NSUnderlineStyle))blockAttrStrUnderlineStyle{};
- (void)setBlockAttrStrVerticalGlyphForm:(NSMutableDictionary *(^)(NSNumber *))blockAttrStrVerticalGlyphForm{};

- (void)setBlockAttrStrWritingDirection:(NSMutableDictionary *(^)(NSArray *))blockAttrStrWritingDirection{};
@end
