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
        LinkError_REF_AUTO_IF(NSString, UIColor);
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
        LinkError_REF_AUTO_IF(UIColor, UIColor);
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
        LinkError_REF_AUTO_IF(UIColor, UIColor);
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
- (void)setColorGreenSet:(UIColor *(^)(CGFloat))blockSetGreenValue{}

- (UIColor* (^)(CGFloat))colorBlueSet
{
    return ^(CGFloat value){
        LinkError_REF_AUTO_IF(UIColor, UIColor);
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
- (void)setColorBlueSet:(UIColor *(^)(CGFloat))blockSetBlueValue{}

- (UIColor* (^)(CGFloat))colorAlphaSet
{
    return ^(CGFloat value){
        LinkError_REF_AUTO_IF(UIColor, UIColor);
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
@end
