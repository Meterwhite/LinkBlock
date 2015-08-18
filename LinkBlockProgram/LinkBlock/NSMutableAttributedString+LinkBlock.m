//
//  NSMutableAttributedString+LinkBlock.m

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"
#import "NSMutableAttributedString+LinkBlock.h"
#import "NSObject+LinkBlock.h"

@implementation NSMutableAttributedString(LinkBlock)
- (NSMutableAttributedString *(^)(NSAttributedString *))blockAppendAttrStr
{
    return ^(NSAttributedString* attrStr){
        if([attrStr isKindOfClass:[NSAttributedString class]])
            [self appendAttributedString:attrStr];
        return self;
    };
}
- (NSMutableAttributedString *(^)(NSString *))blockAppendStr
{
    return ^(NSString *str){
        if(([str isKindOfClass:[NSString class]])){
            NSAttributedString *attStr= [[NSAttributedString alloc] initWithString:str];
            [self appendAttributedString:attStr];
        }
        return self;
    };
}
- (NSMutableAttributedString *(^)(NSString *, NSString *, id))blockAppendStrWithAttr
{
    return ^(NSString *str, NSString* attrName, id attrValue){
        if([str isKindOfClass:[NSString class]] && [attrName isKindOfClass:[NSString class]] && attrValue){
            NSAttributedString *tNewAttrStr= [[NSAttributedString alloc] initWithString:str attributes:@{attrName:attrValue}];
            [self appendAttributedString:tNewAttrStr];
        }
        return self;
    };
}
- (NSMutableAttributedString *(^)(NSString *, NSDictionary *))blockAppendStrWithAttrDict
{
    return ^(NSString *str, NSDictionary *attrDic){
        if([str isKindOfClass:[NSString class]] && [attrDic isKindOfClass:[NSDictionary class]]){
            NSAttributedString *tNewAttrStr= [[NSAttributedString alloc] initWithString:str attributes:attrDic];
            [self appendAttributedString:tNewAttrStr];
        }
        return self;
    };
}

- (NSMutableAttributedString *(^)(NSAttributedString *, NSUInteger))blockInsertAttrStrAtIndex
{
    return ^(NSAttributedString* attrStr, NSUInteger index){
        if([attrStr isKindOfClass:[NSAttributedString class]]){
            [self insertAttributedString:attrStr atIndex:index];
        }
        return self;
    };
}

- (NSMutableAttributedString *(^)(NSString *, NSUInteger))blockInsertStrAtIndex
{
    return ^(NSString* str , NSUInteger index){
        if([str isKindOfClass:[NSString class]]){
            NSAttributedString *tNewAttrStr= [[NSAttributedString alloc] initWithString:str];
            [self insertAttributedString:tNewAttrStr atIndex:index];
        }
        return self;
    };
}

- (NSMutableAttributedString *(^)(NSString *, NSString *, id, NSUInteger idx))blockInsertStrWithAttrAtIndex
{
    return ^(NSString *str,NSString *attrName, id attrValue, NSUInteger idx){
        if([str isKindOfClass:[NSString class]] &&
           [attrName isKindOfClass:[NSString class]]&&
           attrValue){
            NSAttributedString *attrStr= [[NSAttributedString alloc] initWithString:str attributes:@{attrName:attrValue}];
            
            [self insertAttributedString:attrStr atIndex:idx];
        }
        return self;
    };
}

- (NSMutableAttributedString *(^)(NSString *, NSDictionary *, NSUInteger))blockInsertStrWithAttrDict
{
    return ^(NSString *str, NSDictionary *attrDic, NSUInteger index){
        if([str isKindOfClass:[NSString class]] && [attrDic isKindOfClass:[NSDictionary class]]){
            NSAttributedString *tNewAttrStr= [[NSAttributedString alloc] initWithString:str attributes:attrDic];
            [self insertAttributedString:tNewAttrStr atIndex:index];
        }
        return self;
    };
}

- (NSMutableAttributedString *(^)(NSString *, id, NSRange))blockAddAttrInRange
{
    return ^(NSString *attrName, id attrValue, NSRange range){
        if([attrName isKindOfClass:[NSString class]]&& attrValue)
            [self addAttribute:attrName value:attrValue range:range];
        return self;
    };
}

- (NSMutableAttributedString *(^)(NSString *, id))blockAddAttr
{
    return ^(NSString *attrName, id attrValue){
        if([attrName isKindOfClass:[NSString class]]&& attrValue)
            [self addAttribute:attrName value:attrValue range:NSMakeRange(0, self.length)];
        return self;
    };
}
- (NSMutableAttributedString *(^)(UIFont *))blockAddAttrFont
{
    return ^(UIFont *font){
        if([font isKindOfClass:[UIFont class]]){
            [self addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, self.length)];
        }
        return self;
    };
}
- (NSMutableAttributedString *(^)(UIColor *))blockAddAttrTextColor
{
    return ^(UIColor *textColor){
        if([textColor isKindOfClass:[UIColor class]]){
            [self addAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(0, self.length)];
        }
        return self;
    };
}

- (NSMutableAttributedString *(^)(UIColor *))blockAddAttrBGColor
{
    return ^(UIColor *bgColor){
        if([bgColor isKindOfClass:[UIColor class]]){
            [self addAttribute:NSBackgroundColorAttributeName value:bgColor range:NSMakeRange(0, self.length)];
        }
        return self;
    };
}

- (NSMutableAttributedString *(^)(NSString *, NSDictionary *))blockSetAttrForStr
{
    return ^(NSString *forStr,NSDictionary* attrDict){
        if([forStr isKindOfClass:[NSString class]] &&
           [attrDict isKindOfClass:[NSDictionary class]]){
            NSUInteger tCurrentIndex= 0;
            for(;;){
                NSRange range= [self.string rangeOfString:forStr options:NSLiteralSearch range:NSMakeRange(tCurrentIndex, self.string.length- tCurrentIndex)];
                if(range.location!= NSNotFound){
                    [self setAttributes:attrDict range:range];
                    tCurrentIndex= range.location + range.length;
                }else{
                    break;
                }
            }
        }
        return self;
    };
}
- (NSMutableAttributedString *(^)(NSString *, NSDictionary *, NSRange))blockSetAttrForStrInRange
{
    return ^(NSString *forStr,NSDictionary* attrDict, NSRange range){
        if([forStr isKindOfClass:[NSString class]]&&
           [attrDict isKindOfClass:[NSDictionary class]]){
            NSUInteger tCurrentIndex= range.location;
            for(;;){
                NSRange range= [self.string rangeOfString:forStr options:NSLiteralSearch range:NSMakeRange(tCurrentIndex, (range.location+ range.length)- tCurrentIndex)];
                if(range.location!= NSNotFound){
                    [self setAttributes:attrDict range:range];
                    tCurrentIndex= range.location + range.length;
                }else{
                    break;
                }
            }
        }
        return self;
    };
}
- (NSMutableAttributedString *(^)(NSString *))blockRemoveAttr
{
    return ^(NSString* attrName){
        if([attrName isKindOfClass:[NSString class]]){
            [self removeAttribute:attrName range:NSMakeRange(0, self.length)];
        }
        return self;
    };
}

- (NSMutableAttributedString *(^)(NSString *, NSRange))blockRemoveAttrInRange
{
    return ^(NSString* attrName,NSRange range){
        if([attrName isKindOfClass:[NSString class]]){
            [self removeAttribute:attrName range:range];
        }
        return self;
    };
}
- (NSMutableAttributedString *(^)(NSRange))blockDeleteStrInRange
{
    return ^(NSRange range){
        [self deleteCharactersInRange:range];
        return self;
    };
}
- (NSMutableAttributedString *(^)(NSString *, NSRange))blockReplaceStrWithStrInRange
{
    return ^(NSString *str,NSRange range){
        if([str isKindOfClass:[NSString class]]){
            [self replaceCharactersInRange:range withString:str];
        }
        return self;
    };
}
- (NSMutableAttributedString *(^)(NSDictionary *))blockAddAttrDict
{
    return ^(NSDictionary* attrDict){
        if([attrDict isKindOfClass:[NSDictionary class]]){
            [self addAttributes:attrDict range:NSMakeRange(0, self.length)];
        }
        return self;
    };
}
- (NSMutableAttributedString *(^)(NSDictionary *))blockSetAttrDict
{
    return ^(NSDictionary *attrDict){
        if([attrDict isKindOfClass:[NSDictionary class]]){
            [self setAttributes:attrDict range:NSMakeRange(0, self.length)];
        }
        return self;
    };
}
- (NSMutableAttributedString *(^)(NSDictionary *, NSRange))blockSetAttrDictInRange
{
    return ^(NSDictionary *attrDict, NSRange range){
        if([attrDict isKindOfClass:[NSDictionary class]]){
            [self setAttributes:attrDict range: range];
        }
        return self;
    };
}

- (void)setBlockAddAttr:(NSMutableAttributedString *(^)(NSString *, id))blockAddAttr{};
- (void)setBlockAddAttrBGColor:(NSMutableAttributedString *(^)(UIColor *))blockAddAttrBGColor{};
- (void)setBlockAddAttrDict:(NSMutableAttributedString *(^)(NSDictionary *))blockAddAttrDict{};
- (void)setBlockAddAttrFont:(NSMutableAttributedString *(^)(UIFont *))blockAddAttrFont{};
- (void)setBlockAddAttrInRange:(NSMutableAttributedString *(^)(NSString *, id, NSRange))blockAddAttrInRange{};
- (void)setBlockAddAttrTextColor:(NSMutableAttributedString *(^)(UIColor *))blockAddAttrTextColor{};
- (void)setBlockAppendAttrStr:(NSMutableAttributedString *(^)(NSAttributedString *))blockAppendAttrStr{};
- (void)setBlockAppendStr:(NSMutableAttributedString *(^)(NSString *))blockAppendStr{};
- (void)setBlockAppendStrWithAttr:(NSMutableAttributedString *(^)(NSString *, NSString *, id))blockAppendStrWithAttr{};
- (void)setBlockAppendStrWithAttrDict:(NSMutableAttributedString *(^)(NSString *, NSDictionary *))blockAppendStrWithAttrDict{};
- (void)setBlockDeleteStrInRange:(NSMutableAttributedString *(^)(NSRange))blockDeleteStrInRange{};
- (void)setBlockInsertAttrStrAtIndex:(NSMutableAttributedString *(^)(NSAttributedString *, NSUInteger))blockInsertAttrStrAtIndex{}
;
- (void)setBlockInsertStrAtIndex:(NSMutableAttributedString *(^)(NSString *, NSUInteger))blockInsertStrAtIndex{};
- (void)setBlockInsertStrWithAttrAtIndex:(NSMutableAttributedString *(^)(NSString *, NSString *, id, NSUInteger))blockInsertStrWithAttrAtIndex{};
- (void)setBlockInsertStrWithAttrDict:(NSMutableAttributedString *(^)(NSString *, NSDictionary *, NSUInteger))blockInsertStrWithAttrDict{};
- (void)setBlockRemoveAttr:(NSMutableAttributedString *(^)(NSString *))blockRemoveAttr{};
- (void)setBlockRemoveAttrInRange:(NSMutableAttributedString *(^)(NSString *, NSRange))blockRemoveAttrInRange{};
- (void)setBlockReplaceStrWithStrInRange:(NSMutableAttributedString *(^)(NSString *, NSRange))blockReplaceStrWithStrInRange{};
- (void)setBlockSize:(CGRect (^)(CGFloat))blockSize{};
- (void)setBlockSizeWithOptions:(CGRect (^)(CGFloat, NSStringDrawingOptions))blockSizeWithOptions{};
- (void)setBlockSetAttrForStr:(NSMutableAttributedString *(^)(NSString *, NSDictionary *))blockAddAttrForStr{};
- (void)setBlockSetAttrForStrInRange:(NSMutableAttributedString *(^)(NSString *, NSDictionary *, NSRange))blockAddAttrForStrInRange{};
- (void)setBlockSetAttrDict:(NSMutableAttributedString *(^)(NSDictionary *))blockSetAttrDict{};
- (void)setBlockSetAttrDictInRange:(NSMutableAttributedString *(^)(NSDictionary *, NSRange))blockSetAttrDictInRange{};
@end
