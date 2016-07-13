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
        LinkGroupHandle_REF(valueSetPointToViews,views)
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
        LinkGroupHandle_REF(valueSetSizeToViews,views)
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
        LinkHandle_VAL_IFNOT(NSValue){
            return (NSUInteger)0;
        }
        LinkGroupHandle_VAL(valueNSRangeLocation)
        return [_self rangeValue].location;
    };
}
- (void)setValueNSRangeLocation:(NSUInteger (^)())valueNSRangeLocation{};

- (NSUInteger (^)())valueNSRangeLength
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSValue){
            return (NSUInteger)0;
        }
        LinkGroupHandle_VAL(valueNSRangeLength)
        return [_self rangeValue].length;
    };
}
- (void)setValueNSRangeLength:(NSUInteger (^)())valueNSRangeLength{};

- (CGFloat (^)())valueCGPointX
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSValue){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(valueCGPointX)
        return [_self CGPointValue].x;
    };
}
- (void)setValueCGPointX:(CGFloat (^)())valueCGPointX{};

- (CGFloat (^)())valueCGPointY
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSValue){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(valueCGPointY)
        return [_self CGPointValue].y;
    };
}
- (void)setValueCGPointY:(CGFloat (^)())valueCGPointY{};

- (CGFloat (^)())valueCGSizeWidth
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSValue){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(valueCGSizeWidth)
        return [_self CGSizeValue].width;
    };
}
- (void)setValueCGSizeWidth:(CGFloat (^)())valueCGSizeWidth{};

- (CGFloat (^)())valueCGSizeHeight
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSValue){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(valueCGSizeHeight)
        return [_self CGSizeValue].height;
    };
}
- (void)setValueCGSizeHeight:(CGFloat (^)())valueCGSizeHeight{};

- (CGFloat (^)())valueCGRectX
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSValue){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(valueCGRectX)
        return [_self CGRectValue].origin.x;
    };
}
- (void)setValueCGRectX:(CGFloat (^)())valueCGRectX{};

- (CGFloat (^)())valueCGRectY
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSValue){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(valueCGRectY)
        return [_self CGRectValue].origin.y;
    };
}
- (void)setValueCGRectY:(CGFloat (^)())valueCGRectY{};

- (CGFloat (^)())valueCGRectWidth
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSValue){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(valueCGRectWidth)
        return [_self CGRectValue].size.width;
    };
}
- (void)setValueCGRectWidth:(CGFloat (^)())valueCGRectWidth{};

- (CGFloat (^)())valueCGRectHeight
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSValue){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(valueCGRectHeight)
        return [_self CGRectValue].size.width;
    };
}
- (void)setValueCGRectHeight:(CGFloat (^)())valueCGRectHeight{};

- (CGPoint (^)())valueCGRectOrigin
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSValue){
            return CGPointZero;
        }
        LinkGroupHandle_VAL(valueCGRectOrigin)
        return [_self CGRectValue].origin;
    };
}
- (void)setValueCGRectOrigin:(CGPoint (^)())valueCGRectOrigin{};

- (CGSize (^)())valueCGRectSize
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSValue){
            return CGSizeZero;
        }
        LinkGroupHandle_VAL(valueCGRectSize)
        return [_self CGRectValue].size;
    };
}
- (void)setValueCGRectSize:(CGSize (^)())valueCGRectSize{};

- (CGFloat (^)())valueCGVectorX
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSValue){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(valueCGVectorX)
        return [_self CGVectorValue].dx;
    };
}
- (void)setValueCGVectorX:(CGFloat (^)())valueCGVectorX{};

- (CGFloat (^)())valueCGVectorY
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSValue){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(valueCGVectorY)
        return [_self CGVectorValue].dy;
    };
}
- (void)setValueCGVectorY:(CGFloat (^)())valueCGVectorY{};
@end