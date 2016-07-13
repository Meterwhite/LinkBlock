//
//  UIColor+LinkBlock.m

//
//  Created by NOVO on 15/8/18.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//
#import "LinkBlock.h"

@implementation NSObject(UIColorLinkBlock)
- (NSString *(^)(NSString *))colorToStrWithPrefix
{
    return ^id(NSString* prefix){
        LinkHandle_REF(NSString, UIColor)
        LinkGroupHandle_REF(colorToStrWithPrefix,prefix)
        NSMutableString* reIsMStr = [NSMutableString string];
        if([prefix isKindOfClass:[NSString class]]) [reIsMStr appendString:prefix];
        CGFloat r;CGFloat g;CGFloat b;CGFloat a;
        if([_self getRed:&r green:&g blue:&b alpha:&a]){
            
            [reIsMStr appendFormat:@"%02x",(int)(r*255.0)];
            [reIsMStr appendFormat:@"%02x",(int)(g*255.0)];
            [reIsMStr appendFormat:@"%02x",(int)(g*255.0)];
        }else{
            return (NSString*)nil;
        }
        return (NSString*)[reIsMStr copy];
    };
}
- (void)setColorToStrWithPrefix:(NSString *(^)(NSString *))blockToStringWithPrefix{};

- (CGFloat (^)())colorRed
{
    return ^(){
        LinkHandle_VAL_IFNOT(UIColor){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(colorRed)
        CGFloat r;CGFloat g;CGFloat b;CGFloat a;
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
        LinkHandle_VAL_IFNOT(UIColor){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(colorGreen)
        CGFloat r;CGFloat g;CGFloat b;CGFloat a;
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
        LinkHandle_VAL_IFNOT(UIColor){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(colorBlue)
        CGFloat r;CGFloat g;CGFloat b;CGFloat a;
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
        LinkHandle_VAL_IFNOT(UIColor){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(colorAlpha)
        CGFloat r;CGFloat g;CGFloat b;CGFloat a;
        if([_self getRed:&r green:&g blue:&b alpha:&a]){
            return a;
        }else{
            return (CGFloat)1.0;
        }
    };
}
- (void)setColorAlpha:(CGFloat (^)())blockAlphaValue{};

- (CGFloat (^)())colorHue
{
    return ^(){
        LinkHandle_VAL_IFNOT(UIColor){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(colorHue)
        CGFloat hue;CGFloat saturation;CGFloat brightness;CGFloat a;
        if([_self getHue:&hue saturation:&saturation brightness:&brightness alpha:&a]){
            return hue;
        }else{
            return (CGFloat)1.0;
        }
    };
}
- (void)setColorHue:(CGFloat (^)())colorHue{};

- (CGFloat (^)())colorSaturation
{
    return ^(){
        LinkHandle_VAL_IFNOT(UIColor){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(colorSaturation)
        CGFloat hue;CGFloat saturation;CGFloat brightness;CGFloat a;
        if([_self getHue:&hue saturation:&saturation brightness:&brightness alpha:&a]){
            return saturation;
        }else{
            return (CGFloat)1.0;
        }
    };
}
- (void)setColorSaturation:(CGFloat (^)())colorSaturation{};

- (CGFloat (^)())colorBrightness
{
    return ^(){
        LinkHandle_VAL_IFNOT(UIColor){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(colorBrightness)
        CGFloat hue;CGFloat saturation;CGFloat brightness;CGFloat a;
        if([_self getHue:&hue saturation:&saturation brightness:&brightness alpha:&a]){
            return brightness;
        }else{
            return (CGFloat)1.0;
        }
    };
}
- (void)setColorBrightness:(CGFloat (^)())colorBrightness{};

- (UIColor* (^)(CGFloat))colorRedSet
{
    return ^id(CGFloat value){
        LinkHandle_REF(UIColor, UIColor)
        LinkGroupHandle_REF(colorRedSet,value)
        value = (value<0||value>1) ? 0.0 : value;
        CGFloat r;CGFloat g;CGFloat b;CGFloat a;
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
    return ^id(CGFloat value){
        LinkHandle_REF(UIColor, UIColor)
        LinkGroupHandle_REF(colorGreenSet,value)
        value = (value<0||value>1) ? 0.0 : value;
        CGFloat r;CGFloat g;CGFloat b;CGFloat a;
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
    return ^id(CGFloat value){
        LinkHandle_REF(UIColor, UIColor)
        LinkGroupHandle_REF(colorBlueSet,value)
        value = (value<0||value>1) ? 0.0 : value;
        CGFloat r;CGFloat g;CGFloat b;CGFloat a;
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
    return ^id(CGFloat value){
        LinkHandle_REF(UIColor, UIColor)
        LinkGroupHandle_REF(colorAlphaSet,value)
        value = (value<0||value>1) ? 0.0 : value;
        CGFloat r;CGFloat g;CGFloat b;CGFloat a;
        if([_self getRed:&r green:&g blue:&b alpha:&a]){
            return [UIColor colorWithRed:r green:g blue:b alpha:value];
        }else{
            return _self;
        }
    };
}
- (void)setColorAlphaSet:(UIColor *(^)(CGFloat))blockSetAlphaValue{}

- (UIColor *(^)(CGFloat))colorHueSet
{
    return ^id(CGFloat value){
        LinkHandle_REF(UIColor, UIColor)
        LinkGroupHandle_REF(colorHueSet,value)
        value = (value<0||value>1) ? 0.0 : value;
        CGFloat hue;CGFloat saturation;CGFloat brightness;CGFloat a;
        if([_self getHue:&hue saturation:&saturation brightness:&brightness alpha:&a]){
            return [UIColor colorWithHue:value saturation:saturation brightness:brightness alpha:a];
        }else{
            return _self;
        }
    };
}
- (void)setColorHueSet:(UIColor *(^)(CGFloat))colorHueSet{};

- (UIColor *(^)(CGFloat))colorSaturationSet
{
    return ^id(CGFloat value){
        LinkHandle_REF(UIColor, UIColor)
        LinkGroupHandle_REF(colorSaturationSet,value)
        value = (value<0||value>1) ? 0.0 : value;
        CGFloat hue;CGFloat saturation;CGFloat brightness;CGFloat a;
        if([_self getHue:&hue saturation:&saturation brightness:&brightness alpha:&a]){
            return [UIColor colorWithHue:hue saturation:saturation brightness:value alpha:a];
        }else{
            return _self;
        }
    };
}
- (void)setColorSaturationSet:(UIColor *(^)(CGFloat))colorSaturationSet{};

- (UIColor *(^)(CGFloat))colorBrightnessSet
{
    return ^id(CGFloat value){
        LinkHandle_REF(UIColor, UIColor)
        LinkGroupHandle_REF(colorBrightnessSet,value)
        value = (value<0||value>1) ? 0.0 : value;
        CGFloat hue;CGFloat saturation;CGFloat brightness;CGFloat a;
        if([_self getHue:&hue saturation:&saturation brightness:&brightness alpha:&a]){
            return [UIColor colorWithHue:hue saturation:saturation brightness:value alpha:a];
        }else{
            return _self;
        }
    };
}
- (void)setColorBrightnessSet:(UIColor *(^)(CGFloat))colorBrightnessSet{};

- (UIColor *(^)(NSArray *))colorSetBackgroundToViews
{
    return ^id(NSArray* views){
        LinkHandle_REF(UIColor, UIColor)
        LinkGroupHandle_REF(colorSetBackgroundToViews,views)
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
    return ^id(UIView* view){
        LinkHandle_REF(UIColor, UIColor)
        LinkGroupHandle_REF(colorSetTextColorToViewSubviews,view)
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

- (UIColor *(^)(double))colorBrightnessPercent
{
    return ^id(double percent){
        LinkHandle_REF(UIColor, UIColor)
        LinkGroupHandle_REF(colorBrightnessPercent,percent)
        CGFloat hue;CGFloat saturation;CGFloat brightness;CGFloat alpha;
        if([_self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha]){
            
            brightness *= (1.0+percent);
            if(percent>0.0){//变亮
                
                brightness = brightness>1 ? 1.0 : brightness;
            }else if(percent <0.0){//变暗
                
                brightness = brightness<0.0 ? 0.0 : brightness;
            }else{
                
                return _self;
            }
            return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
        }else{
            
            return _self;
        }
    };
}
- (void)setColorBrightnessPercent:(UIColor *(^)(double))colorBrightnessPercent{};

- (UIColor *(^)())colorHighlightDarkColor
{
    return ^id(){
        LinkHandle_REF(UIColor, UIColor)
        LinkGroupHandle_REF(colorHighlightDarkColor)
        return _self.colorBrightnessPercent(-0.382);
    };
}
- (void)setColorHighlightDarkColor:(UIColor *(^)())colorHighlightDarkColor{};

- (UIColor *(^)())colorHighlightLightColor
{
    return ^id(){
        LinkHandle_REF(UIColor, UIColor)
        LinkGroupHandle_REF(colorHighlightLightColor)
        return _self.colorBrightnessPercent(0.382);
    };
}
- (void)setColorHighlightLightColor:(UIColor *(^)())colorHighlightLightColor{};
@end
