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

LBDeclare UIView*      (^viewBGColor)(UIColor* color);
LBDeclare UIView*      (^viewSetTag)(NSInteger tag);
LBDeclare UIView*      (^viewSetFrameVal)(CGRect frame);
LBDeclare UIView*      (^viewSetBoundsVal)(CGRect bounds);
LBDeclare UIView*      (^viewSetOriginVal)(CGPoint origin);
LBDeclare UIView*      (^viewSetCenterVal)(CGPoint center);
LBDeclare UIView*      (^viewSetSizeVal)(CGSize size);
LBDeclare UIView*      (^viewClipsToBounds)(BOOL b);
LBDeclare UIView*      (^viewEndEditing)(BOOL force);
LBDeclare UIView*      (^viewUserInteractionEnabled)(BOOL b);
LBDeclare UIView*      (^viewHidden)(BOOL hidden);
LBDeclare UIView*      (^viewContentMode)(UIViewContentMode contentMode);
LBDeclare UIView*      (^viewBecomeFirstResponder)(void);
LBDeclare UIView*      (^viewResignFirstResponder)(void);
LBDeclare UIView*      (^viewSubviewsExclusiveTouch)(BOOL b);
LBDeclare BOOL         (^viewIsFirstResponder)(void);
LBDeclare UIView*      (^viewAlpha)(CGFloat alpha);
LBDeclare UIView*      (^viewOpaque)(CGFloat opaque);
LBDeclare UIView*      (^viewMultipleTouchEnabled)(BOOL b);
LBDeclare UIView*      (^viewExclusiveTouch)(BOOL b);
LBDeclare UIView*      (^viewAutoresizingMask)(UIViewAutoresizing mask);
LBDeclare UIView*      (^viewSetNeedsLayout)(void);
LBDeclare UIView*      (^viewLayoutIfNeeded)(void);
LBDeclare UIView*      (^viewSetNeedsDisplay)(void);
LBDeclare UIView*      (^viewAddSubview)(UIView* subview);
LBDeclare UIView*      (^viewRemoveFromSuperview)(void);
LBDeclare UIView*      (^viewExchangeSubviewByIndex)(NSUInteger index1, NSUInteger index2);


#pragma mark - Foundation Speed/速度
/** <^()> CGRectIsEmpty */
LBDeclare BOOL         (^viewIsZeroSize)(void);
LBDeclare CGFloat      (^viewX)(void);
LBDeclare CGFloat      (^viewY)(void);
LBDeclare CGFloat      (^viewMaxX)(void);
LBDeclare CGFloat      (^viewMaxY)(void);
LBDeclare CGPoint      (^viewOrigin)(void);
LBDeclare CGFloat      (^viewCenterX)(void);
LBDeclare CGFloat      (^viewCenterY)(void);
LBDeclare CGFloat      (^viewWidth)(void);
LBDeclare CGFloat      (^viewHeight)(void);
LBDeclare CGSize       (^viewSize)(void);
LBDeclare UIView*      (^viewSetFrame)(CGFloat x,CGFloat y, CGFloat width,CGFloat height);
LBDeclare UIView*      (^viewSetBounds)(CGFloat x,CGFloat y, CGFloat width,CGFloat height);
LBDeclare UIView*      (^viewSetX)(CGFloat x);
LBDeclare UIView*      (^viewSetY)(CGFloat y);
LBDeclare UIView*      (^viewSetWidth)(CGFloat width);
LBDeclare UIView*      (^viewSetHeight)(CGFloat height);
LBDeclare UIView*      (^viewSetCenterX)(CGFloat centerX);
LBDeclare UIView*      (^viewSetCenterY)(CGFloat centerY);
LBDeclare UIView*      (^viewSetOrigin)(CGFloat x,CGFloat y);
LBDeclare UIView*      (^viewSetCenter)(CGFloat x,CGFloat y);
LBDeclare UIView*      (^viewSetSize)(CGFloat width, CGFloat height);
LBDeclare NSValue*     (^viewFrameValue)(void);
LBDeclare NSValue*     (^viewBoundsValue)(void);
LBDeclare UIView*      (^viewBorderColor)(UIColor* color);
LBDeclare UIView*      (^viewBorderWidth)(CGFloat w);
LBDeclare UIView*      (^viewBorderColorAndWidth)(UIColor* color,CGFloat w);
LBDeclare UIView*      (^viewCornerRadius)(CGFloat radius);
LBDeclare UIView*      (^viewCornerRadiusAndClipsToBounds)(CGFloat radius);
/** <^(UIRectCorner side , CGSize radius)>组合圆角;如果在AutoLayout下，若没有width和height这两个约束可以在改该方法调用前先设置frame来告知准确的尺寸; */
LBDeclare UIView*      (^viewCornerRadiusSide)(UIRectCorner side , CGSize radius);
/** 前置视图 */
LBDeclare UIView*      (^viewBringFrontInSuperview)(void);
/** 下沉视图 */
LBDeclare UIView*      (^viewSendBackInSuperview)(void);
LBDeclare UIView*      (^viewBGColorWhite)(void);
LBDeclare UIView*      (^viewBGColorClear)(void);
LBDeclare UIView*      (^viewBGColorRandom)(void);
LBDeclare UIView*      (^viewClipsToBoundsYES)(void);
LBDeclare UIView*      (^viewClipsToBoundsNO)(void);
LBDeclare UIView*      (^viewEndEditingYES)(void);
LBDeclare UIView*      (^viewUserInteractionEnabledYES)(void);
LBDeclare UIView*      (^viewUserInteractionEnabledNO)(void);
LBDeclare UIView*      (^viewHiddenYES)(void);
LBDeclare UIView*      (^viewHiddenNO)(void);
LBDeclare UIView*      (^viewContentModeScaleToFill)(void);
LBDeclare UIView*      (^viewContentModeScaleAspectFit)(void);
LBDeclare UIView*      (^viewContentModeScaleAspectFill)(void);
LBDeclare UIView*      (^viewContentModeRedraw)(void);
LBDeclare UIView*      (^viewContentModeCenter)(void);
LBDeclare UIView*      (^viewContentModeTop)(void);
LBDeclare UIView*      (^viewContentModeBottom)(void);
LBDeclare UIView*      (^viewContentModeLeft)(void);
LBDeclare UIView*      (^viewContentModeRight)(void);
LBDeclare UIView*      (^viewContentModeTopLeft)(void);
LBDeclare UIView*      (^viewContentModeTopRight)(void);
LBDeclare UIView*      (^viewContentModeBottomLeft)(void);
LBDeclare UIView*      (^viewContentModeBottomRight)(void);



#pragma mark - Foundation Extend/多则
LBDeclare UIView*      (^viewAddSubviews)(UIView* v0,...);
LBDeclare UIView*      (^viewAddToView)(__weak UIView* view);
LBDeclare UIView*      (^viewRemoveAllSubview)(void);
/** 判断后代视图 */
LBDeclare BOOL         (^viewIsInView)(UIView* view);
/** 判断前辈视图 */
LBDeclare BOOL         (^viewContainsView)(UIView* view);
/** <^(BOOL b)>控件相对window的位置 */
LBDeclare CGRect       (^viewConvertRectToWindow)(void);
LBDeclare UIView*      (^viewSubviewAt)(NSUInteger index);
LBDeclare UIView*      (^viewRemoveSubviewAt)(NSUInteger index);
/** <^()>在父视图中的索引。如果没有则返回-1 */
LBDeclare NSInteger    (^viewIndexInSuperview)(void);
/** <^()>视图截屏 */
LBDeclare UIImage*     (^viewSnapshot)(void);
LBDeclare UIView*      (^viewInsertSubviewAtIndex)(UIView* subView, NSUInteger index);
LBDeclare UIView*      (^viewInsertToViewAtIndex)(UIView* toView, NSUInteger index);
LBDeclare UIView*      (^viewInsertSubviewAbouve)(UIView* subView, UIView* abouveView);
LBDeclare UIView*      (^viewInsertToViewAbouve)(UIView* toView, UIView* abouveView);
LBDeclare UIView*      (^viewInsertSubviewBelow)(UIView* subView, UIView* belowView);
LBDeclare UIView*      (^viewInsertToViewBelow)(UIView* toView, UIView* belowView);



#pragma mark - LinkBlock
LBDeclare NSMutableArray*      (^viewFindSubviewsOfClass)(Class clazz);
/** <^(CGFloat width)>保持比例设置宽,autolayout（需要宽高约束）优先 */
LBDeclare UIView*      (^viewSetWidthAspect)(CGFloat width);
/** <^(CGFloat height)>保持比例设置高,autolayout（需要宽高约束）优先 */
LBDeclare UIView*      (^viewSetHeightAspect)(CGFloat height);
/** <^()>递归遍历第一响应者的的输入类型控件 */
LBDeclare UIView*      (^viewFirstResponderSubViewForInput)(void);
/** -1索引的兄弟视图 or NSNull */
LBDeclare UIView*      (^viewPrevIndexView)(void);
/** +1索引的兄弟视图 or NSNull */
LBDeclare UIView*      (^viewNextIndexView)(void);
/** 
 *  <^(UIView* aView , BOOL isKeep)>
 *  更换父视图：即移动视图到另一个视图中作为子视图，参数：aView目标视图 ，isKeep是否保持当前视觉位置不变，否则保持frame不变
 *  (不考虑Autolayou)
 */
LBDeclare UIView*      (^viewConvertSuperviewTo)(UIView* newSuperview , BOOL isKeep);
/** 判断是否使用Autolayout */
LBDeclare BOOL         (^viewIsUsingAutolayout)(void);
/** 判断是否使用Autoresizing */
LBDeclare BOOL         (^viewIsUsingAutoresizing)(void);
LBDeclare UIView*      (^viewRemoveAutoresizing)(void);

#pragma mark - Animation 动画
LBDeclare UIView*      (^viewHiddenYESUsingAnimate)(NSTimeInterval during);
LBDeclare UIView*      (^viewHiddenNOUsingAnimate)(NSTimeInterval during);
/** 注：真实移动了视图的位置 */
LBDeclare UIView*      (^viewAnimateMoveUp)(CGFloat distance, NSTimeInterval time);
LBDeclare UIView*      (^viewAnimateMoveDown)(CGFloat distance, NSTimeInterval time);
LBDeclare UIView*      (^viewAnimateMoveRight)(CGFloat distance, NSTimeInterval time);
LBDeclare UIView*      (^viewAnimateMoveLeft)(CGFloat distance, NSTimeInterval time);
/** 水平摇晃 */
LBDeclare UIView*      (^viewAnimateShakeHorizental)(double duration);
/** 垂直摇晃 */
LBDeclare UIView*      (^viewAnimateShakeVertical)(double duration);
/** 苹果桌面视差效果 */
LBDeclare UIView*      (^viewAnimateAppleMotionEffects)(void)
NS_DEPRECATED_IOS(2_0, 7_0, "ios more than 7.0 effective");
/** 脉冲形式的放大缩小 */
LBDeclare UIView*      (^viewAnimatePulse)(CGFloat scale,NSTimeInterval duration,BOOL repeat);
/** 上翻转 */
LBDeclare UIView*      (^viewAnimateFlipFromTop)
(
 NSTimeInterval duration,
 NSUInteger repeatCount,
 BOOL shouldAutoreverse
 );
/** 下翻转 */
LBDeclare UIView*      (^viewAnimateFlipFromBottom)
(
 NSTimeInterval duration,
 NSUInteger repeatCount,
 BOOL shouldAutoreverse
 );
/** 右翻转 */
LBDeclare UIView*      (^viewAnimateFlipFromRight)
(
 NSTimeInterval duration,
 NSUInteger repeatCount,
 BOOL shouldAutoreverse
 );
/** 左翻转 */
LBDeclare UIView*      (^viewAnimateFlipFromLeft)
(
 NSTimeInterval duration,
 NSUInteger repeatCount,
 BOOL shouldAutoreverse
 );
/** 旋转动画 */
LBDeclare UIView*      (^viewAnimateRotateToRight)
(
 CGFloat angle,
 NSTimeInterval duration,
 NSUInteger repeatCount,
 BOOL shouldAutoreverse
 );
/** 旋转动画 */
LBDeclare UIView*      (^viewAnimateRotateToLeft)
(
 CGFloat angle,
 NSTimeInterval duration,
 NSUInteger repeatCount,
 BOOL shouldAutoreverse
);
/** 透明度动画 */
LBDeclare UIView*      (^viewAnimateOpacity)(CGFloat from,CGFloat to,NSTimeInterval duration);
/** 移除所有动画 */
LBDeclare UIView*      (^viewAnimateRemove)(void);
/** 是否正在动画 */
LBDeclare BOOL         (^viewAnimateIsDoing)(void);
/** 暂停动画 */
LBDeclare UIView*      (^viewAnimatePause)(void);
/** 恢复动画，在暂停动画后使用 */
LBDeclare UIView*      (^viewAnimateResume)(void);


#pragma mark - copy position 参考布局
LBDeclare UIView*      (^viewCopyX)(UIView* fromView);
LBDeclare UIView*      (^viewCopyY)(UIView* fromView);
LBDeclare UIView*      (^viewCopyFrame)(UIView* fromView);
LBDeclare UIView*      (^viewCopySize)(UIView* fromView);
LBDeclare UIView*      (^viewCopyOrigin)(UIView* fromView);
LBDeclare UIView*      (^viewCopyCenter)(UIView* fromView);
LBDeclare UIView*      (^viewCopyCenterX)(UIView* fromView);
LBDeclare UIView*      (^viewCopyCenterY)(UIView* fromView);
LBDeclare UIView*      (^viewTopTo)(UIView* toView, CGFloat margin);
LBDeclare UIView*      (^viewLeftTo)(UIView* toView, CGFloat margin);
LBDeclare UIView*      (^viewBottomTo)(UIView* toView, CGFloat margin);
LBDeclare UIView*      (^viewRightTo)(UIView* toView, CGFloat margin);


#pragma mark - Autolayout 自动布局
/** 移除当前视图拥有的约束以及在它父视图中与此相关的约束 */
LBDeclare UIView*      (^viewRemoveConstraints)(void);
/** 设置或修改约束 */
LBDeclare UIView*      (^viewConstraintWidth)(CGFloat value);
LBDeclare UIView*      (^viewConstraintHeight)(CGFloat value);
/** 修改约束 */
LBDeclare UIView*      (^viewConstraintTop)(CGFloat value);
LBDeclare UIView*      (^viewConstraintBottom)(CGFloat value);
LBDeclare UIView*      (^viewConstraintLeading)(CGFloat value);
LBDeclare UIView*      (^viewConstraintTrailing)(CGFloat value);
LBDeclare UIView*      (^viewConstraintLeft)(CGFloat value);
LBDeclare UIView*      (^viewConstraintRight)(CGFloat value);
LBDeclare UIView*      (^viewConstraintLeftOrLeading)(CGFloat value);
LBDeclare UIView*      (^viewConstraintRightOrTrailing)(CGFloat value);
LBDeclare UIView*      (^viewConstraintCenterX)(CGFloat value);
LBDeclare UIView*      (^viewConstraintCenterY)(CGFloat value);
LBDeclare UIView*      (^viewConstraintBaseline)(CGFloat value);
LBDeclare UIView*      (^viewConstraintLastBaseline)(CGFloat value);
LBDeclare UIView*      (^viewConstraintFirstBaseline)(CGFloat value);

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
