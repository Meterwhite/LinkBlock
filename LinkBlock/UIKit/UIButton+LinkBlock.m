//
//  UIButton+LinkBlock.m
//
//  Created by NOVO on 15/8/19.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(UIButtonLinkBlock)
- (UIButton *(^)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right))btnTitleEdgeInsets
{
    return ^(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right){
        LinkError_REF_AUTO(UIButton, UIButton);
        _self.titleEdgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
        return _self;
    };
}
- (void)setBtnTitleEdgeInsets:(UIButton *(^)(CGFloat, CGFloat, CGFloat, CGFloat))blockTitleEdgeInsets{};

- (UIButton *(^)(CGFloat, CGFloat, CGFloat, CGFloat))btnImageEdgeInsets
{
    return ^(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right){
        LinkError_REF_AUTO(UIButton, UIButton);
        _self.imageEdgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
        return _self;
    };
}
- (void)setBtnImageEdgeInsets:(UIButton *(^)(CGFloat, CGFloat, CGFloat, CGFloat))blockImageEdgeInsets{};

- (UIButton *(^)(NSString *, UIControlState))btnTitle
{
    return ^(NSString* title, UIControlState state){
        LinkError_REF_AUTO(UIButton, UIButton);
        [_self setTitle:title forState:state];
        return _self;
    };
}
- (void)setBtnTitle:(UIButton *(^)(NSString *, UIControlState))blockSetTitle{};

- (UIButton *(^)(UIColor *, UIControlState))btnTitleColor
{
    return ^(UIColor* color, UIControlState state){
        LinkError_REF_AUTO(UIButton, UIButton);
        [_self setTitleColor:color forState:state];
        return _self;
    };
}
- (void)setBtnTitleColor:(UIButton *(^)(UIColor *, UIControlState))btnTitleColor{};

- (UIButton *(^)(UIImage *, UIControlState))btnImage
{
    return ^(UIImage* img, UIControlState state){
        LinkError_REF_AUTO(UIButton, UIButton);
        [_self setImage:img forState:state];
        return _self;
    };
}
- (void)setBtnImage:(UIButton *(^)(UIImage *, UIControlState))blockSetImage{};

- (UIButton *(^)(UIImage *, UIControlState))btnBGImage
{
    return ^(UIImage* img, UIControlState state){
        LinkError_REF_AUTO(UIButton, UIButton);
        [_self setBackgroundImage:img forState:state];
        return _self;
    };
}
- (void)setBtnBGImage:(UIButton *(^)(UIImage *, UIControlState))blockSetBGImage{};

- (UIButton *(^)(UIFont *))btnTitleFont
{
    return ^(UIFont* font){
        LinkError_REF_AUTO(UIButton, UIButton);
        _self.titleLabel.labFont(font);
        return _self;
    };
}
- (void)setBtnTitleFont:(UIButton *(^)(UIFont *))blockTitleFontSet{};

- (UIButton *(^)(CGFloat))btnTitleFontSystemSizeSet
{
    return ^(CGFloat size){
        LinkError_REF_AUTO(UIButton, UIButton);
        _self.titleLabel.labFontSystemSizeSet(size);
        return _self;
    };
}
- (void)setBtnTitleFontSystemSizeSet:(UIButton *(^)(CGFloat))btnTitleFontSystemSizeSet{};

- (UIButton *(^)(NSAttributedString *, UIControlState))btnAttributeTitle
{
    return ^(NSAttributedString* attrStr , UIControlState state){
        LinkError_REF_AUTO(UIButton, UIButton);
        [_self setAttributedTitle:attrStr forState:state];
        return _self;
    };
}
- (void)setBtnAttributeTitle:(UIButton *(^)(NSAttributedString *, UIControlState))blockAttributeTitleSet{};

- (CGFloat (^)())btnTitleFontSystemSizeGet
{
    return ^(){
        LinkError_VAL_IF(UIButton){
            return 0.0;
        }
        return _self.titleLabel.font.pointSize;
    };
}
- (void)setBtnTitleFontSystemSizeGet:(CGFloat (^)())btnTitleFontSystemSizeGet{};
@end
