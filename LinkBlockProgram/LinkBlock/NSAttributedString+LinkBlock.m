//
//  NSAttributedString+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"
#import "NSAttributedString+LinkBlock.h"
#import "NSObject+LinkBlock.h"

@implementation NSObject(NSAttributedStringLinkBlock)
- (CGRect (^)(CGFloat))attr_strSize
{
    return ^(CGFloat maxWidth){
        LinkError_VAL_IF(NSAttributedString){
            return CGRectZero;
        }
        return [_self boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
    };
}
- (void)setAttr_strSize:(CGRect (^)(CGFloat))blockSize{};

- (CGRect (^)(CGFloat, NSStringDrawingOptions))attr_strSizeWithOptions
{
    return ^(CGFloat maxWidth,NSStringDrawingOptions options ){
        LinkError_VAL_IF(NSAttributedString){
            return CGRectZero;
        }
        return [_self boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:options context:nil];
    };
}
- (void)setAttr_strSizeWithOptions:(CGRect (^)(CGFloat, NSStringDrawingOptions))blockSizeWithOptions{};

- (BOOL (^)(NSAttributedString *))attr_strIsEqualToAttrStr
{
    return ^(NSAttributedString* attrStr){
        LinkError_VAL_IF(NSAttributedString){
            return NO;
        }
        return [_self isEqualToAttributedString:attrStr];
    };
}
- (void)setAttr_strIsEqualToAttrStr:(BOOL (^)(NSAttributedString *))blockIsEqualToAttrStr{};
@end
