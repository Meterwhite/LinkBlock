//
//  NSMutableAttributedString+LinkBlock.m

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"
#import "NSMutableAttributedString+LinkBlock.h"
#import "NSObject+LinkBlock.h"

@implementation NSObject(NSMutableAttributedStringLinkBlock)
- (NSMutableAttributedString *(^)(NSAttributedString *))m_attr_strAppendAttrStr
{
    return ^(NSAttributedString* attrStr){
        LinkError_REF_AUTO_IF(NSMutableAttributedString, NSMutableAttributedString);
        if([attrStr isKindOfClass:[NSAttributedString class]])
            [_self appendAttributedString:attrStr];
        return _self;
    };
}
- (NSMutableAttributedString *(^)(NSString *))m_attr_strAppendStr
{
    return ^(NSString *str){
        LinkError_REF_AUTO_IF(NSMutableAttributedString, NSMutableAttributedString);
        if(([str isKindOfClass:[NSString class]])){
            NSAttributedString *attStr= [[NSAttributedString alloc] initWithString:str];
            [_self appendAttributedString:attStr];
        }
        return _self;
    };
}
- (NSMutableAttributedString *(^)(NSString *, NSString *, id))m_attr_strAppendStrAndAttr
{
    return ^(NSString *str, NSString* attrName, id attrValue){
        LinkError_REF_AUTO_IF(NSMutableAttributedString, NSMutableAttributedString);
        if([str isKindOfClass:[NSString class]] && [attrName isKindOfClass:[NSString class]] && attrValue){
            NSAttributedString *tNewAttrStr= [[NSAttributedString alloc] initWithString:str attributes:@{attrName:attrValue}];
            [_self appendAttributedString:tNewAttrStr];
        }
        return _self;
    };
}
- (NSMutableAttributedString *(^)(NSString *, NSDictionary *))m_attr_strAppendStrWithAttrDict
{
    return ^(NSString *str, NSDictionary *attrDic){
        LinkError_REF_AUTO_IF(NSMutableAttributedString, NSMutableAttributedString);
        if([str isKindOfClass:[NSString class]] && [attrDic isKindOfClass:[NSDictionary class]]){
            NSAttributedString *tNewAttrStr= [[NSAttributedString alloc] initWithString:str attributes:attrDic];
            [_self appendAttributedString:tNewAttrStr];
        }
        return _self;
    };
}

- (NSMutableAttributedString *(^)(NSAttributedString *, NSUInteger))m_attr_strInsertAttrStrAtIndex
{
    return ^(NSAttributedString* attrStr, NSUInteger index){
        LinkError_REF_AUTO_IF(NSMutableAttributedString, NSMutableAttributedString);
        if([attrStr isKindOfClass:[NSAttributedString class]]){
            [_self insertAttributedString:attrStr atIndex:index];
        }
        return _self;
    };
}

- (NSMutableAttributedString *(^)(NSString *, NSUInteger))m_attr_strInsertStrAtIndex
{
    return ^(NSString* str , NSUInteger index){
        LinkError_REF_AUTO_IF(NSMutableAttributedString, NSMutableAttributedString);
        if([str isKindOfClass:[NSString class]]){
            NSAttributedString *tNewAttrStr= [[NSAttributedString alloc] initWithString:str];
            [_self insertAttributedString:tNewAttrStr atIndex:index];
        }
        return _self;
    };
}

- (NSMutableAttributedString *(^)(NSString *, NSString *, id, NSUInteger idx))m_attr_strInsertStrWithAttrAtIndex
{
    return ^(NSString *str,NSString *attrName, id attrValue, NSUInteger idx){
        LinkError_REF_AUTO_IF(NSMutableAttributedString, NSMutableAttributedString);
        if([str isKindOfClass:[NSString class]] &&
           [attrName isKindOfClass:[NSString class]]&&
           attrValue){
            NSAttributedString *attrStr= [[NSAttributedString alloc] initWithString:str attributes:@{attrName:attrValue}];
            
            [_self insertAttributedString:attrStr atIndex:idx];
        }
        return _self;
    };
}

- (NSMutableAttributedString *(^)(NSString *, NSDictionary *, NSUInteger))m_attr_strInsertStrWithAttrDict
{
    return ^(NSString *str, NSDictionary *attrDic, NSUInteger index){
        LinkError_REF_AUTO_IF(NSMutableAttributedString, NSMutableAttributedString);
        if([str isKindOfClass:[NSString class]] && [attrDic isKindOfClass:[NSDictionary class]]){
            NSAttributedString *tNewAttrStr= [[NSAttributedString alloc] initWithString:str attributes:attrDic];
            [_self insertAttributedString:tNewAttrStr atIndex:index];
        }
        return _self;
    };
}

- (NSMutableAttributedString *(^)(NSString *, id, NSRange))m_attr_strAddAttrInRange
{
    return ^(NSString *attrName, id attrValue, NSRange range){
        LinkError_REF_AUTO_IF(NSMutableAttributedString, NSMutableAttributedString);
        if([attrName isKindOfClass:[NSString class]]&& attrValue)
            [_self addAttribute:attrName value:attrValue range:range];
        return _self;
    };
}

- (NSMutableAttributedString *(^)(NSString *, id))m_attr_strAddAttr
{
    return ^(NSString *attrName, id attrValue){
        LinkError_REF_AUTO_IF(NSMutableAttributedString, NSMutableAttributedString);
        if([attrName isKindOfClass:[NSString class]]&& attrValue)
            [_self addAttribute:attrName value:attrValue range:NSMakeRange(0, _self.length)];
        return _self;
    };
}
- (NSMutableAttributedString *(^)(UIFont *))m_attr_strAddAttrFont
{
    return ^(UIFont *font){
        LinkError_REF_AUTO_IF(NSMutableAttributedString, NSMutableAttributedString);
        if([font isKindOfClass:[UIFont class]]){
            [_self addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, _self.length)];
        }
        return _self;
    };
}
- (NSMutableAttributedString *(^)(UIColor *))m_attr_strAddAttrTextColor
{
    return ^(UIColor *textColor){
        LinkError_REF_AUTO_IF(NSMutableAttributedString, NSMutableAttributedString);
        if([textColor isKindOfClass:[UIColor class]]){
            [_self addAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(0, _self.length)];
        }
        return _self;
    };
}

- (NSMutableAttributedString *(^)(UIColor *))m_attr_strAddAttrBGColor
{
    return ^(UIColor *bgColor){
        LinkError_REF_AUTO_IF(NSMutableAttributedString, NSMutableAttributedString);
        if([bgColor isKindOfClass:[UIColor class]]){
            [_self addAttribute:NSBackgroundColorAttributeName value:bgColor range:NSMakeRange(0, _self.length)];
        }
        return _self;
    };
}

- (NSMutableAttributedString *(^)(NSString *, NSDictionary *))m_attr_strSetAttrForStr
{
    return ^(NSString *forStr,NSDictionary* attrDict){
        LinkError_REF_AUTO_IF(NSMutableAttributedString, NSMutableAttributedString);
        if([forStr isKindOfClass:[NSString class]] &&
           [attrDict isKindOfClass:[NSDictionary class]]){
            NSUInteger tCurrentIndex= 0;
            for(;;){
                NSRange range= [_self.string rangeOfString:forStr options:NSLiteralSearch range:NSMakeRange(tCurrentIndex, _self.string.length- tCurrentIndex)];
                if(range.location!= NSNotFound){
                    [_self setAttributes:attrDict range:range];
                    tCurrentIndex= range.location + range.length;
                }else{
                    break;
                }
            }
        }
        return _self;
    };
}
- (NSMutableAttributedString *(^)(NSString *, NSDictionary *, NSRange))m_attr_strSetAttrForStrInRange
{
    return ^(NSString *forStr,NSDictionary* attrDict, NSRange range){
        LinkError_REF_AUTO_IF(NSMutableAttributedString, NSMutableAttributedString);
        if([forStr isKindOfClass:[NSString class]]&&
           [attrDict isKindOfClass:[NSDictionary class]]){
            NSUInteger tCurrentIndex= range.location;
            for(;;){
                NSRange range= [_self.string rangeOfString:forStr options:NSLiteralSearch range:NSMakeRange(tCurrentIndex, (range.location+ range.length)- tCurrentIndex)];
                if(range.location!= NSNotFound){
                    [_self setAttributes:attrDict range:range];
                    tCurrentIndex= range.location + range.length;
                }else{
                    break;
                }
            }
        }
        return _self;
    };
}
- (NSMutableAttributedString *(^)(NSString *))m_attr_strRemoveAttr
{
    return ^(NSString* attrName){
        LinkError_REF_AUTO_IF(NSMutableAttributedString, NSMutableAttributedString);
        if([attrName isKindOfClass:[NSString class]]){
            [_self removeAttribute:attrName range:NSMakeRange(0, _self.length)];
        }
        return _self;
    };
}

- (NSMutableAttributedString *(^)(NSString *, NSRange))m_attr_strRemoveAttrInRange
{
    return ^(NSString* attrName,NSRange range){
        LinkError_REF_AUTO_IF(NSMutableAttributedString, NSMutableAttributedString);
        if([attrName isKindOfClass:[NSString class]]){
            [_self removeAttribute:attrName range:range];
        }
        return _self;
    };
}
- (NSMutableAttributedString *(^)(NSRange))m_attr_strDeleteStrInRange
{
    return ^(NSRange range){
        LinkError_REF_AUTO_IF(NSMutableAttributedString, NSMutableAttributedString);
        [_self deleteCharactersInRange:range];
        return _self;
    };
}
- (NSMutableAttributedString *(^)(NSString *, NSRange))m_attr_strReplaceStrWithStrInRange
{
    return ^(NSString *str,NSRange range){
        LinkError_REF_AUTO_IF(NSMutableAttributedString, NSMutableAttributedString);
        if([str isKindOfClass:[NSString class]]){
            [_self replaceCharactersInRange:range withString:str];
        }
        return _self;
    };
}
- (NSMutableAttributedString *(^)(NSDictionary *))m_attr_strAddAttrDict
{
    return ^(NSDictionary* attrDict){
        LinkError_REF_AUTO_IF(NSMutableAttributedString, NSMutableAttributedString);
        if([attrDict isKindOfClass:[NSDictionary class]]){
            [_self addAttributes:attrDict range:NSMakeRange(0, _self.length)];
        }
        return _self;
    };
}
- (NSMutableAttributedString *(^)(NSDictionary *))m_attr_strSetAttrDict
{
    return ^(NSDictionary *attrDict){
        LinkError_REF_AUTO_IF(NSMutableAttributedString, NSMutableAttributedString);
        if([attrDict isKindOfClass:[NSDictionary class]]){
            [_self setAttributes:attrDict range:NSMakeRange(0, _self.length)];
        }
        return _self;
    };
}
- (NSMutableAttributedString *(^)(NSDictionary *, NSRange))m_attr_strSetAttrDictInRange
{
    return ^(NSDictionary *attrDict, NSRange range){
        LinkError_REF_AUTO_IF(NSMutableAttributedString, NSMutableAttributedString);
        if([attrDict isKindOfClass:[NSDictionary class]]){
            [_self setAttributes:attrDict range: range];
        }
        return _self;
    };
}

- (void)setM_attr_strAddAttr:(NSMutableAttributedString *(^)(NSString *, id))blockAddAttr{};
- (void)setM_attr_strAddAttrBGColor:(NSMutableAttributedString *(^)(UIColor *))blockAddAttrBGColor{};
- (void)setM_attr_strAddAttrDict:(NSMutableAttributedString *(^)(NSDictionary *))blockAddAttrDict{};
- (void)setM_attr_strAddAttrFont:(NSMutableAttributedString *(^)(UIFont *))blockAddAttrFont{};
- (void)setM_attr_strAddAttrInRange:(NSMutableAttributedString *(^)(NSString *, id, NSRange))blockAddAttrInRange{};
- (void)setM_attr_strAddAttrTextColor:(NSMutableAttributedString *(^)(UIColor *))blockAddAttrTextColor{};
- (void)setM_attr_strAppendAttrStr:(NSMutableAttributedString *(^)(NSAttributedString *))blockAppendAttrStr{};
- (void)setM_attr_strAppendStr:(NSMutableAttributedString *(^)(NSString *))blockAppendStr{};
- (void)setM_attr_strAppendStrAndAttr:(NSMutableAttributedString *(^)(NSString *, NSString *, id))blockAppendStrWithAttr{};
- (void)setM_attr_strAppendStrWithAttrDict:(NSMutableAttributedString *(^)(NSString *, NSDictionary *))blockAppendStrWithAttrDict{};
- (void)setM_attr_strDeleteStrInRange:(NSMutableAttributedString *(^)(NSRange))blockDeleteStrInRange{};
- (void)setM_attr_strInsertAttrStrAtIndex:(NSMutableAttributedString *(^)(NSAttributedString *, NSUInteger))blockInsertAttrStrAtIndex{}
;
- (void)setM_attr_strInsertStrAtIndex:(NSMutableAttributedString *(^)(NSString *, NSUInteger))blockInsertStrAtIndex{};
- (void)setM_attr_strInsertStrWithAttrAtIndex:(NSMutableAttributedString *(^)(NSString *, NSString *, id, NSUInteger))blockInsertStrWithAttrAtIndex{};
- (void)setM_attr_strInsertStrWithAttrDict:(NSMutableAttributedString *(^)(NSString *, NSDictionary *, NSUInteger))blockInsertStrWithAttrDict{};
- (void)setM_attr_strRemoveAttr:(NSMutableAttributedString *(^)(NSString *))blockRemoveAttr{};
- (void)setM_attr_strRemoveAttrInRange:(NSMutableAttributedString *(^)(NSString *, NSRange))blockRemoveAttrInRange{};
- (void)setM_attr_strReplaceStrWithStrInRange:(NSMutableAttributedString *(^)(NSString *, NSRange))blockReplaceStrWithStrInRange{};
- (void)setAttr_strSize:(CGRect (^)(CGFloat))blockSize{};
- (void)setAttr_strSizeWithOptions:(CGRect (^)(CGFloat, NSStringDrawingOptions))blockSizeWithOptions{};
- (void)setM_attr_strSetAttrForStr:(NSMutableAttributedString *(^)(NSString *, NSDictionary *))blockAddAttrForStr{};
- (void)setM_attr_strSetAttrForStrInRange:(NSMutableAttributedString *(^)(NSString *, NSDictionary *, NSRange))blockAddAttrForStrInRange{};
- (void)setM_attr_strSetAttrDict:(NSMutableAttributedString *(^)(NSDictionary *))blockSetAttrDict{};
- (void)setM_attr_strSetAttrDictInRange:(NSMutableAttributedString *(^)(NSDictionary *, NSRange))blockSetAttrDictInRange{};
@end
