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

#pragma mark - Foundation Mirror/镜像
LBDeclare UIBezierPath*    (^bezierPathSetLineWidth)(CGFloat lineWidth);
LBDeclare UIBezierPath*    (^bezierPathSetLineCapStyle)(CGLineCap lineCapStyle);
LBDeclare UIBezierPath*    (^bezierPathSetLineJoinStyle)(CGLineJoin lineJoinStyle);
LBDeclare UIBezierPath*    (^bezierPathSetMiterLimit)(CGFloat miterLimit);
LBDeclare UIBezierPath*    (^bezierPathSetFlatness)(CGFloat flatness);
LBDeclare UIBezierPath*    (^bezierPathMoveToPoint)(CGPoint point);
LBDeclare UIBezierPath*    (^bezierPathAddLineToPoint)(CGPoint point);
LBDeclare UIBezierPath*    (^bezierPathAddCurveToPoint)(CGPoint endPoint,CGPoint controlPoint1,CGPoint controlPoint2);
LBDeclare UIBezierPath*    (^bezierPathAddQuadCurveToPoint)(CGPoint endPoint,CGPoint controlPoint);
LBDeclare UIBezierPath*    (^bezierPathAddArcWithCenter)(CGPoint center,CGFloat radius,CGFloat startAngle,CGFloat endAngle,BOOL clockwise);
LBDeclare UIBezierPath*    (^bezierPathClosePath)(void);
LBDeclare UIBezierPath*    (^bezierPathRemoveAllPoints)(void);
LBDeclare UIBezierPath*    (^bezierPathAppendPath)(UIBezierPath* aPath);
LBDeclare UIBezierPath*    (^bezierPathByReversingPath)(void) NS_AVAILABLE_IOS(6_0);
LBDeclare BOOL             (^bezierPathContainsPoint)(CGPoint point);
LBDeclare UIBezierPath*    (^bezierPathFill)(void);
LBDeclare UIBezierPath*    (^bezierPathStroke)(void);
LBDeclare UIBezierPath*    (^bezierPathAddClip)(void);
@end
