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
@interface UIBezierPath(UIBezierPathLinkBlock)

@property (nonatomic,copy) UIBezierPath*    (^bezierPathSetLineWidth)(CGFloat lineWidth);
@property (nonatomic,copy) UIBezierPath*    (^bezierPathSetLineCapStyle)(CGLineCap lineCapStyle);
@property (nonatomic,copy) UIBezierPath*    (^bezierPathSetLineJoinStyle)(CGLineJoin lineJoinStyle);
@property (nonatomic,copy) UIBezierPath*    (^bezierPathSetMiterLimit)(CGFloat miterLimit);
@property (nonatomic,copy) UIBezierPath*    (^bezierPathSetFlatness)(CGFloat flatness);

@property (nonatomic,copy) UIBezierPath*    (^bezierPathMoveToPoint)(CGPoint point);
@property (nonatomic,copy) UIBezierPath*    (^bezierPathAddLineToPoint)(CGPoint point);
@property (nonatomic,copy) UIBezierPath*    (^bezierPathAddCurveToPoint)(CGPoint endPoint,CGPoint controlPoint1,CGPoint controlPoint2);
@property (nonatomic,copy) UIBezierPath*    (^bezierPathAddQuadCurveToPoint)(CGPoint endPoint,CGPoint controlPoint);
@property (nonatomic,copy) UIBezierPath*    (^bezierPathAddArcWithCenter)(CGPoint center,CGFloat radius,CGFloat startAngle,CGFloat endAngle,BOOL clockwise);
@property (nonatomic,copy) UIBezierPath*    (^bezierPathClosePath)();
@property (nonatomic,copy) UIBezierPath*    (^bezierPathRemoveAllPoints)();
@property (nonatomic,copy) UIBezierPath*    (^bezierPathAppendPath)(UIBezierPath* aPath);
@property (nonatomic,copy) UIBezierPath*    (^bezierPathByReversingPath)() NS_AVAILABLE_IOS(6_0);
@property (nonatomic,copy) BOOL             (^bezierPathContainsPoint)(CGPoint point);
@property (nonatomic,copy) UIBezierPath*    (^bezierPathFill)();
@property (nonatomic,copy) UIBezierPath*    (^bezierPathStroke)();
@property (nonatomic,copy) UIBezierPath*    (^bezierPathAddClip)();
@end
