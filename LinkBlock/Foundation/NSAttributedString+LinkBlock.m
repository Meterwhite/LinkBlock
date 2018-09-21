//
//  NSAttributedString+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(NSAttributedStringLinkBlock)
- (CGRect (^)(CGFloat))attr_strSize
{
    return ^(CGFloat maxWidth){
        LinkHandle_VAL_IFNOT(NSAttributedString){
            return CGRectZero;
        }
        LinkGroupHandle_VAL(attr_strSize,maxWidth)
        return [_self boundingRectWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
    };
}

- (NSValue* (^)(CGFloat))attr_strSizeING
{
    return ^id(CGFloat maxWidth){
        LinkHandle_REF(NSAttributedString)
        LinkGroupHandle_REF(attr_strSizeING,maxWidth)
        return [NSValue valueWithCGRect:[_self boundingRectWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil]];
    };
}

- (CGRect (^)(CGFloat, NSStringDrawingOptions))attr_strSizeWithOptions
{
    return ^(CGFloat maxWidth,NSStringDrawingOptions options ){
        LinkHandle_VAL_IFNOT(NSAttributedString){
            return CGRectZero;
        }
        LinkGroupHandle_VAL(attr_strSizeWithOptions,maxWidth,options)
        return [_self boundingRectWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX) options:options context:nil];
    };
}

- (NSValue* (^)(CGFloat, NSStringDrawingOptions))attr_strSizeWithOptionsING
{
    return ^id(CGFloat maxWidth,NSStringDrawingOptions options ){
        LinkHandle_REF(NSAttributedString)
        LinkGroupHandle_REF(attr_strSizeWithOptionsING,maxWidth,options)
        return [NSValue valueWithCGRect:[_self boundingRectWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX) options:options context:nil]];
    };
}

- (BOOL (^)(NSAttributedString *))attr_strIsEqualToAttrStr
{
    return ^(NSAttributedString* attrStr){
        LinkHandle_VAL_IFNOT(NSAttributedString){
            return NO;
        }
        LinkGroupHandle_VAL(attr_strIsEqualToAttrStr,attrStr)
        return [_self isEqualToAttributedString:attrStr];
    };
}

- (NSNumber* (^)(NSAttributedString *))attr_strIsEqualToAttrStrING
{
    return ^id(NSAttributedString* attrStr){
        LinkHandle_REF(NSAttributedString)
        LinkGroupHandle_REF(attr_strIsEqualToAttrStrING,attrStr)
        return @([_self isEqualToAttributedString:attrStr]);
    };
}

- (UIImage *(^)(UIImage *, CGRect))attr_strDrawToImg_linkTo
{
    return ^id(UIImage* image, CGRect rect){
        LinkHandle_REF(NSAttributedString)
        LinkGroupHandle_REF(attr_strDrawToImg_linkTo,image,rect)
        UIGraphicsBeginImageContext(image.size);
        [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
        [_self drawInRect:rect];
        UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return linkObj(newImg);
    };
}

- (UILabel *(^)(UILabel *))attr_strSetToLabel_linkTo
{
    return ^id(UILabel* lab){
        LinkHandle_REF(NSAttributedString)
        LinkGroupHandle_REF(attr_strSetToLabel_linkTo,lab)
        lab.attributedText = _self;
        return linkObj(lab);
    };
}
@end
