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
@property (nonatomic,copy,readonly) CAShapeLayer*    (^sharpLayerSetPath)(UIBezierPath* path);
@property (nonatomic,copy,readonly) CAShapeLayer*    (^sharpLayerSetFillColor)(UIColor* color);
@property (nonatomic,copy,readonly) CAShapeLayer*    (^sharpLayerSetStrokeColor)(UIColor* color);
@property (nonatomic,copy,readonly) CAShapeLayer*    (^sharpLayerSetFillRule)(NSString *fillRule);
@property (nonatomic,copy,readonly) CAShapeLayer*    (^sharpLayerSetStrokeStart)(CGFloat strokeStart);
@property (nonatomic,copy,readonly) CAShapeLayer*    (^sharpLayerSetStrokeEnd)(CGFloat strokeEnd);
@property (nonatomic,copy,readonly) CAShapeLayer*    (^sharpLayerSetLineWidth)(CGFloat lineWidth);
@property (nonatomic,copy,readonly) CAShapeLayer*    (^sharpLayerSetMiterLimit)(CGFloat miterLimit);
@property (nonatomic,copy,readonly) CAShapeLayer*    (^sharpLayerSetLineCap)(NSString* lineCap);
@property (nonatomic,copy,readonly) CAShapeLayer*    (^sharpLayerSetLineJoin)(NSString* lineJoin);
@property (nonatomic,copy,readonly) CAShapeLayer*    (^sharpLayerSetLineDashPhase)(CGFloat lineDashPhase);
@property (nonatomic,copy,readonly) CAShapeLayer*    (^sharpLayerSetLineDashPattern)(NSArray<NSNumber *> *lineDashPattern);
@end
