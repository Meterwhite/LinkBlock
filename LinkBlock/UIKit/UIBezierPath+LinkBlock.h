//
//  UIBezierPath+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/5/17.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

#ifndef UIBezierPathNew
#define UIBezierPathNew ([UIBezierPath bezierPath])
#endif
@interface NSObject(UIBezierPathLinkBlock)
/** <^(CGFloat lineWidth)> */
LBDeclare UIBezierPath*    (^bezierPathSetLineWidth)(CGFloat lineWidth);
/** <^(CGLineCap lineCapStyle)> */
LBDeclare UIBezierPath*    (^bezierPathSetLineCapStyle)(CGLineCap lineCapStyle);
/** <^(CGLineJoin lineJoinStyle)> */
LBDeclare UIBezierPath*    (^bezierPathSetLineJoinStyle)(CGLineJoin lineJoinStyle);
/** <^(CGFloat miterLimit)> */
LBDeclare UIBezierPath*    (^bezierPathSetMiterLimit)(CGFloat miterLimit);
/** <^(CGFloat flatness)> */
LBDeclare UIBezierPath*    (^bezierPathSetFlatness)(CGFloat flatness);
/** <^(CGPoint point)> */
LBDeclare UIBezierPath*    (^bezierPathMoveToPoint)(CGPoint point);
/** <^(CGPoint point)> */
LBDeclare UIBezierPath*    (^bezierPathAddLineToPoint)(CGPoint point);
/** <^(CGPoint point)> */
LBDeclare UIBezierPath*    (^bezierPathAddCurveToPoint)(CGPoint endPoint,CGPoint controlPoint1,CGPoint controlPoint2);
/** <^(CGPoint endPoint,CGPoint controlPoint)> */
LBDeclare UIBezierPath*    (^bezierPathAddQuadCurveToPoint)(CGPoint endPoint,CGPoint controlPoint);
/** <^(CGPoint center,CGFloat radius,CGFloat startAngle,CGFloat endAngle,BOOL clockwise)> */
LBDeclare UIBezierPath*    (^bezierPathAddArcWithCenter)(CGPoint center,CGFloat radius,CGFloat startAngle,CGFloat endAngle,BOOL clockwise);
/** <^()> */
LBDeclare UIBezierPath*    (^bezierPathClosePath)(void);
/** <^()> */
LBDeclare UIBezierPath*    (^bezierPathRemoveAllPoints)(void);
/** <^(UIBezierPath* aPath)> */
LBDeclare UIBezierPath*    (^bezierPathAppendPath)(UIBezierPath* aPath);
/** <^()> */
LBDeclare UIBezierPath*    (^bezierPathByReversingPath)(void) NS_AVAILABLE_IOS(6_0);
/** <^(CGPoint point)> */
LBDeclare BOOL             (^bezierPathContainsPoint)(CGPoint point);
/** <^()> */
LBDeclare UIBezierPath*    (^bezierPathFill)(void);
/** <^()> */
LBDeclare UIBezierPath*    (^bezierPathStroke)(void);
/** <^()> */
LBDeclare UIBezierPath*    (^bezierPathAddClip)(void);
@end
