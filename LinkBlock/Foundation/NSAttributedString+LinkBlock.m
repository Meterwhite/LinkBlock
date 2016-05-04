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

- (UIImage *(^)(UIImage *, CGRect))attr_strDrawImgRect
{
    return ^(UIImage* image, CGRect rect){
        LinkError_REF_AUTO(UIImage , NSAttributedString);
        UIGraphicsBeginImageContext(image.size);
        [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
        [_self drawInRect:rect];
        UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImg;
    };
}
- (void)setAttr_strDrawImgRect:(UIImage *(^)(UIImage *, CGRect))attr_strDrawImgRect{};
@end
