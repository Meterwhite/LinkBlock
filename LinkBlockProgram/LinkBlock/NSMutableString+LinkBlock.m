//
//  NSMutableString+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"
#import "NSMutableString+LinkBlock.h"
#import "NSObject+LinkBlock.h"

@implementation NSMutableString(LinkBlock)
- (NSString *(^)())blockCopy
{
    return ^(){
        return [self copy];
    };
}
- (NSMutableString *(^)(NSString *, NSString *))blockReplaceStrWithStr
{
    return ^(NSString* replaceStr, NSString* withStr){
        if(replaceStr.blockIsKindOf([NSString class])&&
           withStr.blockIsKindOf([NSString class])){
            return (NSMutableString*)[[self stringByReplacingOccurrencesOfString:replaceStr withString:withStr] mutableCopy];
        }
        return self;
    };
}
- (void)setBlockReplaceStrWithStr:(NSMutableString *(^)(NSString *, NSString *))blockReplaceStrWithStr{};
- (void)setBlockCopy:(NSString *(^)())blockCopy{};
@end
