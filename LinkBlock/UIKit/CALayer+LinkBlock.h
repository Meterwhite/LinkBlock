//
//  CALayer+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/5/19.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

#ifndef CALayerNew
#define CALayerNew ([CALayer layer])
#endif
@interface  NSObject(CALayerLinkBlock)

#pragma mark - Foundation Mirror/镜像
LBDeclare CALayer*     (^layerSetBounds)(CGFloat x,CGFloat y, CGFloat width, CGFloat height);
LBDeclare CALayer*     (^layerSetPosition)(CGFloat x,CGFloat y);
LBDeclare CALayer*     (^layerSetFrame)(CGFloat x,CGFloat y, CGFloat width, CGFloat height);
LBDeclare CALayer*     (^layerSetAnchorPoint)(CGFloat x,CGFloat y);
LBDeclare CALayer*     (^layerSetTransform)(CATransform3D transform);
LBDeclare UIView*      (^layerSetOrigin)(CGFloat x,CGFloat y);
LBDeclare UIView*      (^layerSetSize)(CGFloat width, CGFloat height);
LBDeclare CALayer*     (^layerAddSublayer)(CALayer* layer);
LBDeclare CALayer*     (^layerInsertSublayerAt)(CALayer* layer,unsigned idx);
LBDeclare CALayer*     (^layerInsertSublayerBelow)(CALayer* layer,CALayer* sibling);
LBDeclare CALayer*     (^layerInsertSublayerAbove)(CALayer* layer,CALayer* sibling);
LBDeclare CALayer*     (^layerReplaceSublayerWithLayer)(CALayer* layer,CALayer* newLayer);
LBDeclare CALayer*     (^layerAddAnimation)(CAAnimation* animation);
LBDeclare CALayer*     (^layerAddAnimationWithKey)(CAAnimation* animation , NSString* key);
LBDeclare CALayer*     (^layerRemoveAllAnimations)(void);
LBDeclare CALayer*     (^layerRemoveAnimationForKey)(NSString* key);
LBDeclare CALayer*     (^layerCornerRadius)(CGFloat cornerRadius);
LBDeclare CALayer*     (^layerBorderWidth)(CGFloat borderWidth);
LBDeclare CALayer*     (^layerBorderColor)(UIColor* color);
LBDeclare CALayer*     (^layerBGColor)(UIColor* color);
LBDeclare CALayer*     (^layerMask)(CALayer* mask);
LBDeclare CALayer*     (^layerShadowColor)(UIColor* color);
LBDeclare CALayer*     (^layerShadowOpacity)(float shadowOpacity);
LBDeclare CALayer*     (^layerShadowOffset)(CGFloat width , CGFloat height);
LBDeclare CALayer*     (^layerShadowRadius)(CGFloat shadowRadius);
LBDeclare CALayer*     (^layerShadowPath)(CGPathRef shadowPath);

#pragma mark - Foundation Speed/速度
LBDeclare UIView*      (^layerSetX)(CGFloat x);
LBDeclare UIView*      (^layerSetY)(CGFloat y);
LBDeclare UIView*      (^layerSetWidth)(CGFloat width);
LBDeclare UIView*      (^layerSetHeight)(CGFloat height);

@end
