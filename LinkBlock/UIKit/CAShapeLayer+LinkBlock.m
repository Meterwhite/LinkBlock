//
//  CAShapeLayer+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 16/5/19.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(CAShapeLayerLinkBlock)
- (CAShapeLayer *(^)(UIBezierPath *))sharpLayerSetPath
{
    return ^id(UIBezierPath* path){
        LinkHandle_REF(CAShapeLayer, CAShapeLayer)
        _self.path = path.CGPath;
        return _self;
    };
}
- (void)setSharpLayerSetPath:(CAShapeLayer *(^)(UIBezierPath *))sharpLayerSetPath{};

- (CAShapeLayer *(^)(UIColor *))sharpLayerSetFillColor
{
    return ^id(UIColor* color){
        LinkHandle_REF(CAShapeLayer, CAShapeLayer)
        _self.fillColor = color.CGColor;
        return _self;
    };
}
- (void)setSharpLayerSetFillColor:(CAShapeLayer *(^)(UIColor *))sharpLayerSetFillColor{};

- (CAShapeLayer *(^)(UIColor *))sharpLayerSetStrokeColor
{
    return ^id(UIColor* color){
        LinkHandle_REF(CAShapeLayer, CAShapeLayer)
        _self.strokeColor = color.CGColor;
        return _self;
    };
}
- (void)setSharpLayerSetStrokeColor:(CAShapeLayer *(^)(UIColor *))sharpLayerSetStrokeColor{};

- (CAShapeLayer *(^)(NSString *))sharpLayerSetFillRule
{
    return ^id(NSString* fillRule){
        LinkHandle_REF(CAShapeLayer, CAShapeLayer)
        _self.fillRule = fillRule;
        return _self;
    };
}
- (void)setSharpLayerSetFillRule:(CAShapeLayer *(^)(NSString *))sharpLayerSetFillRule{};

- (CAShapeLayer *(^)(CGFloat))sharpLayerSetStrokeStart
{
    return ^id(CGFloat strokeStart){
        LinkHandle_REF(CAShapeLayer, CAShapeLayer)
        _self.strokeStart = strokeStart;
        return _self;
    };
}
- (void)setSharpLayerSetStrokeStart:(CAShapeLayer *(^)(CGFloat))sharpLayerSetStrokeStart{};

- (CAShapeLayer *(^)(CGFloat))sharpLayerSetStrokeEnd
{
    return ^id(CGFloat strokeEnd){
        LinkHandle_REF(CAShapeLayer, CAShapeLayer)
        _self.strokeEnd = strokeEnd;
        return _self;
    };
}
- (void)setSharpLayerSetStrokeEnd:(CAShapeLayer *(^)(CGFloat))sharpLayerSetStrokeEnd{};

- (CAShapeLayer *(^)(CGFloat))sharpLayerSetLineWidth
{
    return ^id(CGFloat lineWidth){
        LinkHandle_REF(CAShapeLayer, CAShapeLayer)
        _self.lineWidth = lineWidth;
        return _self;
    };
}
- (void)setSharpLayerSetLineWidth:(CAShapeLayer *(^)(CGFloat))sharpLayerSetLineWidth{};

- (CAShapeLayer *(^)(CGFloat))sharpLayerSetMiterLimit
{
    return ^id(CGFloat miterLimit){
        LinkHandle_REF(CAShapeLayer, CAShapeLayer)
        _self.miterLimit = miterLimit;
        return _self;
    };
}
- (void)setSharpLayerSetMiterLimit:(CAShapeLayer *(^)(CGFloat))sharpLayerSetMiterLimit{};

- (CAShapeLayer *(^)(NSString *))sharpLayerSetLineCap
{
    return ^id(NSString* lineCap){
        LinkHandle_REF(CAShapeLayer, CAShapeLayer)
        _self.lineCap = lineCap;
        return _self;
    };
}
- (void)setSharpLayerSetLineCap:(CAShapeLayer *(^)(NSString *))sharpLayerSetLineCap{};

- (CAShapeLayer *(^)(NSString *))sharpLayerSetLineJoin
{
    return ^id(NSString* lineJoin){
        LinkHandle_REF(CAShapeLayer, CAShapeLayer)
        _self.lineJoin = lineJoin;
        return _self;
    };
}
- (void)setSharpLayerSetLineJoin:(CAShapeLayer *(^)(NSString *))sharpLayerSetLineJoin{};

- (CAShapeLayer *(^)(CGFloat))sharpLayerSetLineDashPhase
{
    return ^id(CGFloat lineDashPhase){
        LinkHandle_REF(CAShapeLayer, CAShapeLayer)
        _self.lineDashPhase = lineDashPhase;
        return _self;
    };
}
- (void)setSharpLayerSetLineDashPhase:(CAShapeLayer *(^)(CGFloat))sharpLayerSetLineDashPhase{};

- (CAShapeLayer *(^)(NSArray<NSNumber *> *))sharpLayerSetLineDashPattern
{
    return ^id(NSArray<NSNumber *> *lineDashPattern){
        LinkHandle_REF(CAShapeLayer, CAShapeLayer)
        _self.lineDashPattern = lineDashPattern;
        return _self;
    };
}
- (void)setSharpLayerSetLineDashPattern:(CAShapeLayer *(^)(NSArray<NSNumber *> *))sharpLayerSetLineDashPattern{};
@end
