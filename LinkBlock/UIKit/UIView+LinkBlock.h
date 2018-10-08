//
//  UIView+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

#ifndef UIViewNew
#define UIViewNew ([UIView new])
#endif
@interface NSObject(UIViewLinkBlock)

#pragma mark Foundation Mirror/镜像

@property LB_BK UIView*      (^viewBGColor)(UIColor* color);
@property LB_BK UIView*      (^viewSetTag)(NSInteger tag);
@property LB_BK UIView*      (^viewSetFrameVal)(CGRect frame);
@property LB_BK UIView*      (^viewSetBoundsVal)(CGRect bounds);
@property LB_BK UIView*      (^viewSetOriginVal)(CGPoint origin);
@property LB_BK UIView*      (^viewSetCenterVal)(CGPoint center);
@property LB_BK UIView*      (^viewSetSizeVal)(CGSize size);
@property LB_BK UIView*      (^viewClipsToBounds)(BOOL b);
@property LB_BK UIView*      (^viewEndEditing)(BOOL force);
@property LB_BK UIView*      (^viewUserInteractionEnabled)(BOOL b);
@property LB_BK UIView*      (^viewHidden)(BOOL hidden);
@property LB_BK UIView*      (^viewContentMode)(UIViewContentMode contentMode);
@property LB_BK UIView*      (^viewBecomeFirstResponder)(void);
@property LB_BK UIView*      (^viewResignFirstResponder)(void);
@property LB_BK UIView*      (^viewSubviewsExclusiveTouch)(BOOL b);
@property LB_BK BOOL         (^viewIsFirstResponder)(void);
@property LB_BK UIView*      (^viewAlpha)(CGFloat alpha);
@property LB_BK UIView*      (^viewOpaque)(CGFloat opaque);
@property LB_BK UIView*      (^viewMultipleTouchEnabled)(BOOL b);
@property LB_BK UIView*      (^viewExclusiveTouch)(BOOL b);
@property LB_BK UIView*      (^viewAutoresizingMask)(UIViewAutoresizing mask);
@property LB_BK UIView*      (^viewSetNeedsLayout)(void);
@property LB_BK UIView*      (^viewLayoutIfNeeded)(void);
@property LB_BK UIView*      (^viewSetNeedsDisplay)(void);
@property LB_BK UIView*      (^viewAddSubview)(UIView* subview);
@property LB_BK UIView*      (^viewRemoveFromSuperview)(void);
@property LB_BK UIView*      (^viewExchangeSubviewByIndex)(NSUInteger index1, NSUInteger index2);


#pragma mark - Foundation Speed/速度
/** <^()> CGRectIsEmpty */
@property LB_BK BOOL         (^viewIsZeroSize)(void);
@property LB_BK CGFloat      (^viewX)(void);
@property LB_BK CGFloat      (^viewY)(void);
@property LB_BK CGFloat      (^viewMaxX)(void);
@property LB_BK CGFloat      (^viewMaxY)(void);
@property LB_BK CGPoint      (^viewOrigin)(void);
@property LB_BK CGFloat      (^viewCenterX)(void);
@property LB_BK CGFloat      (^viewCenterY)(void);
@property LB_BK CGFloat      (^viewWidth)(void);
@property LB_BK CGFloat      (^viewHeight)(void);
@property LB_BK CGSize       (^viewSize)(void);
@property LB_BK UIView*      (^viewSetFrame)(CGFloat x,CGFloat y, CGFloat width,CGFloat height);
@property LB_BK UIView*      (^viewSetBounds)(CGFloat x,CGFloat y, CGFloat width,CGFloat height);
@property LB_BK UIView*      (^viewSetX)(CGFloat x);
@property LB_BK UIView*      (^viewSetY)(CGFloat y);
@property LB_BK UIView*      (^viewSetWidth)(CGFloat width);
@property LB_BK UIView*      (^viewSetHeight)(CGFloat height);
@property LB_BK UIView*      (^viewSetCenterX)(CGFloat centerX);
@property LB_BK UIView*      (^viewSetCenterY)(CGFloat centerY);
@property LB_BK UIView*      (^viewSetOrigin)(CGFloat x,CGFloat y);
@property LB_BK UIView*      (^viewSetCenter)(CGFloat x,CGFloat y);
@property LB_BK UIView*      (^viewSetSize)(CGFloat width, CGFloat height);
@property LB_BK NSValue*     (^viewFrameValue)(void);
@property LB_BK NSValue*     (^viewBoundsValue)(void);
@property LB_BK UIView*      (^viewBorderColor)(UIColor* color);
@property LB_BK UIView*      (^viewBorderWidth)(CGFloat w);
@property LB_BK UIView*      (^viewBorderColorAndWidth)(UIColor* color,CGFloat w);
@property LB_BK UIView*      (^viewCornerRadius)(CGFloat radius);
@property LB_BK UIView*      (^viewCornerRadiusAndClipsToBounds)(CGFloat radius);
/** <^(UIRectCorner side , CGSize radius)>组合圆角;如果在AutoLayout下，若没有width和height这两个约束可以在改该方法调用前先设置frame来告知准确的尺寸; */
@property LB_BK UIView*      (^viewCornerRadiusSide)(UIRectCorner side , CGSize radius);
/** 前置视图 */
@property LB_BK UIView*      (^viewBringFrontInSuperview)(void);
/** 下沉视图 */
@property LB_BK UIView*      (^viewSendBackInSuperview)(void);
@property LB_BK UIView*      (^viewBGColorWhite)(void);
@property LB_BK UIView*      (^viewBGColorClear)(void);
@property LB_BK UIView*      (^viewBGColorRandom)(void);
@property LB_BK UIView*      (^viewClipsToBoundsYES)(void);
@property LB_BK UIView*      (^viewClipsToBoundsNO)(void);
@property LB_BK UIView*      (^viewEndEditingYES)(void);
@property LB_BK UIView*      (^viewUserInteractionEnabledYES)(void);
@property LB_BK UIView*      (^viewUserInteractionEnabledNO)(void);
@property LB_BK UIView*      (^viewHiddenYES)(void);
@property LB_BK UIView*      (^viewHiddenNO)(void);
@property LB_BK UIView*      (^viewContentModeScaleToFill)(void);
@property LB_BK UIView*      (^viewContentModeScaleAspectFit)(void);
@property LB_BK UIView*      (^viewContentModeScaleAspectFill)(void);
@property LB_BK UIView*      (^viewContentModeRedraw)(void);
@property LB_BK UIView*      (^viewContentModeCenter)(void);
@property LB_BK UIView*      (^viewContentModeTop)(void);
@property LB_BK UIView*      (^viewContentModeBottom)(void);
@property LB_BK UIView*      (^viewContentModeLeft)(void);
@property LB_BK UIView*      (^viewContentModeRight)(void);
@property LB_BK UIView*      (^viewContentModeTopLeft)(void);
@property LB_BK UIView*      (^viewContentModeTopRight)(void);
@property LB_BK UIView*      (^viewContentModeBottomLeft)(void);
@property LB_BK UIView*      (^viewContentModeBottomRight)(void);



#pragma mark - Foundation Extend/多则
@property LB_BK UIView*      (^viewAddSubviews)(UIView* v0,...);
@property LB_BK UIView*      (^viewAddToView)(__weak UIView* view);
@property LB_BK UIView*      (^viewRemoveAllSubview)(void);
/** 判断后代视图 */
@property LB_BK BOOL         (^viewIsInView)(UIView* view);
/** 判断前辈视图 */
@property LB_BK BOOL         (^viewContainsView)(UIView* view);
/** <^(BOOL b)>控件相对window的位置 */
@property LB_BK CGRect       (^viewConvertRectToWindow)(void);
@property LB_BK UIView*      (^viewSubviewAt)(NSUInteger index);
@property LB_BK UIView*      (^viewRemoveSubviewAt)(NSUInteger index);
/** <^()>在父视图中的索引。如果没有则返回-1 */
@property LB_BK NSInteger    (^viewIndexInSuperview)(void);
/** <^()>视图截屏 */
@property LB_BK UIImage*     (^viewSnapshot)(void);
@property LB_BK UIView*      (^viewInsertSubviewAtIndex)(UIView* subView, NSUInteger index);
@property LB_BK UIView*      (^viewInsertToViewAtIndex)(UIView* toView, NSUInteger index);
@property LB_BK UIView*      (^viewInsertSubviewAbouve)(UIView* subView, UIView* abouveView);
@property LB_BK UIView*      (^viewInsertToViewAbouve)(UIView* toView, UIView* abouveView);
@property LB_BK UIView*      (^viewInsertSubviewBelow)(UIView* subView, UIView* belowView);
@property LB_BK UIView*      (^viewInsertToViewBelow)(UIView* toView, UIView* belowView);



#pragma mark - LinkBlock
@property LB_BK NSMutableArray*      (^viewFindSubviewsOfClass)(Class clazz);
/** <^(CGFloat width)>保持比例设置宽,autolayout（需要宽高约束）优先 */
@property LB_BK UIView*      (^viewSetWidthAspect)(CGFloat width);
/** <^(CGFloat height)>保持比例设置高,autolayout（需要宽高约束）优先 */
@property LB_BK UIView*      (^viewSetHeightAspect)(CGFloat height);
/** <^()>递归遍历第一响应者的的输入类型控件 */
@property LB_BK UIView*      (^viewFirstResponderSubViewForInput)(void);
/** -1索引的兄弟视图 or NSNull */
@property LB_BK UIView*      (^viewPrevIndexView)(void);
/** +1索引的兄弟视图 or NSNull */
@property LB_BK UIView*      (^viewNextIndexView)(void);
/** 
 *  <^(UIView* aView , BOOL isKeep)>
 *  更换父视图：即移动视图到另一个视图中作为子视图，参数：aView目标视图 ，isKeep是否保持当前视觉位置不变，否则保持frame不变
 *  (不考虑Autolayou)
 */
@property LB_BK UIView*      (^viewConvertSuperviewTo)(UIView* newSuperview , BOOL isKeep);
/** 判断是否使用Autolayout */
@property LB_BK BOOL         (^viewIsUsingAutolayout)(void);
/** 判断是否使用Autoresizing */
@property LB_BK BOOL         (^viewIsUsingAutoresizing)(void);
@property LB_BK UIView*      (^viewRemoveAutoresizing)(void);

#pragma mark - Animation 动画
@property LB_BK UIView*      (^viewHiddenYESUsingAnimate)(NSTimeInterval during);
@property LB_BK UIView*      (^viewHiddenNOUsingAnimate)(NSTimeInterval during);
/** 注：真实移动了视图的位置 */
@property LB_BK UIView*      (^viewAnimateMoveUp)(CGFloat distance, NSTimeInterval time);
@property LB_BK UIView*      (^viewAnimateMoveDown)(CGFloat distance, NSTimeInterval time);
@property LB_BK UIView*      (^viewAnimateMoveRight)(CGFloat distance, NSTimeInterval time);
@property LB_BK UIView*      (^viewAnimateMoveLeft)(CGFloat distance, NSTimeInterval time);
/** 水平摇晃 */
@property LB_BK UIView*      (^viewAnimateShakeHorizental)(double duration);
/** 垂直摇晃 */
@property LB_BK UIView*      (^viewAnimateShakeVertical)(double duration);
/** 苹果桌面视差效果 */
@property LB_BK UIView*      (^viewAnimateAppleMotionEffects)(void)
NS_DEPRECATED_IOS(2_0, 7_0, "ios more than 7.0 effective");
/** 脉冲形式的放大缩小 */
@property LB_BK UIView*      (^viewAnimatePulse)(CGFloat scale,NSTimeInterval duration,BOOL repeat);
/** 上翻转 */
@property LB_BK UIView*      (^viewAnimateFlipFromTop)
(
 NSTimeInterval duration,
 NSUInteger repeatCount,
 BOOL shouldAutoreverse
 );
/** 下翻转 */
@property LB_BK UIView*      (^viewAnimateFlipFromBottom)
(
 NSTimeInterval duration,
 NSUInteger repeatCount,
 BOOL shouldAutoreverse
 );
/** 右翻转 */
@property LB_BK UIView*      (^viewAnimateFlipFromRight)
(
 NSTimeInterval duration,
 NSUInteger repeatCount,
 BOOL shouldAutoreverse
 );
/** 左翻转 */
@property LB_BK UIView*      (^viewAnimateFlipFromLeft)
(
 NSTimeInterval duration,
 NSUInteger repeatCount,
 BOOL shouldAutoreverse
 );
/** 旋转动画 */
@property LB_BK UIView*      (^viewAnimateRotateToRight)
(
 CGFloat angle,
 NSTimeInterval duration,
 NSUInteger repeatCount,
 BOOL shouldAutoreverse
 );
/** 旋转动画 */
@property LB_BK UIView*      (^viewAnimateRotateToLeft)
(
 CGFloat angle,
 NSTimeInterval duration,
 NSUInteger repeatCount,
 BOOL shouldAutoreverse
);
/** 透明度动画 */
@property LB_BK UIView*      (^viewAnimateOpacity)(CGFloat from,CGFloat to,NSTimeInterval duration);
/** 移除所有动画 */
@property LB_BK UIView*      (^viewAnimateRemove)(void);
/** 是否正在动画 */
@property LB_BK BOOL         (^viewAnimateIsDoing)(void);
/** 暂停动画 */
@property LB_BK UIView*      (^viewAnimatePause)(void);
/** 恢复动画，在暂停动画后使用 */
@property LB_BK UIView*      (^viewAnimateResume)(void);


#pragma mark - copy position 参考布局
@property LB_BK UIView*      (^viewCopyX)(UIView* fromView);
@property LB_BK UIView*      (^viewCopyY)(UIView* fromView);
@property LB_BK UIView*      (^viewCopyFrame)(UIView* fromView);
@property LB_BK UIView*      (^viewCopySize)(UIView* fromView);
@property LB_BK UIView*      (^viewCopyOrigin)(UIView* fromView);
@property LB_BK UIView*      (^viewCopyCenter)(UIView* fromView);
@property LB_BK UIView*      (^viewCopyCenterX)(UIView* fromView);
@property LB_BK UIView*      (^viewCopyCenterY)(UIView* fromView);
@property LB_BK UIView*      (^viewTopTo)(UIView* toView, CGFloat margin);
@property LB_BK UIView*      (^viewLeftTo)(UIView* toView, CGFloat margin);
@property LB_BK UIView*      (^viewBottomTo)(UIView* toView, CGFloat margin);
@property LB_BK UIView*      (^viewRightTo)(UIView* toView, CGFloat margin);


#pragma mark - Autolayout 自动布局
/** 移除当前视图拥有的约束以及在它父视图中与此相关的约束 */
@property LB_BK UIView*      (^viewRemoveConstraints)(void);
/** 设置或修改约束 */
@property LB_BK UIView*      (^viewConstraintWidth)(CGFloat value);
@property LB_BK UIView*      (^viewConstraintHeight)(CGFloat value);
/** 修改约束 */
@property LB_BK UIView*      (^viewConstraintTop)(CGFloat value);
@property LB_BK UIView*      (^viewConstraintBottom)(CGFloat value);
@property LB_BK UIView*      (^viewConstraintLeading)(CGFloat value);
@property LB_BK UIView*      (^viewConstraintTrailing)(CGFloat value);
@property LB_BK UIView*      (^viewConstraintLeft)(CGFloat value);
@property LB_BK UIView*      (^viewConstraintRight)(CGFloat value);
@property LB_BK UIView*      (^viewConstraintLeftOrLeading)(CGFloat value);
@property LB_BK UIView*      (^viewConstraintRightOrTrailing)(CGFloat value);
@property LB_BK UIView*      (^viewConstraintCenterX)(CGFloat value);
@property LB_BK UIView*      (^viewConstraintCenterY)(CGFloat value);
@property LB_BK UIView*      (^viewConstraintBaseline)(CGFloat value);
@property LB_BK UIView*      (^viewConstraintLastBaseline)(CGFloat value);
@property LB_BK UIView*      (^viewConstraintFirstBaseline)(CGFloat value);

@end

@interface UIView (UIViewLinkBlock)
#pragma mark - Test 测试
/** 添加一个测试按钮，每次点击idx自增 */
- (UIButton*)viewAddTestBtn:(CGRect)frame block:(void(^)(NSInteger idx, UIButton* testButton))block;
/** 遍历子视图，当前视图deep=0 */
- (void)viewEnumerateSubviewsUsingBlock:(void(^)(UIView* subview , NSUInteger depth , NSUInteger idx , BOOL* stop))block;
/** 遍历父视图 */
- (void)viewEnumerateSuperviewUsingBlock:(void(^)(UIView* superview,BOOL* stop))block;
@end
