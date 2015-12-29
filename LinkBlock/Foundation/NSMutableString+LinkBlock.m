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
    return ^(NSString* replaceStr, NSString* withStr){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        if(replaceStr.isKindOf([NSString class]) &&
           withStr.isKindOf([NSString class])){
            return (NSMutableString*)[[_self stringByReplacingOccurrencesOfString:replaceStr withString:withStr] mutableCopy];
        }
        return _self;
    };
}
- (void)setM_strReplaceStr:(NSMutableString *(^)(NSString *, NSString *))blockReplaceStrWithStr{};

- (NSMutableString *(^)(NSString *, NSUInteger))m_strInsertStrAt
{
    return ^(NSString* str, NSUInteger idx){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self insertString:str atIndex:idx];
        return _self;
    };
}
- (void)setM_strInsertStrAt:(NSMutableString *(^)(NSString *, NSUInteger))m_strInsertStrAt{};

- (NSMutableString *(^)(NSString *))m_strAppenStr
{
    return ^(NSString* str){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self appendString:str];
        return _self;
    };
}
- (void)setM_strAppenStr:(NSMutableString *(^)(NSString *))m_strAppenStr{};
@end


@implementation NSMutableArray(NSMutableStringLinkBlock)

@end