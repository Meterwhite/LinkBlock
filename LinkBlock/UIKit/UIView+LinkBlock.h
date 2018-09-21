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

LBDeclare NSValue*     (^viewFrameValue)(void);
LBDeclare NSValue*     (^viewBoundsValue)(void);


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
LBDeclare UIView*      (^viewSetTag)(NSInteger tag);
/** <^(CGFloat width)>保持比例设置宽,autolayout（需要宽高约束）优先 */
LBDeclare UIView*      (^viewSetWidthAspect)(CGFloat width);
/** <^(CGFloat height)>保持比例设置高,autolayout（需要宽高约束）优先 */
LBDeclare UIView*      (^viewSetHeightAspect)(CGFloat height);

LBDeclare UIView*      (^viewSetFrameVal)(CGRect frame);
LBDeclare UIView*      (^viewSetBoundsVal)(CGRect bounds);
LBDeclare UIView*      (^viewSetOriginVal)(CGPoint origin);
LBDeclare UIView*      (^viewSetCenterVal)(CGPoint center);
LBDeclare UIView*      (^viewSetSizeVal)(CGSize size);
/** <^(UIColor* color)>背景色 */
LBDeclare UIView*      (^viewBGColor)(UIColor* color);
LBDeclare UIView*      (^viewBGColorWhite)(void);
LBDeclare UIView*      (^viewBGColorClear)(void);
LBDeclare UIView*      (^viewBGColorRandom)(void);
/** <^(UIColor* color)> set to layer */
LBDeclare UIView*      (^viewBorderColor)(UIColor* color);
/** <^(CGFloat w)> set to layer */
LBDeclare UIView*      (^viewBorderWidth)(CGFloat w);
/** <^(UIColor* color,CGFloat w)> set to layer */
LBDeclare UIView*      (^viewBorderColorAndWidth)(UIColor* color,CGFloat w);
/** <^(CGFloat radius)>view.layer.cornerRadius */
LBDeclare UIView*      (^viewCornerRadius)(CGFloat radius);
/** <^(CGFloat radius)> */
LBDeclare UIView*      (^viewCornerRadiusAndClipsToBounds)(CGFloat radius);
/** <^(UIRectCorner side , CGSize radius)>方位组合的圆角;在AutoLayout下使用，如果没有width和height这两个约束可以在改该方法调用前先设置frame来告知准确的尺寸; */
LBDeclare UIView*      (^viewCornerRadiusSide)(UIRectCorner side , CGSize radius);
/** <^(BOOL b)> */
LBDeclare UIView*      (^viewClipsToBounds)(BOOL b);
LBDeclare UIView*      (^viewClipsToBoundsYES)(void);
LBDeclare UIView*      (^viewClipsToBoundsNO)(void);
/** <^(BOOL force)> */
LBDeclare UIView*      (^viewEndEditing)(BOOL force);
LBDeclare UIView*      (^viewEndEditingYES)(void);
LBDeclare UIView*      (^viewBecomeFirstResponder)(void);
LBDeclare UIView*      (^viewResignFirstResponder)(void);
LBDeclare BOOL         (^viewIsFirstResponder)(void);
/** <^()>递归遍历第一响应者的的输入类型控件 */
LBDeclare UIView*      (^viewFirstResponderSubViewForInput)(void);
/** <^()>前置视图 */
LBDeclare UIView*      (^viewBringFrontInView)(void);
/** <^()>下沉视图 */
LBDeclare UIView*      (^viewSendBackInView)(void);
/** <^(UIView* theView)>是否为子视图，包括多层次的子视图 */
LBDeclare BOOL         (^viewIsSubviewTo)(UIView* theView);
/** <^()>当前视图位于同一层的前一个视图，没有则返回nil */
LBDeclare UIView*      (^viewBeforeIndexView)(void);
/** <^()>当前视图位于同一层的后一个视图，没有则返回nil */
LBDeclare UIView*      (^viewNextIndexView)(void);
/** <^(UIView* aView)>当前视图是否是其父视图 */
LBDeclare BOOL         (^viewIsSuperviewTo)(UIView* aView);
/** <^(BOOL b)>控制子控件的并发触控 */
LBDeclare UIView*      (^viewSubiewsExclusiveTouch)(BOOL b);
/** <^(BOOL b)>控件相对window的位置 */
LBDeclare CGRect       (^viewConvertRectToWindow)(void);
/** 
 *  <^(UIView* aView , BOOL isKeep)>
 *  更换父视图：即移动视图到另一个视图中作为子视图，参数：aView目标视图 ，isKeep是否保持当前视觉位置不变，否则保持frame不变
 *  (不考虑Autolayou)
 */
LBDeclare UIView*      (^viewConvertSuperviewTo)(UIView* newSuperview , BOOL isKeep);


LBDeclare UIView*      (^viewUserInteractionEnabled)(BOOL b);
LBDeclare UIView*      (^viewUserInteractionEnabledYES)(void);
LBDeclare UIView*      (^viewUserInteractionEnabledNO)(void);
LBDeclare UIView*      (^viewHidden)(BOOL hidden);
LBDeclare UIView*      (^viewHiddenYES)(void);
LBDeclare UIView*      (^viewHiddenNO)(void);
LBDeclare UIView*      (^viewContentMode)(UIViewContentMode contentMode);
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

LBDeclare UIView*      (^viewAlpha)(CGFloat alpha);
LBDeclare UIView*      (^viewOpaque)(CGFloat opaque);
LBDeclare UIView*      (^viewMultipleTouchEnabled)(BOOL b);
LBDeclare UIView*      (^viewExclusiveTouch)(BOOL b);
LBDeclare UIView*      (^viewAutoresizingMask)(UIViewAutoresizing mask);


LBDeclare UIView*      (^viewSubviewAt)(NSUInteger index);
/** <^()>在父视图中的索引。如果没有则返回-1 */
LBDeclare NSInteger    (^viewIndexInSuperview)(void);
LBDeclare UIView*      (^viewRemoveFromSuperview)(void);
LBDeclare UIView*      (^viewRemoveSubviewAt)(NSUInteger index);
/** <^()>移除所有子控件 */
LBDeclare UIView*      (^viewRemoveAllSubview)(void);
LBDeclare UIView*      (^viewInsertSubviewAtIndex)(UIView* subView, NSUInteger index);
LBDeclare UIView*      (^viewInsertToViewAtIndex)(UIView* toView, NSUInteger index);
LBDeclare UIView*      (^viewInsertSubviewAbouve)(UIView* subView, UIView* abouveView);
LBDeclare UIView*      (^viewInsertToViewAbouve)(UIView* toView, UIView* abouveView);
LBDeclare UIView*      (^viewInsertSubviewBelow)(UIView* subView, UIView* belowView);
LBDeclare UIView*      (^viewInsertToViewBelow)(UIView* toView, UIView* belowView);
LBDeclare UIView*      (^viewExchangeSubviewByIndex)(NSUInteger index1, NSUInteger index2);
LBDeclare UIView*      (^viewAddSubview)(UIView* subview);
LBDeclare UIView*      (^viewAddSubviews)(UIView* v0,...);
LBDeclare UIView*      (^viewAddToView)(__weak UIView* view);
LBDeclare UIView*      (^viewSetNeedsLayout)(void);
LBDeclare UIView*      (^viewLayoutIfNeeded)(void);
LBDeclare UIView*      (^viewSetNeedsDisplay)(void);

LBDeclare NSMutableArray*      (^viewFindSubviewsOfClass)(Class clazz);
#pragma mark - 常见动画部分
LBDeclare UIView*      (^viewHiddenYESUsingAnimate)(NSTimeInterval during);
LBDeclare UIView*      (^viewHiddenNOUsingAnimate)(NSTimeInterval during);
/** <^(CGFloat distance, NSTimeInterval time)>CGAffineTransformTranslate注：真实移动了视图的位置 */
LBDeclare UIView*      (^viewAnimateMoveUp)(CGFloat distance, NSTimeInterval time);
/** <^(CGFloat distance, NSTimeInterval time)>CGAffineTransformTranslate注：真实移动了视图的位置 */
LBDeclare UIView*      (^viewAnimateMoveDown)(CGFloat distance, NSTimeInterval time);
/** <^(CGFloat distance, NSTimeInterval time)>CGAffineTransformTranslate注：真实移动了视图的位置 */
LBDeclare UIView*      (^viewAnimateMoveRight)(CGFloat distance, NSTimeInterval time);
/** <^(CGFloat distance, NSTimeInterval time)>CGAffineTransformTranslate注：真实移动了视图的位置 */
LBDeclare UIView*      (^viewAnimateMoveLeft)(CGFloat distance, NSTimeInterval time);
/** <^(double duration)>水平摇晃 */
LBDeclare UIView*      (^viewAnimateShakeHorizental)(double duration);
/** <^(double duration)>垂直摇晃 */
LBDeclare UIView*      (^viewAnimateShakeVertical)(double duration);
/** <^()>苹果桌面视差效果 */
LBDeclare UIView*      (^viewAnimateAppleMotionEffects)(void) NS_DEPRECATED_IOS(2_0, 7_0, "ios more than 7.0 effective"); //
/** <^(CGFloat scale,NSTimeInterval duration,BOOL repeat)>脉冲形式的放大缩小 */
LBDeclare UIView*      (^viewAnimatePulse)(CGFloat scale,NSTimeInterval duration,BOOL repeat);
/** <^(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse)>翻转动画 */
LBDeclare UIView*      (^viewAnimateFlipFromTop)(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse);
/** <^(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse)>翻转动画 */
LBDeclare UIView*      (^viewAnimateFlipFromBottom)(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse);
/** <^(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse)>翻转动画 */
LBDeclare UIView*      (^viewAnimateFlipFromRight)(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse);
/** <^(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse)>翻转动画 */
LBDeclare UIView*      (^viewAnimateFlipFromLeft)(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse);
/** 
 *  <^(CGFloat angle,NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse)>  旋转动画
 */
LBDeclare UIView*      (^viewAnimateRotateToRight)(CGFloat angle,NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse);
/** <^(CGFloat angle,NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse)>旋转动画 */
LBDeclare UIView*      (^viewAnimateRotateToLeft)(CGFloat angle,NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse);
/** <^(CGFloat from , CGFloat to , NSTimeInterval duration)>透明度动画 */
LBDeclare UIView*      (^viewAnimateOpacity)(CGFloat from , CGFloat to , NSTimeInterval duration);
/** <^()>移除所有动画 */
LBDeclare UIView*      (^viewAnimateRemove)(void);
/** <^()>是否正在动画 */
LBDeclare BOOL         (^viewAnimateIsDoing)(void);
/** <^()>暂停动画 */
LBDeclare UIView*      (^viewAnimatePause)(void);
/** <^()>恢复动画，在暂停动画后使用 */
LBDeclare UIView*      (^viewAnimateResume)(void);
/** <^()>视图截屏 */
LBDeclare UIImage*     (^viewSnapshot)(void);

#pragma mark - 参考布局
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
/** <^(CGFloat value)>设置约束的Width；约束不存在是会自动增加； */
LBDeclare UIView*      (^viewConstraintWidth)(CGFloat value);
/** <^(CGFloat value)>设置autolayout的Height；约束不存在是会自动增加； */
LBDeclare UIView*      (^viewConstraintHeight)(CGFloat value);
/** <^(CGFloat value)>设置autolayout的Top */
LBDeclare UIView*      (^viewConstraintTop)(CGFloat value);
/** <^(CGFloat value)>设置autolayout的Bottom */
LBDeclare UIView*      (^viewConstraintBottom)(CGFloat value);
/** <^(CGFloat value)>设置autolayout的Leading */
LBDeclare UIView*      (^viewConstraintLeading)(CGFloat value);
/** <^(CGFloat value)>设置autolayout的Trailing*/
LBDeclare UIView*      (^viewConstraintTrailing)(CGFloat value);
/** <^(CGFloat value)>设置autolayout的Left */
LBDeclare UIView*      (^viewConstraintLeft)(CGFloat value);
/** <^(CGFloat value)>设置autolayout的Right */
LBDeclare UIView*      (^viewConstraintRight)(CGFloat value);
/** <^(CGFloat value)>设置autolayout的Leading或Left */
LBDeclare UIView*      (^viewConstraintLeftOrLeading)(CGFloat value);
/** <^(CGFloat value)>设置autolayout的Trailing或Right */
LBDeclare UIView*      (^viewConstraintRightOrTrailing)(CGFloat value);

/** <^(CGFloat value)>设置autolayout的CenterX */
LBDeclare UIView*      (^viewConstraintCenterX)(CGFloat value);
/** <^(CGFloat value)>设置autolayout的CenterY */
LBDeclare UIView*      (^viewConstraintCenterY)(CGFloat value);
/** <^(CGFloat value)>设置autolayout的Baseline */
LBDeclare UIView*      (^viewConstraintBaseline)(CGFloat value);
/** <^(CGFloat value)>设置autolayout的LastBaseline */
LBDeclare UIView*      (^viewConstraintLastBaseline)(CGFloat value);
/** <^(CGFloat value)>设置autolayout的FirstBaseline */
LBDeclare UIView*      (^viewConstraintFirstBaseline)(CGFloat value);
/** <^()>移除当前视图拥有的约束以以及在父视图中当前视图主相关约束 */
LBDeclare UIView*      (^viewRemoveConstraints)(void);

/** <^()>是否使用Autolayout */
LBDeclare BOOL         (^viewIsUsingAutolayout)(void);
#pragma mark - Autoresizing
/** <^()>是否使用Autoresizing */
LBDeclare BOOL         (^viewIsUsingAutoresizing)(void);
/** <^()> */
LBDeclare UIView*      (^viewRemoveAutoresizing)(void);
@end

@interface UIView (UIViewLinkBlock)
#pragma mark - 测试
/** 添加一个测试按钮，每次点击idx自增 */
- (UIButton*)viewAddTestBtn:(CGRect)frame block:(void(^)(NSInteger idx, UIButton* testButton))block;
/** 遍历子视图，当前视图deep=0 */
- (void)viewEnumerateSubviewsUsingBlock:(void(^)(UIView* subview , NSUInteger deep , NSUInteger idx , BOOL* stop))block;
/** 遍历父视图 */
- (void)viewEnumerateSuperviewUsingBlock:(void(^)(UIView* superview,BOOL* stop))block;
@end
