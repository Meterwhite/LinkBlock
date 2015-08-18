//
//  UIColor+LinkBlock.m

//
//  Created by NOVO on 15/8/18.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//
#import "LinkBlock.h"
#import "UIColor+LinkBlock.h"

@implementation UIColor(LinkBlock)
- (NSString *(^)(NSString *))blockToStringWithPrefix
{
    return ^(NSString* prefix){
        NSMutableString* reIsMStr = [NSMutableString string];
        if([prefix isKindOfClass:[NSString class]])
            [reIsMStr appendString:prefix];
        CGFloat r;
        CGFloat g;
        CGFloat b;
        CGFloat a;
        if([self getRed:&r green:&g blue:&b alpha:&a]){
            [reIsMStr appendFormat:@"%02x",(int)(r* 255.0)];
            [reIsMStr appendFormat:@"%02x",(int)(g* 255.0)];
            [reIsMStr appendFormat:@"%02x",(int)(g* 255.0)];
        }else{
            return (NSString*)(nil);
        }
        
        return (NSString*)[reIsMStr copy];
    };
}
- (void)setBlockToStringWithPrefix:(NSString *(^)(NSString *))blockToStringWithPrefix{};

- (CGFloat (^)())blockRedValue
{
    return ^(){
        CGFloat r;
        CGFloat g;
        CGFloat b;
        CGFloat a;
        if([self getRed:&r green:&g blue:&b alpha:&a]){
            return r;
        }else{
            return (CGFloat)0.0;
        }
    };
}
- (void)setBlockRedValue:(CGFloat (^)())blockRedValue{};

- (CGFloat (^)())blockGreenValue
{
    return ^(){
        CGFloat r;
        CGFloat g;
        CGFloat b;
        CGFloat a;
        if([self getRed:&r green:&g blue:&b alpha:&a]){
            return g;
        }else{
            return (CGFloat)0.0;
        }
    };
}
- (void)setBlockGreenValue:(CGFloat (^)())blockGreenValue{};

- (CGFloat (^)())blockBlueValue
{
    return ^(){
        CGFloat r;
        CGFloat g;
        CGFloat b;
        CGFloat a;
        if([self getRed:&r green:&g blue:&b alpha:&a]){
            return b;
        }else{
            return (CGFloat)0.0;
        }
    };
}
- (void)setBlockBlueValue:(CGFloat (^)())blockBlueValue{};

- (CGFloat (^)())blockAlphaValue
{
    return ^(){
        CGFloat r;
        CGFloat g;
        CGFloat b;
        CGFloat a;
        if([self getRed:&r green:&g blue:&b alpha:&a]){
            return a;
        }else{
            return (CGFloat)1.0;
        }
    };
}
- (void)setBlockAlphaValue:(CGFloat (^)())blockAlphaValue{};

- (UIColor* (^)(CGFloat))blockSetRedValue
{
    return ^(CGFloat value){
        value = (value<0||value>1) ? 0.0 : value;
        CGFloat r;
        CGFloat g;
        CGFloat b;
        CGFloat a;
        if([self getRed:&r green:&g blue:&b alpha:&a]){
            return [UIColor colorWithRed:value green:g blue:b alpha:a];
        }else{
            return self;
        }
    };
}
- (void)setBlockSetRedValue:(UIColor *(^)(CGFloat))blockSetRedValue{}

- (UIColor* (^)(CGFloat))blockSetGreenValue
{
    return ^(CGFloat value){
        value = (value<0||value>1) ? 0.0 : value;
        CGFloat r;
        CGFloat g;
        CGFloat b;
        CGFloat a;
        if([self getRed:&r green:&g blue:&b alpha:&a]){
            return [UIColor colorWithRed:r green:value blue:b alpha:a];
        }else{
            return self;
        }
    };
}
- (void)setBlockSetGreenValue:(UIColor *(^)(CGFloat))blockSetGreenValue{}

- (UIColor* (^)(CGFloat))blockSetBlueValue
{
    return ^(CGFloat value){
        value = (value<0||value>1) ? 0.0 : value;
        CGFloat r;
        CGFloat g;
        CGFloat b;
        CGFloat a;
        if([self getRed:&r green:&g blue:&b alpha:&a]){
            return [UIColor colorWithRed:r green:g blue:value alpha:a];
        }else{
            return self;
        }
    };
}
- (void)setBlockSetBlueValue:(UIColor *(^)(CGFloat))blockSetBlueValue{}

- (UIColor* (^)(CGFloat))blockSetAlphaValue
{
    return ^(CGFloat value){
        value = (value<0||value>1) ? 0.0 : value;
        CGFloat r;
        CGFloat g;
        CGFloat b;
        CGFloat a;
        if([self getRed:&r green:&g blue:&b alpha:&a]){
            return [UIColor colorWithRed:r green:g blue:b alpha:value];
        }else{
            return self;
        }
    };
}
- (void)setBlockSetAlphaValue:(UIColor *(^)(CGFloat))blockSetAlphaValue{}
@end
