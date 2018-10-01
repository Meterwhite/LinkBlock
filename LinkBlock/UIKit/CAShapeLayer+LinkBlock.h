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

#pragma mark - Foundation Mirror/镜像
LBDeclare CAShapeLayer*    (^sharpLayerSetPath)(UIBezierPath* path);
LBDeclare CAShapeLayer*    (^sharpLayerSetFillColor)(UIColor* color);
LBDeclare CAShapeLayer*    (^sharpLayerSetStrokeColor)(UIColor* color);
LBDeclare CAShapeLayer*    (^sharpLayerSetFillRule)(NSString *fillRule);
LBDeclare CAShapeLayer*    (^sharpLayerSetStrokeStart)(CGFloat strokeStart);
LBDeclare CAShapeLayer*    (^sharpLayerSetStrokeEnd)(CGFloat strokeEnd);
LBDeclare CAShapeLayer*    (^sharpLayerSetLineWidth)(CGFloat lineWidth);
LBDeclare CAShapeLayer*    (^sharpLayerSetMiterLimit)(CGFloat miterLimit);
LBDeclare CAShapeLayer*    (^sharpLayerSetLineCap)(NSString* lineCap);
LBDeclare CAShapeLayer*    (^sharpLayerSetLineJoin)(NSString* lineJoin);
LBDeclare CAShapeLayer*    (^sharpLayerSetLineDashPhase)(CGFloat lineDashPhase);
LBDeclare CAShapeLayer*    (^sharpLayerSetLineDashPattern)(NSArray<NSNumber *> *lineDashPattern);
@end
