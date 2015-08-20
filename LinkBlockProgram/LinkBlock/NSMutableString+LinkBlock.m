//
//  NSMutableString+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"
#import "NSMutableString+LinkBlock.h"
#import "NSObject+LinkBlock.h"

@implementation NSObject(NSMutableStringLinkBlock)
- (NSMutableString *(^)(NSString *, NSString *))m_strReplaceStr
{
    return ^(NSString* replaceStr, NSString* withStr){
        LinkError_REF_AUTO_IF(NSMutableString, NSMutableString);
        if(replaceStr.objIsKind([NSString class]) &&
           withStr.objIsKind([NSString class])){
            return (NSMutableString*)[[_self stringByReplacingOccurrencesOfString:replaceStr withString:withStr] mutableCopy];
        }
        return _self;
    };
}
- (void)setM_strReplaceStr:(NSMutableString *(^)(NSString *, NSString *))blockReplaceStrWithStr{};

@end
