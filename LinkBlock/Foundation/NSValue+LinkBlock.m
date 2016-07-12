//
//  NSValue+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/7.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"


@implementation NSObject(NSValueLinkBlock)
- (NSValue *(^)(NSArray *))valueSetPointToViews
{
    return ^id(NSArray* views){
        LinkHandle_REF(NSValue, NSValue)
        [views enumerateObjectsUsingBlock:^(UIView* v, NSUInteger idx, BOOL *stop) {
            if([v isKindOfClass:[UIView class]]){
                CGRect frame = v.frame;
                frame.origin = [_self CGPointValue];
                v.frame = frame;
            }
        }];
        return _self;
    };
}
- (void)setValueSetPointToViews:(NSValue *(^)(NSArray *))valueSetPointToViews{};

- (NSValue *(^)(NSArray *))valueSetSizeToViews
{
    return ^id(NSArray* views){
        LinkHandle_REF(NSValue, NSValue)
        [views enumerateObjectsUsingBlock:^(UIView* v, NSUInteger idx, BOOL *stop) {
            if([v isKindOfClass:[UIView class]]){
                CGRect frame = v.frame;
                frame.size = [_self CGSizeValue];
                v.frame = frame;
            }
        }];
        return _self;
    };
}
- (void)setValueSetSizeToViews:(NSValue *(^)(NSArray *))valueSetSizeToViews{};

- (NSUInteger (^)())valueNSRangeLocation
{
    return ^(){
        LinkHandle_VAL_IF(NSValue){
            return (NSUInteger)0;
        }
        return [_self rangeValue].location;
    };
}
- (void)setValueNSRangeLocation:(NSUInteger (^)())valueNSRangeLocation{};

- (NSUInteger (^)())valueNSRangeLength
{
    return ^(){
        LinkHandle_VAL_IF(NSValue){
            return (NSUInteger)0;
        }
        return [_self rangeValue].length;
    };
}
- (void)setValueNSRangeLength:(NSUInteger (^)())valueNSRangeLength{};

- (CGFloat (^)())valueCGPointX
{
    return ^(){
        LinkHandle_VAL_IF(NSValue){
            return (CGFloat)0.0;
        }
        return [_self CGPointValue].x;
    };
}
- (void)setValueCGPointX:(CGFloat (^)())valueCGPointX{};

- (CGFloat (^)())valueCGPointY
{
    return ^(){
        LinkHandle_VAL_IF(NSValue){
            return (CGFloat)0.0;
        }
        return [_self CGPointValue].y;
    };
}
- (void)setValueCGPointY:(CGFloat (^)())valueCGPointY{};

- (CGFloat (^)())valueCGSizeWidth
{
    return ^(){
        LinkHandle_VAL_IF(NSValue){
            return (CGFloat)0.0;
        }
        return [_self CGSizeValue].width;
    };
}
- (void)setValueCGSizeWidth:(CGFloat (^)())valueCGSizeWidth{};

- (CGFloat (^)())valueCGSizeHeight
{
    return ^(){
        LinkHandle_VAL_IF(NSValue){
            return (CGFloat)0.0;
        }
        return [_self CGSizeValue].height;
    };
}
- (void)setValueCGSizeHeight:(CGFloat (^)())valueCGSizeHeight{};

- (CGFloat (^)())valueCGRectX
{
    return ^(){
        LinkHandle_VAL_IF(NSValue){
            return (CGFloat)0.0;
        }
        return [_self CGRectValue].origin.x;
    };
}
- (void)setValueCGRectX:(CGFloat (^)())valueCGRectX{};

- (CGFloat (^)())valueCGRectY
{
    return ^(){
        LinkHandle_VAL_IF(NSValue){
            return (CGFloat)0.0;
        }
        return [_self CGRectValue].origin.y;
    };
}
- (void)setValueCGRectY:(CGFloat (^)())valueCGRectY{};

- (CGFloat (^)())valueCGRectWidth
{
    return ^(){
        LinkHandle_VAL_IF(NSValue){
            return (CGFloat)0.0;
        }
        return [_self CGRectValue].size.width;
    };
}
- (void)setValueCGRectWidth:(CGFloat (^)())valueCGRectWidth{};

- (CGFloat (^)())valueCGRectHeight
{
    return ^(){
        LinkHandle_VAL_IF(NSValue){
            return (CGFloat)0.0;
        }
        return [_self CGRectValue].size.width;
    };
}
- (void)setValueCGRectHeight:(CGFloat (^)())valueCGRectHeight{};

- (CGPoint (^)())valueCGRectOrigin
{
    return ^(){
        LinkHandle_VAL_IF(NSValue){
            return CGPointZero;
        }
        return [_self CGRectValue].origin;
    };
}
- (void)setValueCGRectOrigin:(CGPoint (^)())valueCGRectOrigin{};

- (CGSize (^)())valueCGRectSize
{
    return ^(){
        LinkHandle_VAL_IF(NSValue){
            return CGSizeZero;
        }
        return [_self CGRectValue].size;
    };
}
- (void)setValueCGRectSize:(CGSize (^)())valueCGRectSize{};

- (CGFloat (^)())valueCGVectorX
{
    return ^(){
        LinkHandle_VAL_IF(NSValue){
            return (CGFloat)0.0;
        }
        return [_self CGVectorValue].dx;
    };
}
- (void)setValueCGVectorX:(CGFloat (^)())valueCGVectorX{};

- (CGFloat (^)())valueCGVectorY
{
    return ^(){
        LinkHandle_VAL_IF(NSValue){
            return (CGFloat)0.0;
        }
        return [_self CGVectorValue].dy;
    };
}
- (void)setValueCGVectorY:(CGFloat (^)())valueCGVectorY{};
@end