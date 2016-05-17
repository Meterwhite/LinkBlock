//
//  UIBezierPath+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 16/5/17.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "UIBezierPath+LinkBlock.h"
#import "LinkBlock.h"

@implementation UIBezierPath(UIBezierPathLinkBlock)
- (UIBezierPath *(^)(CGFloat))bezierPathSetLineWidth
{
    return ^(CGFloat lineWidth){
        LinkError_REF_AUTO(UIBezierPath, UIBezierPath);
        _self.lineWidth = lineWidth;
        return _self;
    };
}
- (void)setBezierPathSetLineWidth:(UIBezierPath *(^)(CGFloat))bezierPathSetLineWidth{};

- (UIBezierPath *(^)(CGLineCap))bezierPathSetLineCapStyle
{
    return ^(CGLineCap lineCapStyle){
        LinkError_REF_AUTO(UIBezierPath, UIBezierPath);
        _self.lineCapStyle = lineCapStyle;
        return _self;
    };
}
- (void)setBezierPathSetLineCapStyle:(UIBezierPath *(^)(CGLineCap))bezierPathSetLineCapStyle{};

- (UIBezierPath *(^)(CGLineJoin))bezierPathSetLineJoinStyle
{
    return ^(CGLineJoin lineJoinStyle){
        LinkError_REF_AUTO(UIBezierPath, UIBezierPath);
        _self.lineJoinStyle = lineJoinStyle;
        return _self;
    };
}
- (void)setBezierPathSetLineJoinStyle:(UIBezierPath *(^)(CGLineJoin))bezierPathSetLineJoinStyle{};

- (UIBezierPath *(^)(CGFloat))bezierPathSetMiterLimit
{
    return ^(CGFloat miterLimit){
        LinkError_REF_AUTO(UIBezierPath, UIBezierPath);
        _self.miterLimit = miterLimit;
        return _self;
    };
}
- (void)setBezierPathSetMiterLimit:(UIBezierPath *(^)(CGFloat))bezierPathSetMiterLimit{};

- (UIBezierPath *(^)(CGFloat))bezierPathSetFlatness
{
    return ^(CGFloat flatness){
        LinkError_REF_AUTO(UIBezierPath, UIBezierPath);
        _self.flatness = flatness;
        return _self;
    };
}
- (void)setBezierPathSetFlatness:(UIBezierPath *(^)(CGFloat))bezierPathSetFlatness{};

- (UIBezierPath *(^)(CGPoint))bezierPathMoveToPoint
{
    return ^(CGPoint point){
        LinkError_REF_AUTO(UIBezierPath, UIBezierPath);
        [_self moveToPoint:point];
        return _self;
    };
}
- (void)setBezierPathMoveToPoint:(UIBezierPath *(^)(CGPoint))bezierPathMoveToPoint{};

- (UIBezierPath *(^)(CGPoint))bezierPathAddLineToPoint
{
    return ^(CGPoint point){
        LinkError_REF_AUTO(UIBezierPath, UIBezierPath);
        [_self addLineToPoint:point];
        return _self;
    };
}
- (void)setBezierPathAddLineToPoint:(UIBezierPath *(^)(CGPoint))bezierPathAddLineToPoint{};

- (UIBezierPath *(^)(CGPoint, CGPoint, CGPoint))bezierPathAddCurveToPoint
{
    return ^(CGPoint endPoint,CGPoint controlPoint1,CGPoint controlPoint2){
        LinkError_REF_AUTO(UIBezierPath, UIBezierPath);
        [_self addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
        return _self;
    };
}
- (void)setBezierPathAddCurveToPoint:(UIBezierPath *(^)(CGPoint, CGPoint, CGPoint))bezierPathAddCurveToPoint{};

- (UIBezierPath *(^)(CGPoint, CGPoint))bezierPathAddQuadCurveToPoint
{
    return ^(CGPoint endPoint,CGPoint controlPoint){
        LinkError_REF_AUTO(UIBezierPath, UIBezierPath);
        [_self addQuadCurveToPoint:endPoint controlPoint:controlPoint];
        return _self;
    };
}
- (void)setBezierPathAddQuadCurveToPoint:(UIBezierPath *(^)(CGPoint, CGPoint))bezierPathAddQuadCurveToPoint{};

- (UIBezierPath *(^)(CGPoint, CGFloat, CGFloat, CGFloat, BOOL))bezierPathAddArcWithCenter
{
    return ^(CGPoint center,CGFloat radius,CGFloat startAngle,CGFloat endAngle,BOOL clockwise){
        LinkError_REF_AUTO(UIBezierPath, UIBezierPath);
        [_self addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockwise];
        return _self;
    };
}
- (void)setBezierPathAddArcWithCenter:(UIBezierPath *(^)(CGPoint, CGFloat, CGFloat, CGFloat, BOOL))bezierPathAddArcWithCenter{};

- (UIBezierPath *(^)())bezierPathClosePath
{
    return ^(){
        LinkError_REF_AUTO(UIBezierPath, UIBezierPath);
        [_self closePath];
        return _self;
    };
}
- (void)setBezierPathClosePath:(UIBezierPath *(^)())bezierPathClosePath{};

- (UIBezierPath *(^)())bezierPathRemoveAllPoints
{
    return ^(){
        LinkError_REF_AUTO(UIBezierPath, UIBezierPath);
        [_self removeAllPoints];
        return _self;
    };
}
- (void)setBezierPathRemoveAllPoints:(UIBezierPath *(^)())bezierPathRemoveAllPoints{};

- (UIBezierPath *(^)(UIBezierPath *))bezierPathAppendPath
{
    return ^(UIBezierPath* aPath){
        LinkError_REF_AUTO(UIBezierPath, UIBezierPath);
        [_self appendPath:aPath];
        return _self;
    };
}
- (void)setBezierPathAppendPath:(UIBezierPath *(^)(UIBezierPath *))bezierPathAppendPath{};

- (UIBezierPath *(^)())bezierPathByReversingPath
{
    return ^(){
        LinkError_REF_AUTO(UIBezierPath, UIBezierPath);
        return [_self bezierPathByReversingPath];
    };
}
- (void)setBezierPathByReversingPath:(UIBezierPath *(^)())bezierPathByReversingPath{};

- (BOOL (^)(CGPoint))bezierPathContainsPoint
{
    return ^(CGPoint point){
        LinkError_VAL_IF(UIBezierPath){
            return NO;
        }
        return [_self containsPoint:point];
    };
}
- (void)setBezierPathContainsPoint:(BOOL (^)(CGPoint))bezierPathContainsPoint{};

- (UIBezierPath *(^)())bezierPathFill
{
    return ^(){
        LinkError_REF_AUTO(UIBezierPath, UIBezierPath);
        [_self fill];
        return _self;
    };
}
- (void)setBezierPathFill:(UIBezierPath *(^)())bezierPathFill{};

- (UIBezierPath *(^)())bezierPathStroke
{
    return ^(){
        LinkError_REF_AUTO(UIBezierPath, UIBezierPath);
        [_self stroke];
        return _self;
    };
}
- (void)setBezierPathStroke:(UIBezierPath *(^)())bezierPathStroke{};

- (UIBezierPath *(^)())bezierPathAddClip
{
    return ^(){
        LinkError_REF_AUTO(UIBezierPath, UIBezierPath);
        [_self addClip];
        return _self;
    };
}
- (void)setBezierPathAddClip:(UIBezierPath *(^)())bezierPathAddClip{};
@end
