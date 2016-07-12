//
//  NSMutableAttributedString+LinkBlock.m

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(NSMutableAttributedStringLinkBlock)
- (NSMutableAttributedString *(^)(NSAttributedString *))m_attr_strAppendAttrStr
{
    return ^id(NSAttributedString* attrStr){
        LinkHandle_REF(NSMutableAttributedString, NSMutableAttributedString)
        if([attrStr isKindOfClass:[NSAttributedString class]])
            [_self appendAttributedString:attrStr];
        return _self;
    };
}
- (void)setM_attr_strAppendAttrStr:(NSMutableAttributedString *(^)(NSAttributedString *))blockAppendAttrStr{};

- (NSMutableAttributedString *(^)(NSString *))m_attr_strAppendStr
{
    return ^id(NSString *str){
        LinkHandle_REF(NSMutableAttributedString, NSMutableAttributedString)
        if(([str isKindOfClass:[NSString class]])){
            NSAttributedString *attStr= [[NSAttributedString alloc] initWithString:str];
            [_self appendAttributedString:attStr];
        }
        return _self;
    };
}
- (void)setM_attr_strAppendStr:(NSMutableAttributedString *(^)(NSString *))blockAppendStr{};

- (NSMutableAttributedString *(^)(NSString *, NSString *, id))m_attr_strAppendStrAndAttr
{
    return ^id(NSString *str, NSString* attrName, id attrValue){
        LinkHandle_REF(NSMutableAttributedString, NSMutableAttributedString)
        if([str isKindOfClass:[NSString class]] && [attrName isKindOfClass:[NSString class]] && attrValue){
            NSAttributedString *tNewAttrStr= [[NSAttributedString alloc] initWithString:str attributes:@{attrName:attrValue}];
            [_self appendAttributedString:tNewAttrStr];
        }
        return _self;
    };
}
- (void)setM_attr_strAppendStrAndAttr:(NSMutableAttributedString *(^)(NSString *, NSString *, id))blockAppendStrWithAttr{};

- (NSMutableAttributedString *(^)(NSString *, NSDictionary *))m_attr_strAppendStrWithAttrDict
{
    return ^id(NSString *str, NSDictionary *attrDic){
        LinkHandle_REF(NSMutableAttributedString, NSMutableAttributedString)
        if([str isKindOfClass:[NSString class]] && [attrDic isKindOfClass:[NSDictionary class]]){
            NSAttributedString *tNewAttrStr= [[NSAttributedString alloc] initWithString:str attributes:attrDic];
            [_self appendAttributedString:tNewAttrStr];
        }
        return _self;
    };
}
- (void)setM_attr_strAppendStrWithAttrDict:(NSMutableAttributedString *(^)(NSString *, NSDictionary *))blockAppendStrWithAttrDict{};

- (NSMutableAttributedString *(^)(NSAttributedString *, NSUInteger))m_attr_strInsertAttrStrAtIndex
{
    return ^id(NSAttributedString* attrStr, NSUInteger index){
        LinkHandle_REF(NSMutableAttributedString, NSMutableAttributedString)
        if([attrStr isKindOfClass:[NSAttributedString class]]){
            [_self insertAttributedString:attrStr atIndex:index];
        }
        return _self;
    };
}
- (void)setM_attr_strInsertAttrStrAtIndex:(NSMutableAttributedString *(^)(NSAttributedString *, NSUInteger))blockInsertAttrStrAtIndex{}
;

- (NSMutableAttributedString *(^)(NSString *, NSUInteger))m_attr_strInsertStrAtIndex
{
    return ^id(NSString* str , NSUInteger index){
        LinkHandle_REF(NSMutableAttributedString, NSMutableAttributedString)
        if([str isKindOfClass:[NSString class]]){
            NSAttributedString *tNewAttrStr= [[NSAttributedString alloc] initWithString:str];
            [_self insertAttributedString:tNewAttrStr atIndex:index];
        }
        return _self;
    };
}
- (void)setM_attr_strInsertStrAtIndex:(NSMutableAttributedString *(^)(NSString *, NSUInteger))blockInsertStrAtIndex{};

- (NSMutableAttributedString *(^)(NSString *, NSString *, id, NSUInteger idx))m_attr_strInsertStrWithAttrAtIndex
{
    return ^id(NSString *str,NSString *attrName, id attrValue, NSUInteger idx){
        LinkHandle_REF(NSMutableAttributedString, NSMutableAttributedString)
        if([str isKindOfClass:[NSString class]] &&
           [attrName isKindOfClass:[NSString class]]&&
           attrValue){
            NSAttributedString *attrStr= [[NSAttributedString alloc] initWithString:str attributes:@{attrName:attrValue}];
            
            [_self insertAttributedString:attrStr atIndex:idx];
        }
        return _self;
    };
}
- (void)setM_attr_strInsertStrWithAttrAtIndex:(NSMutableAttributedString *(^)(NSString *, NSString *, id, NSUInteger))blockInsertStrWithAttrAtIndex{};

- (NSMutableAttributedString *(^)(NSString *, NSDictionary *, NSUInteger))m_attr_strInsertStrWithAttrDict
{
    return ^id(NSString *str, NSDictionary *attrDic, NSUInteger index){
        LinkHandle_REF(NSMutableAttributedString, NSMutableAttributedString)
        if([str isKindOfClass:[NSString class]] && [attrDic isKindOfClass:[NSDictionary class]]){
            NSAttributedString *tNewAttrStr= [[NSAttributedString alloc] initWithString:str attributes:attrDic];
            [_self insertAttributedString:tNewAttrStr atIndex:index];
        }
        return _self;
    };
}
- (void)setM_attr_strInsertStrWithAttrDict:(NSMutableAttributedString *(^)(NSString *, NSDictionary *, NSUInteger))blockInsertStrWithAttrDict{};

- (NSMutableAttributedString *(^)(NSString *, id, NSRange))m_attr_strAddAttrInRange
{
    return ^id(NSString *attrName, id attrValue, NSRange range){
        LinkHandle_REF(NSMutableAttributedString, NSMutableAttributedString)
        if([attrName isKindOfClass:[NSString class]]&& attrValue)
            [_self addAttribute:attrName value:attrValue range:range];
        return _self;
    };
}
- (void)setM_attr_strAddAttrInRange:(NSMutableAttributedString *(^)(NSString *, id, NSRange))blockAddAttrInRange{};

- (NSMutableAttributedString *(^)(NSString *, id))m_attr_strAddAttr
{
    return ^id(NSString *attrName, id attrValue){
        LinkHandle_REF(NSMutableAttributedString, NSMutableAttributedString)
        if([attrName isKindOfClass:[NSString class]]&& attrValue)
            [_self addAttribute:attrName value:attrValue range:NSMakeRange(0, _self.length)];
        return _self;
    };
}
- (void)setM_attr_strAddAttr:(NSMutableAttributedString *(^)(NSString *, id))blockAddAttr{};

- (NSMutableAttributedString *(^)(UIFont *))m_attr_strAddAttrFont
{
    return ^id(UIFont *font){
        LinkHandle_REF(NSMutableAttributedString, NSMutableAttributedString)
        if([font isKindOfClass:[UIFont class]]){
            [_self addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, _self.length)];
        }
        return _self;
    };
}
- (void)setM_attr_strAddAttrFont:(NSMutableAttributedString *(^)(UIFont *))blockAddAttrFont{};

- (NSMutableAttributedString *(^)(UIColor *))m_attr_strAddAttrTextColor
{
    return ^id(UIColor *textColor){
        LinkHandle_REF(NSMutableAttributedString, NSMutableAttributedString)
        if([textColor isKindOfClass:[UIColor class]]){
            [_self addAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(0, _self.length)];
        }
        return _self;
    };
}
- (void)setM_attr_strAddAttrTextColor:(NSMutableAttributedString *(^)(UIColor *))blockAddAttrTextColor{};

- (NSMutableAttributedString *(^)(UIColor *))m_attr_strAddAttrBGColor
{
    return ^id(UIColor *bgColor){
        LinkHandle_REF(NSMutableAttributedString, NSMutableAttributedString)
        if([bgColor isKindOfClass:[UIColor class]]){
            [_self addAttribute:NSBackgroundColorAttributeName value:bgColor range:NSMakeRange(0, _self.length)];
        }
        return _self;
    };
}
- (void)setM_attr_strAddAttrBGColor:(NSMutableAttributedString *(^)(UIColor *))blockAddAttrBGColor{};

- (NSMutableAttributedString *(^)(NSString *, NSDictionary *))m_attr_strSetAttrForStr
{
    return ^id(NSString *forStr,NSDictionary* attrDict){
        LinkHandle_REF(NSMutableAttributedString, NSMutableAttributedString)
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
- (void)setM_attr_strSetAttrForStr:(NSMutableAttributedString *(^)(NSString *, NSDictionary *))blockAddAttrForStr{};

- (NSMutableAttributedString *(^)(NSString *, NSDictionary *, NSRange))m_attr_strSetAttrForStrInRange
{
    return ^id(NSString *forStr,NSDictionary* attrDict, NSRange range){
        LinkHandle_REF(NSMutableAttributedString, NSMutableAttributedString)
        if([forStr isKindOfClass:[NSString class]]&&
           [attrDict isKindOfClass:[NSDictionary class]]){
            NSUInteger tCurrentIndex= range.location;
            for(;;){
                NSRange range2= [_self.string rangeOfString:forStr
                                                   options:NSLiteralSearch
                                                     range:NSMakeRange(tCurrentIndex, (range.location + range.length) - tCurrentIndex)];
                if(range2.location!= NSNotFound){
                    [_self setAttributes:attrDict range:range2];
                    tCurrentIndex= range.location + range2.length;
                }else{
                    break;
                }
            }
        }
        return _self;
    };
}
- (void)setM_attr_strSetAttrForStrInRange:(NSMutableAttributedString *(^)(NSString *, NSDictionary *, NSRange))blockAddAttrForStrInRange{};

- (NSMutableAttributedString *(^)(NSString *))m_attr_strRemoveAttr
{
    return ^id(NSString* attrName){
        LinkHandle_REF(NSMutableAttributedString, NSMutableAttributedString)
        if([attrName isKindOfClass:[NSString class]]){
            [_self removeAttribute:attrName range:NSMakeRange(0, _self.length)];
        }
        return _self;
    };
}
- (void)setM_attr_strRemoveAttr:(NSMutableAttributedString *(^)(NSString *))blockRemoveAttr{};

- (NSMutableAttributedString *(^)(NSString *, NSRange))m_attr_strRemoveAttrInRange
{
    return ^id(NSString* attrName,NSRange range){
        LinkHandle_REF(NSMutableAttributedString, NSMutableAttributedString)
        if([attrName isKindOfClass:[NSString class]]){
            [_self removeAttribute:attrName range:range];
        }
        return _self;
    };
}
- (void)setM_attr_strRemoveAttrInRange:(NSMutableAttributedString *(^)(NSString *, NSRange))blockRemoveAttrInRange{};

- (NSMutableAttributedString *(^)(NSRange))m_attr_strDeleteStrInRange
{
    return ^id(NSRange range){
        LinkHandle_REF(NSMutableAttributedString, NSMutableAttributedString)
        [_self deleteCharactersInRange:range];
        return _self;
    };
}
- (void)setM_attr_strDeleteStrInRange:(NSMutableAttributedString *(^)(NSRange))blockDeleteStrInRange{};

- (NSMutableAttributedString *(^)(NSString *, NSRange))m_attr_strReplaceStrWithStrInRange
{
    return ^id(NSString *str,NSRange range){
        LinkHandle_REF(NSMutableAttributedString, NSMutableAttributedString)
        if([str isKindOfClass:[NSString class]]){
            [_self replaceCharactersInRange:range withString:str];
        }
        return _self;
    };
}
- (void)setM_attr_strReplaceStrWithStrInRange:(NSMutableAttributedString *(^)(NSString *, NSRange))blockReplaceStrWithStrInRange{};

- (NSMutableAttributedString *(^)(NSDictionary *))m_attr_strAddAttrDict
{
    return ^id(NSDictionary* attrDict){
        LinkHandle_REF(NSMutableAttributedString, NSMutableAttributedString)
        if([attrDict isKindOfClass:[NSDictionary class]]){
            [_self addAttributes:attrDict range:NSMakeRange(0, _self.length)];
        }
        return _self;
    };
}
- (void)setM_attr_strAddAttrDict:(NSMutableAttributedString *(^)(NSDictionary *))blockAddAttrDict{};

- (NSMutableAttributedString *(^)(NSDictionary *))m_attr_strSetAttrDict
{
    return ^id(NSDictionary *attrDict){
        LinkHandle_REF(NSMutableAttributedString, NSMutableAttributedString)
        if([attrDict isKindOfClass:[NSDictionary class]]){
            [_self setAttributes:attrDict range:NSMakeRange(0, _self.length)];
        }
        return _self;
    };
}
- (void)setM_attr_strSetAttrDict:(NSMutableAttributedString *(^)(NSDictionary *))blockSetAttrDict{};

- (NSMutableAttributedString *(^)(NSDictionary *, NSRange))m_attr_strSetAttrDictInRange
{
    return ^id(NSDictionary *attrDict, NSRange range){
        LinkHandle_REF(NSMutableAttributedString, NSMutableAttributedString)
        if([attrDict isKindOfClass:[NSDictionary class]]){
            [_self setAttributes:attrDict range: range];
        }
        return _self;
    };
}
- (void)setM_attr_strSetAttrDictInRange:(NSMutableAttributedString *(^)(NSDictionary *, NSRange))blockSetAttrDictInRange{};



- (CGRect (^)(CGFloat))m_attr_strSize
{
    return ^(CGFloat maxWidth){
        LinkHandle_VAL_IF(NSAttributedString){
            return CGRectZero;
        }
        return [_self boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
    };
}
- (void)setM_attr_strSize:(CGRect (^)(CGFloat))blockSize{};

- (CGRect (^)(CGFloat, NSStringDrawingOptions))m_attr_strSizeWithOptions
{
    return ^(CGFloat maxWidth,NSStringDrawingOptions options ){
        LinkHandle_VAL_IF(NSAttributedString){
            return CGRectZero;
        }
        return [_self boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:options context:nil];
    };
}
- (void)setM_attr_strSizeWithOptions:(CGRect (^)(CGFloat, NSStringDrawingOptions))blockSizeWithOptions{};

- (BOOL (^)(NSAttributedString *))m_attr_strIsEqualToAttrStr
{
    return ^(NSAttributedString* attrStr){
        LinkHandle_VAL_IF(NSAttributedString){
            return NO;
        }
        return [_self isEqualToAttributedString:attrStr];
    };
}
- (void)setM_attr_strIsEqualToAttrStr:(BOOL (^)(NSAttributedString *))blockIsEqualToAttrStr{};

- (UIImage *(^)(UIImage *, CGRect))m_attr_strDrawImgRect
{
    return ^id(UIImage* image, CGRect rect){
        LinkHandle_REF(UIImage , NSMutableAttributedString)
        UIGraphicsBeginImageContext(image.size);
        [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
        [_self drawInRect:rect];
        UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImg;
    };
}
- (void)setM_attr_strDrawImgRect:(UIImage *(^)(UIImage *, CGRect))m_attr_strDrawImgRect{};
@end
