//
//  UIColor+LinkBlock.m

//
//  Created by NOVO on 15/8/18.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//
#import "LinkBlock.h"
#import "UIColor+LinkBlock.h"

@implementation NSObject(UIColorLinkBlock)
- (NSString *(^)(NSString *))colorToStrWithPrefix
{
    return ^(NSString* prefix){
        LinkError_REF_AUTO(NSString, UIColor);
        NSMutableString* reIsMStr = [NSMutableString string];
        if([prefix isKindOfClass:[NSString class]])
            [reIsMStr appendString:prefix];
        CGFloat r;
        CGFloat g;
        CGFloat b;
        CGFloat a;
        if([_self getRed:&r green:&g blue:&b alpha:&a]){
            [reIsMStr appendFormat:@"%02x",(int)(r* 255.0)];
            [reIsMStr appendFormat:@"%02x",(int)(g* 255.0)];
            [reIsMStr appendFormat:@"%02x",(int)(g* 255.0)];
        }else{
            return @"0xffffff";
        }
        
        return (NSString*)[reIsMStr copy];
    };
}
- (void)setColorToStrWithPrefix:(NSString *(^)(NSString *))blockToStringWithPrefix{};

- (CGFloat (^)())colorRed
{
    return ^(){
        LinkError_VAL_IF(UIColor){
            return (CGFloat)0.0;
        }
        CGFloat r;
        CGFloat g;
        CGFloat b;
        CGFloat a;
        if([_self getRed:&r green:&g blue:&b alpha:&a]){
            return r;
        }else{
            return (CGFloat)0.0;
        }
    };
}
- (void)setColorRed:(CGFloat (^)())blockRedValue{};

- (CGFloat (^)())colorGreen
{
    return ^(){
        LinkError_VAL_IF(UIColor){
            return (CGFloat)0.0;
        }
        CGFloat r;
        CGFloat g;
        CGFloat b;
        CGFloat a;
        if([_self getRed:&r green:&g blue:&b alpha:&a]){
            return g;
        }else{
            return (CGFloat)0.0;
        }
    };
}
- (void)setColorGreen:(CGFloat (^)())blockGreenValue{};

- (CGFloat (^)())colorBlue
{
    return ^(){
        LinkError_VAL_IF(UIColor){
            return (CGFloat)0.0;
        }
        CGFloat r;
        CGFloat g;
        CGFloat b;
        CGFloat a;
        if([_self getRed:&r green:&g blue:&b alpha:&a]){
            return b;
        }else{
            return (CGFloat)0.0;
        }
    };
}
- (void)setColorBlue:(CGFloat (^)())blockBlueValue{};

- (CGFloat (^)())colorAlpha
{
    return ^(){
        LinkError_VAL_IF(UIColor){
            return (CGFloat)0.0;
        }
        CGFloat r;
        CGFloat g;
        CGFloat b;
        CGFloat a;
        if([_self getRed:&r green:&g blue:&b alpha:&a]){
            return a;
        }else{
            return (CGFloat)1.0;
        }
    };
}
- (void)setColorAlpha:(CGFloat (^)())blockAlphaValue{};

- (UIColor* (^)(CGFloat))colorRedSet
{
    return ^(CGFloat value){
        LinkError_REF_AUTO(UIColor, UIColor);
        value = (value<0||value>1) ? 0.0 : value;
        CGFloat r;
        CGFloat g;
        CGFloat b;
        CGFloat a;
        if([_self getRed:&r green:&g blue:&b alpha:&a]){
            _self = [UIColor colorWithRed:value green:g blue:b alpha:a];
            return _self;
        }else{
            return _self;
        }
    };
}
- (void)setColorRedSet:(UIColor *(^)(CGFloat))blockSetRedValue{}

- (UIColor* (^)(CGFloat))colorGreenSet
{
    return ^(CGFloat value){
        LinkError_REF_AUTO(UIColor, UIColor);
        value = (value<0||value>1) ? 0.0 : value;
        CGFloat r;
        CGFloat g;
        CGFloat b;
        CGFloat a;
        if([_self getRed:&r green:&g blue:&b alpha:&a]){
            _self = [UIColor colorWithRed:r green:value blue:b alpha:a];
            return _self;
        }else{
            return _self;
        }
    };
}
- (void)setColorGreenSet:(UIColor *(^)(CGFloat))blockSetGreenValue{}

- (UIColor* (^)(CGFloat))colorBlueSet
{
    return ^(CGFloat value){
        LinkError_REF_AUTO(UIColor, UIColor);
        value = (value<0||value>1) ? 0.0 : value;
        CGFloat r;
        CGFloat g;
        CGFloat b;
        CGFloat a;
        if([_self getRed:&r green:&g blue:&b alpha:&a]){
            _self = [UIColor colorWithRed:r green:g blue:value alpha:a];
            return _self;
        }else{
            return _self;
        }
    };
}
- (void)setColorBlueSet:(UIColor *(^)(CGFloat))blockSetBlueValue{}

- (UIColor* (^)(CGFloat))colorAlphaSet
{
    return ^(CGFloat value){
        LinkError_REF_AUTO(UIColor, UIColor);
        value = (value<0||value>1) ? 0.0 : value;
        CGFloat r;
        CGFloat g;
        CGFloat b;
        CGFloat a;
        if([_self getRed:&r green:&g blue:&b alpha:&a]){
            return [UIColor colorWithRed:r green:g blue:b alpha:value];
        }else{
            return _self;
        }
    };
}
- (void)setColorAlphaSet:(UIColor *(^)(CGFloat))blockSetAlphaValue{}

- (UIColor *(^)(NSArray *))colorSetBackgroundToViews
{
    return ^(NSArray* views){
        LinkError_REF_AUTO(UIColor, UIColor);
        [views enumerateObjectsUsingBlock:^(UIView* view, NSUInteger idx, BOOL *stop) {
            if([view isKindOfClass:[UIView class]])
                view.backgroundColor = _self;
        }];
        return _self;
    };
}
- (void)setColorSetBackgroundToViews:(UIColor *(^)(NSArray *))colorSetBackgroundToViews{};

- (UIColor *(^)(UIView *))colorSetTextColorToViewSubviews
{
    return ^(UIView* view){
        LinkError_REF_AUTO(UIColor, UIColor);
        if(![view isKindOfClass:[UIView class]])
            return _self;
        if([view isKindOfClass:[UILabel class]]     ||
           [view isKindOfClass:[UITextView class]]  ||
           [view isKindOfClass:[UITextField class]]
           )
        {
            [view setValue:_self forKey:@"textColor"];
        }
        else if ([view isKindOfClass:[UIButton class]])
        {
            [((UIButton*)view) setTitleColor:_self forState:UIControlStateNormal];
        }
        //子视图
        [view.subviews enumerateObjectsUsingBlock:^(UIView* obj, NSUInteger idx, BOOL *stop) {
            if([obj isKindOfClass:[UILabel class]]     ||
               [obj isKindOfClass:[UITextView class]]  ||
               [obj isKindOfClass:[UITextField class]]
               )
            {
                [obj setValue:_self forKey:@"textColor"];
            }
            else if ([obj isKindOfClass:[UIButton class]])
            {
                [((UIButton*)obj) setTitleColor:_self forState:UIControlStateNormal];
            }
        }];
        
        return _self;
    };
}
- (void)setColorSetTextColorToViewSubviews:(UIColor *(^)(UIView *))colorSetTextColorToViewSubviews{};
@end
