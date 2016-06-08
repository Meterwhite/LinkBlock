//
//  CAShapeLayer+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/5/19.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define CAShapeLayerNew ([CAShapeLayer layer])
@interface  NSObject(CAShapeLayerLinkBlock)
@property (nonatomic,copy) CAShapeLayer*    (^sharpLayerSetPath)(UIBezierPath* path);
@property (nonatomic,copy) CAShapeLayer*    (^sharpLayerSetFillColor)(UIColor* color);
@property (nonatomic,copy) CAShapeLayer*    (^sharpLayerSetStrokeColor)(UIColor* color);
@property (nonatomic,copy) CAShapeLayer*    (^sharpLayerSetFillRule)(NSString *fillRule);
@property (nonatomic,copy) CAShapeLayer*    (^sharpLayerSetStrokeStart)(CGFloat strokeStart);
@property (nonatomic,copy) CAShapeLayer*    (^sharpLayerSetStrokeEnd)(CGFloat strokeEnd);
@property (nonatomic,copy) CAShapeLayer*    (^sharpLayerSetLineWidth)(CGFloat lineWidth);
@property (nonatomic,copy) CAShapeLayer*    (^sharpLayerSetMiterLimit)(CGFloat miterLimit);
@property (nonatomic,copy) CAShapeLayer*    (^sharpLayerSetLineCap)(NSString* lineCap);
@property (nonatomic,copy) CAShapeLayer*    (^sharpLayerSetLineJoin)(NSString* lineJoin);
@property (nonatomic,copy) CAShapeLayer*    (^sharpLayerSetLineDashPhase)(CGFloat lineDashPhase);
@property (nonatomic,copy) CAShapeLayer*    (^sharpLayerSetLineDashPattern)(NSArray<NSNumber *> *lineDashPattern);
@end
