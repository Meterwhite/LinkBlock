//
//  UIButton+LinkBlock.m
//
//  Created by NOVO on 15/8/19.
//  Copyright (c) 2015年 QuXingYi. All rights reserved.
//

#import "UIButton+LinkBlock.h"
#import "LinkBlock.h"

@implementation NSObject(UIButtonLinkBlock)
- (UIButton *(^)(CGFloat top, CGFloat left, CGFloat botton, CGFloat right))btnTitleEdgeInsets
{
    return ^(CGFloat top, CGFloat left, CGFloat botton, CGFloat right){
        LinkError_REF_AUTO_IF(UIButton, UIButton);
        _self.titleEdgeInsets = UIEdgeInsetsMake(top, left, botton, right);
        return _self;
    };
}
- (void)setBtnTitleEdgeInsets:(UIButton *(^)(CGFloat, CGFloat, CGFloat, CGFloat))blockTitleEdgeInsets{};

- (UIButton *(^)(CGFloat, CGFloat, CGFloat, CGFloat))btnImageEdgeInsets
{
    return ^(CGFloat top, CGFloat left, CGFloat botton, CGFloat right){
        LinkError_REF_AUTO_IF(UIButton, UIButton);
        _self.imageEdgeInsets = UIEdgeInsetsMake(top, left, botton, right);
        return _self;
    };
}
- (void)setBtnImageEdgeInsets:(UIButton *(^)(CGFloat, CGFloat, CGFloat, CGFloat))blockImageEdgeInsets{};

- (UIButton *(^)(NSString *, UIControlState))btnTitle
{
    return ^(NSString* title, UIControlState state){
        LinkError_REF_AUTO_IF(UIButton, UIButton);
        [_self setTitle:title forState:state];
        return _self;
    };
}
- (void)setBtnTitle:(UIButton *(^)(NSString *, UIControlState))blockSetTitle{};

- (UIButton *(^)(UIImage *, UIControlState))btnImage
{
    return ^(UIImage* img, UIControlState state){
        LinkError_REF_AUTO_IF(UIButton, UIButton);
        [_self setImage:img forState:state];
        return _self;
    };
}
- (void)setBtnImage:(UIButton *(^)(UIImage *, UIControlState))blockSetImage{};

- (UIButton *(^)(UIImage *, UIControlState))btnBGImage
{
    return ^(UIImage* img, UIControlState state){
        LinkError_REF_AUTO_IF(UIButton, UIButton);
        [_self setBackgroundImage:img forState:state];
        return _self;
    };
}
- (void)setBtnBGImage:(UIButton *(^)(UIImage *, UIControlState))blockSetBGImage{};

- (UIButton *(^)(UIFont *))btnTitleFont
{
    return ^(UIFont* font){
        LinkError_REF_AUTO_IF(UIButton, UIButton);
        _self.titleLabel.labFont(font);
        return _self;
    };
}
- (void)setBtnTitleFont:(UIButton *(^)(UIFont *))blockTitleFontSet{};

- (UIButton *(^)(CGFloat))btnTitleFontSize
{
    return ^(CGFloat size){
        LinkError_REF_AUTO_IF(UIButton, UIButton);
        _self.titleLabel.labFontSizeSystem(size);
        return _self;
    };
}
- (void)setBtnTitleFontSize:(UIButton *(^)(CGFloat))blockTitleFontSizeSet{};

- (UIButton *(^)(NSAttributedString *, UIControlState))btnAttributeTitle
{
    return ^(NSAttributedString* attrStr , UIControlState state){
        LinkError_REF_AUTO_IF(UIButton, UIButton);
        [_self setAttributedTitle:attrStr forState:state];
        return _self;
    };
}
- (void)setBtnAttributeTitle:(UIButton *(^)(NSAttributedString *, UIControlState))blockAttributeTitleSet{};
@end
