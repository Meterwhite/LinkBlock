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
    return ^id(BOOL enable){
        LinkHandle_REF(UIControl, UIControl)
        LinkGroupHandle_REF(controlEnable,enable)
        _self.enabled=enable;
        return _self;
    };
}
- (void)setControlEnable:(UIControl *(^)(BOOL))controlEnable{};

- (UIControl *(^)(BOOL))controlSelected
{
    return ^id(BOOL selected){
        LinkHandle_REF(UIControl, UIControl)
        LinkGroupHandle_REF(controlSelected,selected)
        _self.selected=selected;
        return _self;
    };
}
- (void)setControlSelected:(UIControl *(^)(BOOL))controlSelected{};

- (UIControl *(^)(BOOL))controlHighlighted
{
    return ^id(BOOL highlighted){
        LinkHandle_REF(UIControl, UIControl)
        LinkGroupHandle_REF(controlHighlighted,highlighted)
        _self.highlighted=highlighted;
        return _self;
    };
}
- (void)setControlHighlighted:(UIControl *(^)(BOOL))controlHighlighted{};

- (UIControl *(^)(UIControlContentVerticalAlignment))controlContentVerticalAlignment
{
    return ^id(UIControlContentVerticalAlignment alignment){
        LinkHandle_REF(UIControl, UIControl)
        LinkGroupHandle_REF(controlContentVerticalAlignment,alignment)
        _self.contentVerticalAlignment = alignment;
        return _self;
    };
}
- (void)setControlContentVerticalAlignment:(UIControl *(^)(UIControlContentVerticalAlignment))controlContentVerticalAlignment{};

- (UIControl *(^)(UIControlContentHorizontalAlignment))controlContentHorizontalAlignment
{
    return ^id(UIControlContentHorizontalAlignment alignment){
        LinkHandle_REF(UIControl, UIControl)
        LinkGroupHandle_REF(controlContentHorizontalAlignment,alignment)
        _self.contentHorizontalAlignment = alignment;
        return _self;
    };
}
- (void)setControlContentHorizontalAlignment:(UIControl *(^)(UIControlContentHorizontalAlignment))controlContentHorizontalAlignment{};
@end