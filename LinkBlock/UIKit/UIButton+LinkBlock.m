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
    return ^id(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnTitleEdgeInsets,top,left,bottom,right)
        _self.titleEdgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
        return _self;
    };
}

- (UIButton *(^)(CGFloat, CGFloat, CGFloat, CGFloat))btnImageEdgeInsets
{
    return ^id(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnImageEdgeInsets,top,left,bottom,right)
        _self.imageEdgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
        return _self;
    };
}

- (UIButton *(^)(NSString *, UIControlState))btnTitle
{
    return ^id(NSString* title, UIControlState state){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnTitle,title,state)
        [_self setTitle:title forState:state];
        return _self;
    };
}
- (UIButton *(^)(NSString *))btnTitleUIControlStateNormal
{
    return ^id(NSString* title){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnTitleUIControlStateNormal,title)
        [_self setTitle:title forState:UIControlStateNormal];
        return _self;
    };
}
- (UIButton *(^)(NSString *))btnTitleUIControlStateHighlighted
{
    return ^id(NSString* title){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnTitleUIControlStateHighlighted,title)
        [_self setTitle:title forState:UIControlStateHighlighted];
        return _self;
    };
}
- (UIButton *(^)(NSString *))btnTitleUIControlStateDisabled
{
    return ^id(NSString* title){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnTitleUIControlStateDisabled,title)
        [_self setTitle:title forState:UIControlStateDisabled];
        return _self;
    };
}
- (UIButton *(^)(NSString *))btnTitleUIControlStateSelected
{
    return ^id(NSString* title){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnTitleUIControlStateSelected,title)
        [_self setTitle:title forState:UIControlStateSelected];
        return _self;
    };
}
- (UIButton *(^)(NSString *))btnTitleUIControlStateFocused
{
    return ^id(NSString* title){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnTitleUIControlStateFocused,title)
        [_self setTitle:title forState:UIControlStateFocused];
        return _self;
    };
}
- (UIButton *(^)(NSString *))btnTitleUIControlStateApplication
{
    return ^id(NSString* title){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnTitleUIControlStateApplication,title)
        [_self setTitle:title forState:UIControlStateApplication];
        return _self;
    };
}
- (UIButton *(^)(NSString *))btnTitleUIControlStateReserved
{
    return ^id(NSString* title){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnTitleUIControlStateReserved,title)
        [_self setTitle:title forState:UIControlStateReserved];
        return _self;
    };
}

- (UIButton *(^)(UIColor *, UIControlState))btnTitleColor
{
    return ^id(UIColor* color, UIControlState state){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnTitleColor,color,state)
        [_self setTitleColor:color forState:state];
        return _self;
    };
}
- (UIButton *(^)(UIColor *))btnTitleColorUIControlStateNormal
{
    return ^id(UIColor* color){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnTitleColorUIControlStateNormal,color)
        [_self setTitleColor:color forState:UIControlStateNormal];
        return _self;
    };
}
- (UIButton *(^)(UIColor *))btnTitleColorUIControlStateHighlighted
{
    return ^id(UIColor* color){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnTitleColorUIControlStateHighlighted,color)
        [_self setTitleColor:color forState:UIControlStateHighlighted];
        return _self;
    };
}
- (UIButton *(^)(UIColor *))btnTitleColorUIControlStateDisabled
{
    return ^id(UIColor* color){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnTitleColorUIControlStateDisabled,color)
        [_self setTitleColor:color forState:UIControlStateDisabled];
        return _self;
    };
}
- (UIButton *(^)(UIColor *))btnTitleColorUIControlStateSelected
{
    return ^id(UIColor* color){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnTitleColorUIControlStateSelected,color)
        [_self setTitleColor:color forState:UIControlStateSelected];
        return _self;
    };
}
- (UIButton *(^)(UIColor *))btnTitleColorUIControlStateFocused
{
    return ^id(UIColor* color){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnTitleColorUIControlStateFocused,color)
        [_self setTitleColor:color forState:UIControlStateFocused];
        return _self;
    };
}
- (UIButton *(^)(UIColor *))btnTitleColorUIControlStateApplication
{
    return ^id(UIColor* color){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnTitleColorUIControlStateApplication,color)
        [_self setTitleColor:color forState:UIControlStateApplication];
        return _self;
    };
}
- (UIButton *(^)(UIColor *))btnTitleColorUIControlStateReserved
{
    return ^id(UIColor* color){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnTitleColorUIControlStateReserved,color)
        [_self setTitleColor:color forState:UIControlStateReserved];
        return _self;
    };
}

- (UIButton *(^)(UIImage *, UIControlState))btnImage
{
    return ^id(UIImage* img, UIControlState state){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnImage,img,state)
        [_self setImage:img forState:state];
        return _self;
    };
}
- (UIButton *(^)(UIImage *))btnImageUIControlStateNormal
{
    return ^id(UIImage* img){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnImageUIControlStateNormal,img)
        [_self setImage:img forState:UIControlStateNormal];
        return _self;
    };
}
- (UIButton *(^)(UIImage *))btnImageUIControlStateHighlighted
{
    return ^id(UIImage* img){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnImageUIControlStateHighlighted,img)
        [_self setImage:img forState:UIControlStateHighlighted];
        return _self;
    };
}
- (UIButton *(^)(UIImage *))btnImageUIControlStateDisabled
{
    return ^id(UIImage* img){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnImageUIControlStateDisabled,img)
        [_self setImage:img forState:UIControlStateDisabled];
        return _self;
    };
}
- (UIButton *(^)(UIImage *))btnImageUIControlStateSelected
{
    return ^id(UIImage* img){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnImageUIControlStateSelected,img)
        [_self setImage:img forState:UIControlStateSelected];
        return _self;
    };
}
- (UIButton *(^)(UIImage *))btnImageUIControlStateFocused
{
    return ^id(UIImage* img){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnImageUIControlStateFocused,img)
        [_self setImage:img forState:UIControlStateFocused];
        return _self;
    };
}
- (UIButton *(^)(UIImage *))btnImageUIControlStateApplication
{
    return ^id(UIImage* img){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnImageUIControlStateApplication,img)
        [_self setImage:img forState:UIControlStateApplication];
        return _self;
    };
}
- (UIButton *(^)(UIImage *))btnImageUIControlStateReserved
{
    return ^id(UIImage* img){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnImageUIControlStateReserved,img)
        [_self setImage:img forState:UIControlStateReserved];
        return _self;
    };
}


- (UIButton *(^)(UIImage *, UIControlState))btnBGImage
{
    return ^id(UIImage* img, UIControlState state){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnBGImage,img,state)
        [_self setBackgroundImage:img forState:state];
        return _self;
    };
}
- (UIButton *(^)(UIImage *))btnBGImageUIControlStateNormal
{
    return ^id(UIImage* img){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnBGImageUIControlStateNormal,img)
        [_self setBackgroundImage:img forState:UIControlStateNormal];
        return _self;
    };
}
- (UIButton *(^)(UIImage *))btnBGImageUIControlStateHighlighted
{
    return ^id(UIImage* img){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnBGImageUIControlStateHighlighted,img)
        [_self setBackgroundImage:img forState:UIControlStateHighlighted];
        return _self;
    };
}
- (UIButton *(^)(UIImage *))btnBGImageUIControlStateDisabled
{
    return ^id(UIImage* img){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnBGImageUIControlStateDisabled,img)
        [_self setBackgroundImage:img forState:UIControlStateDisabled];
        return _self;
    };
}
- (UIButton *(^)(UIImage *))btnBGImageUIControlStateSelected
{
    return ^id(UIImage* img){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnBGImageUIControlStateSelected,img)
        [_self setBackgroundImage:img forState:UIControlStateSelected];
        return _self;
    };
}
- (UIButton *(^)(UIImage *))btnBGImageUIControlStateFocused
{
    return ^id(UIImage* img){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnBGImageUIControlStateFocused,img)
        [_self setBackgroundImage:img forState:UIControlStateFocused];
        return _self;
    };
}
- (UIButton *(^)(UIImage *))btnBGImageUIControlStateApplication
{
    return ^id(UIImage* img){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnBGImageUIControlStateApplication,img)
        [_self setBackgroundImage:img forState:UIControlStateApplication];
        return _self;
    };
}
- (UIButton *(^)(UIImage *))btnBGImageUIControlStateReserved
{
    return ^id(UIImage* img){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnBGImageUIControlStateReserved,img)
        [_self setBackgroundImage:img forState:UIControlStateReserved];
        return _self;
    };
}

- (UIButton *(^)(UIFont *))btnTitleFont
{
    return ^id(UIFont* font){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnTitleFont,font)
        _self.titleLabel.labFont(font);
        return _self;
    };
}

- (UIButton *(^)(CGFloat))btnTitleFontSystemSizeSet
{
    return ^id(CGFloat size){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnTitleFontSystemSizeSet,size)
        _self.titleLabel.labFontSystemSizeSet(size);
        return _self;
    };
}

- (UIButton *(^)(NSAttributedString *, UIControlState))btnAttributeTitle
{
    return ^id(NSAttributedString* attrStr , UIControlState state){
        LinkHandle_REF(UIButton)
        LinkGroupHandle_REF(btnAttributeTitle,attrStr,state)
        [_self setAttributedTitle:attrStr forState:state];
        return _self;
    };
}

- (CGFloat (^)())btnTitleFontSystemSizeGet
{
    return ^(){
        LinkHandle_VAL_IFNOT(UIButton){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(btnTitleFontSystemSizeGet)
        return _self.titleLabel.font.pointSize;
    };
}

@end
