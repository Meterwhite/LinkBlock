//
//  UIControl+LinkBlock.m
//
//  Created by NOVO on 15/8/18.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//
#import "LinkBlock.h"
#import <objc/runtime.h>

@implementation NSObject(UIControlLinkBlock)

- (UIControl *(^)(BOOL))controlEnable
{
    return ^(BOOL enable){
        LinkError_REF_AUTO(UIControl, UIControl);
        _self.enabled=enable;
        return _self;
    };
}
- (void)setControlEnable:(UIControl *(^)(BOOL))controlEnable{};

- (UIControl *(^)(BOOL))controlSelected
{
    return ^(BOOL selected){
        LinkError_REF_AUTO(UIControl, UIControl);
        _self.selected=selected;
        return _self;
    };
}
- (void)setControlSelected:(UIControl *(^)(BOOL))controlSelected{};

- (UIControl *(^)(BOOL))controlHighlighted
{
    return ^(BOOL highlighted){
        LinkError_REF_AUTO(UIControl, UIControl);
        _self.highlighted=highlighted;
        return _self;
    };
}
- (void)setControlHighlighted:(UIControl *(^)(BOOL))controlHighlighted{};

- (UIControl *(^)(UIControlContentVerticalAlignment))controlContentVerticalAlignment
{
    return ^(UIControlContentVerticalAlignment alignment){
        LinkError_REF_AUTO(UIControl, UIControl);
        _self.contentVerticalAlignment = alignment;
        return _self;
    };
}
- (void)setControlContentVerticalAlignment:(UIControl *(^)(UIControlContentVerticalAlignment))controlContentVerticalAlignment{};

- (UIControl *(^)(UIControlContentHorizontalAlignment))controlContentHorizontalAlignment
{
    return ^(UIControlContentHorizontalAlignment alignment){
        LinkError_REF_AUTO(UIControl, UIControl);
        _self.contentHorizontalAlignment = alignment;
        return _self;
    };
}
- (void)setControlContentHorizontalAlignment:(UIControl *(^)(UIControlContentHorizontalAlignment))controlContentHorizontalAlignment{};
@end