//
//  CAShapeLayer+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/5/19.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

#ifndef CAShapeLayerNew
#define CAShapeLayerNew ([CAShapeLayer layer])
#endif
@interface  NSObject(CAShapeLayerLinkBlock)
/** <^(UIBezierPath* path)> */
LBDeclare CAShapeLayer*    (^sharpLayerSetPath)(UIBezierPath* path);
/** <^(UIColor* color)> */
LBDeclare CAShapeLayer*    (^sharpLayerSetFillColor)(UIColor* color);
/** <^(UIColor* color)> */
LBDeclare CAShapeLayer*    (^sharpLayerSetStrokeColor)(UIColor* color);
/** <^(NSString *fillRule)> */
LBDeclare CAShapeLayer*    (^sharpLayerSetFillRule)(NSString *fillRule);
/** <^(CGFloat strokeStart)> */
LBDeclare CAShapeLayer*    (^sharpLayerSetStrokeStart)(CGFloat strokeStart);
/** <^(CGFloat strokeEnd)> */
LBDeclare CAShapeLayer*    (^sharpLayerSetStrokeEnd)(CGFloat strokeEnd);
/** <^(CGFloat lineWidth)> */
LBDeclare CAShapeLayer*    (^sharpLayerSetLineWidth)(CGFloat lineWidth);
/** <^(CGFloat miterLimit)> */
LBDeclare CAShapeLayer*    (^sharpLayerSetMiterLimit)(CGFloat miterLimit);
/** <^(NSString* lineCap)> */
LBDeclare CAShapeLayer*    (^sharpLayerSetLineCap)(NSString* lineCap);
/** <^(NSString* lineJoin)> */
LBDeclare CAShapeLayer*    (^sharpLayerSetLineJoin)(NSString* lineJoin);
/** <^(CGFloat lineDashPhase)> */
LBDeclare CAShapeLayer*    (^sharpLayerSetLineDashPhase)(CGFloat lineDashPhase);
/** <^(NSArray<NSNumber *> *lineDashPattern)> */
LBDeclare CAShapeLayer*    (^sharpLayerSetLineDashPattern)(NSArray<NSNumber *> *lineDashPattern);
@end
