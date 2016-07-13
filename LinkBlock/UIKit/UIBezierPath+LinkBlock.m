//
//  UIBezierPath+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 16/5/17.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(UIBezierPathLinkBlock)
- (UIBezierPath *(^)(CGFloat))bezierPathSetLineWidth
{
    return ^id(CGFloat lineWidth){
        LinkHandle_REF(UIBezierPath, UIBezierPath)
        LinkGroupHandle_REF(bezierPathSetLineWidth,lineWidth)
        _self.lineWidth = lineWidth;
        return _self;
    };
}
- (void)setBezierPathSetLineWidth:(UIBezierPath *(^)(CGFloat))bezierPathSetLineWidth{};

- (UIBezierPath *(^)(CGLineCap))bezierPathSetLineCapStyle
{
    return ^id(CGLineCap lineCapStyle){
        LinkHandle_REF(UIBezierPath, UIBezierPath)
        LinkGroupHandle_REF(bezierPathSetLineCapStyle,lineCapStyle)
        _self.lineCapStyle = lineCapStyle;
        return _self;
    };
}
- (void)setBezierPathSetLineCapStyle:(UIBezierPath *(^)(CGLineCap))bezierPathSetLineCapStyle{};

- (UIBezierPath *(^)(CGLineJoin))bezierPathSetLineJoinStyle
{
    return ^id(CGLineJoin lineJoinStyle){
        LinkHandle_REF(UIBezierPath, UIBezierPath)
        _self.lineJoinStyle = lineJoinStyle;
        return _self;
    };
}
- (void)setBezierPathSetLineJoinStyle:(UIBezierPath *(^)(CGLineJoin))bezierPathSetLineJoinStyle{};

- (UIBezierPath *(^)(CGFloat))bezierPathSetMiterLimit
{
    return ^id(CGFloat miterLimit){
        LinkHandle_REF(UIBezierPath, UIBezierPath)
        _self.miterLimit = miterLimit;
        return _self;
    };
}
- (void)setBezierPathSetMiterLimit:(UIBezierPath *(^)(CGFloat))bezierPathSetMiterLimit{};

- (UIBezierPath *(^)(CGFloat))bezierPathSetFlatness
{
    return ^id(CGFloat flatness){
        LinkHandle_REF(UIBezierPath, UIBezierPath)
        _self.flatness = flatness;
        return _self;
    };
}
- (void)setBezierPathSetFlatness:(UIBezierPath *(^)(CGFloat))bezierPathSetFlatness{};

- (UIBezierPath *(^)(CGPoint))bezierPathMoveToPoint
{
    return ^id(CGPoint point){
        LinkHandle_REF(UIBezierPath, UIBezierPath)
        [_self moveToPoint:point];
        return _self;
    };
}
- (void)setBezierPathMoveToPoint:(UIBezierPath *(^)(CGPoint))bezierPathMoveToPoint{};

- (UIBezierPath *(^)(CGPoint))bezierPathAddLineToPoint
{
    return ^id(CGPoint point){
        LinkHandle_REF(UIBezierPath, UIBezierPath)
        [_self addLineToPoint:point];
        return _self;
    };
}
- (void)setBezierPathAddLineToPoint:(UIBezierPath *(^)(CGPoint))bezierPathAddLineToPoint{};

- (UIBezierPath *(^)(CGPoint, CGPoint, CGPoint))bezierPathAddCurveToPoint
{
    return ^id(CGPoint endPoint,CGPoint controlPoint1,CGPoint controlPoint2){
        LinkHandle_REF(UIBezierPath, UIBezierPath)
        [_self addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
        return _self;
    };
}
- (void)setBezierPathAddCurveToPoint:(UIBezierPath *(^)(CGPoint, CGPoint, CGPoint))bezierPathAddCurveToPoint{};

- (UIBezierPath *(^)(CGPoint, CGPoint))bezierPathAddQuadCurveToPoint
{
    return ^id(CGPoint endPoint,CGPoint controlPoint){
        LinkHandle_REF(UIBezierPath, UIBezierPath)
        [_self addQuadCurveToPoint:endPoint controlPoint:controlPoint];
        return _self;
    };
}
- (void)setBezierPathAddQuadCurveToPoint:(UIBezierPath *(^)(CGPoint, CGPoint))bezierPathAddQuadCurveToPoint{};

- (UIBezierPath *(^)(CGPoint, CGFloat, CGFloat, CGFloat, BOOL))bezierPathAddArcWithCenter
{
    return ^id(CGPoint center,CGFloat radius,CGFloat startAngle,CGFloat endAngle,BOOL clockwise){
        LinkHandle_REF(UIBezierPath, UIBezierPath)
        [_self addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockwise];
        return _self;
    };
}
- (void)setBezierPathAddArcWithCenter:(UIBezierPath *(^)(CGPoint, CGFloat, CGFloat, CGFloat, BOOL))bezierPathAddArcWithCenter{};

- (UIBezierPath *(^)())bezierPathClosePath
{
    return ^id(){
        LinkHandle_REF(UIBezierPath, UIBezierPath)
        [_self closePath];
        return _self;
    };
}
- (void)setBezierPathClosePath:(UIBezierPath *(^)())bezierPathClosePath{};

- (UIBezierPath *(^)())bezierPathRemoveAllPoints
{
    return ^id(){
        LinkHandle_REF(UIBezierPath, UIBezierPath)
        [_self removeAllPoints];
        return _self;
    };
}
- (void)setBezierPathRemoveAllPoints:(UIBezierPath *(^)())bezierPathRemoveAllPoints{};

- (UIBezierPath *(^)(UIBezierPath *))bezierPathAppendPath
{
    return ^id(UIBezierPath* aPath){
        LinkHandle_REF(UIBezierPath, UIBezierPath)
        [_self appendPath:aPath];
        return _self;
    };
}
- (void)setBezierPathAppendPath:(UIBezierPath *(^)(UIBezierPath *))bezierPathAppendPath{};

- (UIBezierPath *(^)())bezierPathByReversingPath
{
    return ^id(){
        LinkHandle_REF(UIBezierPath, UIBezierPath)
        return [_self bezierPathByReversingPath];
    };
}
- (void)setBezierPathByReversingPath:(UIBezierPath *(^)())bezierPathByReversingPath{};

- (BOOL (^)(CGPoint))bezierPathContainsPoint
{
    return ^(CGPoint point){
        LinkHandle_VAL_IFNOT(UIBezierPath){
            return NO;
        }
        return [_self containsPoint:point];
    };
}
- (void)setBezierPathContainsPoint:(BOOL (^)(CGPoint))bezierPathContainsPoint{};

- (UIBezierPath *(^)())bezierPathFill
{
    return ^id(){
        LinkHandle_REF(UIBezierPath, UIBezierPath)
        [_self fill];
        return _self;
    };
}
- (void)setBezierPathFill:(UIBezierPath *(^)())bezierPathFill{};

- (UIBezierPath *(^)())bezierPathStroke
{
    return ^id(){
        LinkHandle_REF(UIBezierPath, UIBezierPath)
        [_self stroke];
        return _self;
    };
}
- (void)setBezierPathStroke:(UIBezierPath *(^)())bezierPathStroke{};

- (UIBezierPath *(^)())bezierPathAddClip
{
    return ^id(){
        LinkHandle_REF(UIBezierPath, UIBezierPath)
        [_self addClip];
        return _self;
    };
}
- (void)setBezierPathAddClip:(UIBezierPath *(^)())bezierPathAddClip{};
@end
