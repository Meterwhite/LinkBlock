//
//  NSMutableString+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(NSMutableStringLinkBlock)
- (NSMutableString *(^)(NSString *, NSString *))m_strReplaceStr
{
    return ^id(NSString* replaceStr, NSString* withStr){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(m_strReplaceStr,replaceStr,withStr)
        if([replaceStr isKindOfClass:[NSString class]] &&
           [withStr isKindOfClass:[NSString class]] ){
            return [[_self stringByReplacingOccurrencesOfString:replaceStr withString:withStr] mutableCopy];
        }
        return _self;
    };
}

- (NSMutableString *(^)(NSString *, NSUInteger))m_strInsertStrAt
{
    return ^id(NSString* str, NSUInteger idx){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(m_strInsertStrAt,str,idx)
        [_self insertString:str atIndex:idx];
        return _self;
    };
}

- (NSMutableString *(^)(NSString *))m_strAppenStr
{
    return ^id(NSString* str){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(m_strAppenStr,str)
        [_self appendString:str];
        return _self;
    };
}

- (NSMutableString *(^)(void))m_strClear
{
    return ^id(){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(m_strClear)
        [_self setString:@""];
        return _self;
    };
}

- (NSMutableString *(^)(NSRange))m_strDeleteInRange
{
    return ^id(NSRange range){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(m_strDeleteInRange,range)
        [_self deleteCharactersInRange:range];
        return _self;
    };
}
@end


@implementation NSMutableString(NSMutableStringLinkBlock)

- (void)m_strEnumerateComposedModifiedUsingBlock:(void (^)(NSString *__autoreleasing *, NSRange, BOOL *))block
{
    if(block){
        NSMutableString* newStr = [NSMutableString new];
        [self enumerateSubstringsInRange:NSMakeRange(0, self.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
            block(&substring,enclosingRange,stop);
            [newStr appendString:substring];
        }];
        [self setString:newStr];
    }
}
@end
