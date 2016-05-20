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
    return ^(UIBezierPath* path){
        LinkError_REF_AUTO(CAShapeLayer, CAShapeLayer);
        _self.path = path.CGPath;
        return _self;
    };
}
- (void)setSharpLayerSetPath:(CAShapeLayer *(^)(UIBezierPath *))sharpLayerSetPath{};

- (CAShapeLayer *(^)(UIColor *))sharpLayerSetFillColor
{
    return ^(UIColor* color){
        LinkError_REF_AUTO(CAShapeLayer, CAShapeLayer);
        _self.fillColor = color.CGColor;
        return _self;
    };
}
- (void)setSharpLayerSetFillColor:(CAShapeLayer *(^)(UIColor *))sharpLayerSetFillColor{};

- (CAShapeLayer *(^)(UIColor *))sharpLayerSetStrokeColor
{
    return ^(UIColor* color){
        LinkError_REF_AUTO(CAShapeLayer, CAShapeLayer);
        _self.strokeColor = color.CGColor;
        return _self;
    };
}
- (void)setSharpLayerSetStrokeColor:(CAShapeLayer *(^)(UIColor *))sharpLayerSetStrokeColor{};

- (CAShapeLayer *(^)(NSString *))sharpLayerSetFillRule
{
    return ^(NSString* fillRule){
        LinkError_REF_AUTO(CAShapeLayer, CAShapeLayer);
        _self.fillRule = fillRule;
        return _self;
    };
}
- (void)setSharpLayerSetFillRule:(CAShapeLayer *(^)(NSString *))sharpLayerSetFillRule{};

- (CAShapeLayer *(^)(CGFloat))sharpLayerSetStrokeStart
{
    return ^(CGFloat strokeStart){
        LinkError_REF_AUTO(CAShapeLayer, CAShapeLayer);
        _self.strokeStart = strokeStart;
        return _self;
    };
}
- (void)setSharpLayerSetStrokeStart:(CAShapeLayer *(^)(CGFloat))sharpLayerSetStrokeStart{};

- (CAShapeLayer *(^)(CGFloat))sharpLayerSetStrokeEnd
{
    return ^(CGFloat strokeEnd){
        LinkError_REF_AUTO(CAShapeLayer, CAShapeLayer);
        _self.strokeEnd = strokeEnd;
        return _self;
    };
}
- (void)setSharpLayerSetStrokeEnd:(CAShapeLayer *(^)(CGFloat))sharpLayerSetStrokeEnd{};

- (CAShapeLayer *(^)(CGFloat))sharpLayerSetLineWidth
{
    return ^(CGFloat lineWidth){
        LinkError_REF_AUTO(CAShapeLayer, CAShapeLayer);
        _self.lineWidth = lineWidth;
        return _self;
    };
}
- (void)setSharpLayerSetLineWidth:(CAShapeLayer *(^)(CGFloat))sharpLayerSetLineWidth{};

- (CAShapeLayer *(^)(CGFloat))sharpLayerSetMiterLimit
{
    return ^(CGFloat miterLimit){
        LinkError_REF_AUTO(CAShapeLayer, CAShapeLayer);
        _self.miterLimit = miterLimit;
        return _self;
    };
}
- (void)setSharpLayerSetMiterLimit:(CAShapeLayer *(^)(CGFloat))sharpLayerSetMiterLimit{};

- (CAShapeLayer *(^)(NSString *))sharpLayerSetLineCap
{
    return ^(NSString* lineCap){
        LinkError_REF_AUTO(CAShapeLayer, CAShapeLayer);
        _self.lineCap = lineCap;
        return _self;
    };
}
- (void)setSharpLayerSetLineCap:(CAShapeLayer *(^)(NSString *))sharpLayerSetLineCap{};

- (CAShapeLayer *(^)(NSString *))sharpLayerSetLineJoin
{
    return ^(NSString* lineJoin){
        LinkError_REF_AUTO(CAShapeLayer, CAShapeLayer);
        _self.lineJoin = lineJoin;
        return _self;
    };
}
- (void)setSharpLayerSetLineJoin:(CAShapeLayer *(^)(NSString *))sharpLayerSetLineJoin{};

- (CAShapeLayer *(^)(CGFloat))sharpLayerSetLineDashPhase
{
    return ^(CGFloat lineDashPhase){
        LinkError_REF_AUTO(CAShapeLayer, CAShapeLayer);
        _self.lineDashPhase = lineDashPhase;
        return _self;
    };
}
- (void)setSharpLayerSetLineDashPhase:(CAShapeLayer *(^)(CGFloat))sharpLayerSetLineDashPhase{};

- (CAShapeLayer *(^)(NSArray<NSNumber *> *))sharpLayerSetLineDashPattern
{
    return ^(NSArray<NSNumber *> *lineDashPattern){
        LinkError_REF_AUTO(CAShapeLayer, CAShapeLayer);
        _self.lineDashPattern = lineDashPattern;
        return _self;
    };
}
- (void)setSharpLayerSetLineDashPattern:(CAShapeLayer *(^)(NSArray<NSNumber *> *))sharpLayerSetLineDashPattern{};
@end
