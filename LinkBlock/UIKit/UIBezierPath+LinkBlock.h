//
//  UIBezierPath+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/5/17.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define UIBezierPathNew ([UIBezierPath bezierPath])
@interface NSObject(UIBezierPathLinkBlock)

@property (nonatomic,copy,readonly) UIBezierPath*    (^bezierPathSetLineWidth)(CGFloat lineWidth);
@property (nonatomic,copy,readonly) UIBezierPath*    (^bezierPathSetLineCapStyle)(CGLineCap lineCapStyle);
@property (nonatomic,copy,readonly) UIBezierPath*    (^bezierPathSetLineJoinStyle)(CGLineJoin lineJoinStyle);
@property (nonatomic,copy,readonly) UIBezierPath*    (^bezierPathSetMiterLimit)(CGFloat miterLimit);
@property (nonatomic,copy,readonly) UIBezierPath*    (^bezierPathSetFlatness)(CGFloat flatness);

@property (nonatomic,copy,readonly) UIBezierPath*    (^bezierPathMoveToPoint)(CGPoint point);
@property (nonatomic,copy,readonly) UIBezierPath*    (^bezierPathAddLineToPoint)(CGPoint point);
@property (nonatomic,copy,readonly) UIBezierPath*    (^bezierPathAddCurveToPoint)(CGPoint endPoint,CGPoint controlPoint1,CGPoint controlPoint2);
@property (nonatomic,copy,readonly) UIBezierPath*    (^bezierPathAddQuadCurveToPoint)(CGPoint endPoint,CGPoint controlPoint);
@property (nonatomic,copy,readonly) UIBezierPath*    (^bezierPathAddArcWithCenter)(CGPoint center,CGFloat radius,CGFloat startAngle,CGFloat endAngle,BOOL clockwise);
@property (nonatomic,copy,readonly) UIBezierPath*    (^bezierPathClosePath)();
@property (nonatomic,copy,readonly) UIBezierPath*    (^bezierPathRemoveAllPoints)();
@property (nonatomic,copy,readonly) UIBezierPath*    (^bezierPathAppendPath)(UIBezierPath* aPath);
@property (nonatomic,copy,readonly) UIBezierPath*    (^bezierPathByReversingPath)() NS_AVAILABLE_IOS(6_0);
@property (nonatomic,copy,readonly) BOOL             (^bezierPathContainsPoint)(CGPoint point);
@property (nonatomic,copy,readonly) UIBezierPath*    (^bezierPathFill)();
@property (nonatomic,copy,readonly) UIBezierPath*    (^bezierPathStroke)();
@property (nonatomic,copy,readonly) UIBezierPath*    (^bezierPathAddClip)();
@end
