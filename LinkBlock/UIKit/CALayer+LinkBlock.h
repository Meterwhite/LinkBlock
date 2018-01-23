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
/** <^(CALayer* layer)> */
LBDeclare CALayer*     (^layerAddSublayer)(CALayer* layer);
/** <^(CALayer* layer,unsigned idx)> */
LBDeclare CALayer*     (^layerInsertSublayerAt)(CALayer* layer,unsigned idx);
/** <^(CALayer* layer,CALayer* sibling)> */
LBDeclare CALayer*     (^layerInsertSublayerBelow)(CALayer* layer,CALayer* sibling);
/** <^(CALayer* layer,CALayer* sibling)> */
LBDeclare CALayer*     (^layerInsertSublayerAbove)(CALayer* layer,CALayer* sibling);
/** <^(CALayer* layer,CALayer* newLayer)> */
LBDeclare CALayer*     (^layerReplaceSublayerWithLayer)(CALayer* layer,CALayer* newLayer);
/** <^(CAAnimation* animation)> */
LBDeclare CALayer*     (^layerAddAnimation)(CAAnimation* animation);
/** <^(CAAnimation* animation , NSString* key)> */
LBDeclare CALayer*     (^layerAddAnimationWithKey)(CAAnimation* animation , NSString* key);
/** <^()> */
LBDeclare CALayer*     (^layerRemoveAllAnimations)(void);
/** <^(NSString* key)> */
LBDeclare CALayer*     (^layerRemoveAnimationForKey)(NSString* key);
/** <^(CGFloat cornerRadius)> */
LBDeclare CALayer*     (^layerCornerRadius)(CGFloat cornerRadius);
/** <^(CGFloat borderWidth)> */
LBDeclare CALayer*     (^layerBorderWidth)(CGFloat borderWidth);
/** <^(UIColor* color)> */
LBDeclare CALayer*     (^layerBorderColor)(UIColor* color);
/** <^(UIColor* color)> */
LBDeclare CALayer*     (^layerBGColor)(UIColor* color);
/** <^(CALayer* mask)> */
LBDeclare CALayer*     (^layerMask)(CALayer* mask);
/** <^(UIColor* color)> */
LBDeclare CALayer*     (^layerShadowColor)(UIColor* color);
/** <^(float shadowOpacity)> */
LBDeclare CALayer*     (^layerShadowOpacity)(float shadowOpacity);
/** <^(CGFloat width , CGFloat height)> */
LBDeclare CALayer*     (^layerShadowOffset)(CGFloat width , CGFloat height);
/** <^(CGFloat shadowRadius)> */
LBDeclare CALayer*     (^layerShadowRadius)(CGFloat shadowRadius);
/** <^(CGPathRef shadowPath)> */
LBDeclare CALayer*     (^layerShadowPath)(CGPathRef shadowPath);
/** <^(CGFloat x,CGFloat y, CGFloat width, CGFloat height)> */
LBDeclare CALayer*     (^layerSetBounds)(CGFloat x,CGFloat y, CGFloat width, CGFloat height);
/** <^(CGFloat x,CGFloat y)> */
LBDeclare CALayer*     (^layerSetPosition)(CGFloat x,CGFloat y);
/** <^(CGFloat x,CGFloat y, CGFloat width, CGFloat height)> */
LBDeclare CALayer*     (^layerSetFrame)(CGFloat x,CGFloat y, CGFloat width, CGFloat height);
/** <^(CGFloat x,CGFloat y)> */
LBDeclare CALayer*     (^layerSetAnchorPoint)(CGFloat x,CGFloat y);
/** <^(CATransform3D transform)> */
LBDeclare CALayer*     (^layerSetTransform)(CATransform3D transform);
/** <^(CGFloat x,CGFloat y)> */
LBDeclare UIView*      (^layerSetOrigin)(CGFloat x,CGFloat y);
/** <^(CGFloat width, CGFloat height)> */
LBDeclare UIView*      (^layerSetSize)(CGFloat width, CGFloat height);
/** <^(CGFloat width)> */
LBDeclare UIView*      (^layerSetWidth)(CGFloat width);
/** <^(CGFloat height)> */
LBDeclare UIView*      (^layerSetHeight)(CGFloat height);
/** <^(CGFloat x)> */
LBDeclare UIView*      (^layerSetX)(CGFloat x);
/** <^(CGFloat y)> */
LBDeclare UIView*      (^layerSetY)(CGFloat y);

@end
