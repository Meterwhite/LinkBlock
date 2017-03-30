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
/** <^()> */
LBDeclare BOOL         (^viewIsZeroSize)();
/** <^()> */
LBDeclare CGFloat      (^viewX)();
/** <^()> */
LBDeclare CGFloat      (^viewY)();
/** <^()> */
LBDeclare CGFloat      (^viewMaxX)();
/** <^()> */
LBDeclare CGFloat      (^viewMaxY)();
/** <^()> */
LBDeclare CGPoint      (^viewOrigin)();
/** <^()> */
LBDeclare CGFloat      (^viewCenterX)();
/** <^()> */
LBDeclare CGFloat      (^viewCenterY)();
/** <^()> */
LBDeclare CGFloat      (^viewWidth)();
/** <^()> */
LBDeclare CGFloat      (^viewHeight)();
/** <^()> */
LBDeclare CGSize       (^viewSize)();

/** <^(CGFloat x,CGFloat y, CGFloat width,CGFloat height)> */
LBDeclare UIView*      (^viewSetFrame)(CGFloat x,CGFloat y, CGFloat width,CGFloat height);
/** <^(CGFloat x)> */
LBDeclare UIView*      (^viewSetX)(CGFloat x);
/** <^(CGFloat y)> */
LBDeclare UIView*      (^viewSetY)(CGFloat y);
/** <^(CGFloat x,CGFloat y)> */
LBDeclare UIView*      (^viewSetOrigin)(CGFloat x,CGFloat y);
/** <^(CGFloat centerX)> */
LBDeclare UIView*      (^viewSetCenterX)(CGFloat centerX);
/** <^(CGFloat centerY)> */
LBDeclare UIView*      (^viewSetCenterY)(CGFloat centerY);
/** <^(CGFloat x,CGFloat y)> */
LBDeclare UIView*      (^viewSetCenter)(CGFloat x,CGFloat y);
/** <^(CGFloat width)> */
LBDeclare UIView*      (^viewSetWidth)(CGFloat width);
/** <^(CGFloat height)> */
LBDeclare UIView*      (^viewSetHeight)(CGFloat height);
/** <^(CGFloat width)>保持比例设置宽,autolayout（需要宽高约束）优先 */
LBDeclare UIView*      (^viewSetWidthAspect)(CGFloat width);
/** <^(CGFloat height)>保持比例设置高,autolayout（需要宽高约束）优先 */
LBDeclare UIView*      (^viewSetHeightAspect)(CGFloat height);
/** <^(CGFloat width, CGFloat height)> */
LBDeclare UIView*      (^viewSetSize)(CGFloat width, CGFloat height);
/** <^(NSInteger tag)> */
LBDeclare UIView*      (^viewSetTag)(NSInteger tag);
/** <^(UIColor* color)>背景色 */
LBDeclare UIView*      (^viewBGColor)(UIColor* color);
/** <^()>随机背景色 */
LBDeclare UIView*      (^viewBGColorRandom)();
/** <^(UIColor* color)> */
LBDeclare UIView*      (^viewBorderColor)(UIColor* color);
/** <^(CGFloat w)> */
LBDeclare UIView*      (^viewBorderWidth)(CGFloat w);
/** <^(CGFloat radius)>view.layer.cornerRadius */
LBDeclare UIView*      (^viewCornerRadius)(CGFloat radius);
/** <^(UIRectCorner side , CGSize radius)>方位组合的圆角 */
LBDeclare UIView*      (^viewCornerRadiusSide)(UIRectCorner side , CGSize radius);
/** <^(BOOL b)>view.layer.masksToBounds */
LBDeclare UIView*      (^viewMasksToBounds)(BOOL b);
/** <^(BOOL b)> */
LBDeclare UIView*      (^viewClipsToBounds)(BOOL b);
/** <^(BOOL force)> */
LBDeclare UIView*      (^viewEndEditing)(BOOL force);
/** <^()> */
LBDeclare UIView*      (^viewBecomeFirstResponder)();
/** <^()> */
LBDeclare UIView*      (^viewResignFirstResponder)();
/** <^()> */
LBDeclare BOOL         (^viewIsFirstResponder)();
/** <^()>递归此视图，找到第一响应者的的输入类型控件 */
LBDeclare UIView*      (^viewFirstResponderSubViewForInput)();
/** <^()>前置视图 */
LBDeclare UIView*      (^viewBringFrontInView)();
/** <^()>下沉视图 */
LBDeclare UIView*      (^viewSendBackInView)();
/** <^(UIView* theView)>是否为子视图，包括多层次的子视图 */
LBDeclare BOOL         (^viewIsSubviewTo)(UIView* theView);
/** <^()>当前视图位于同一层的前一个视图，没有则返回nil */
LBDeclare UIView*      (^viewBeforeIndexView)();
/** <^()>当前视图位于同一层的后一个视图，没有则返回nil */
LBDeclare UIView*      (^viewNextIndexView)();
/** <^(UIView* aView)>当前视图是否是父级别的视图 */
LBDeclare BOOL         (^viewIsSuperviewTo)(UIView* aView);
/** <^(BOOL b)>控制子控件的并发触控 */
LBDeclare UIView*      (^viewSubiewsExclusiveTouch)(BOOL b);
/** <^(BOOL b)>控件相对window的位置 */
LBDeclare CGRect       (^viewConvertRectToWindow)();
/** 
 *  <^(UIView* aView , BOOL isKeep)>
 *  更换父视图：即移动视图到另一个视图中作为子视图，参数：aView目标视图 ，isKeep是否保持当前视觉位置不变。
 *  (不考虑Autolayou)
 */
LBDeclare UIView*      (^viewConvertSuperverTo)(UIView* aView , BOOL isKeep);
/** <^(BOOL b)> */
LBDeclare UIView*      (^viewUserInteractionEnabled)(BOOL b);
/** <^(BOOL b)> */
LBDeclare UIView*      (^viewMultipleTouchEnabled)(BOOL b);
/** <^(BOOL b)> */
LBDeclare UIView*      (^viewExclusiveTouch)(BOOL b);
/** <^(UIViewAutoresizing mask)> */
LBDeclare UIView*      (^viewAutoresizingMask)(UIViewAutoresizing mask);
/** <^(CGFloat alpha)> */
LBDeclare UIView*      (^viewAlpha)(CGFloat alpha);
/** <^(CGFloat opaque)> */
LBDeclare UIView*      (^viewOpaque)(CGFloat opaque);
/** <^(BOOL hidden)> */
LBDeclare UIView*      (^viewHidden)(BOOL hidden);
/** <^(UIViewContentMode contentMode)> */
LBDeclare UIView*      (^viewContentMode)(UIViewContentMode contentMode);
/** <^(NSUInteger index)>越界时返回NSNull */
LBDeclare UIView*      (^viewSubviewAt)(NSUInteger index);
/** <^()>在父视图中的索引位。如果没有则返回0 */
LBDeclare NSUInteger   (^viewIndexInSuperview)();
/** <^()> */
LBDeclare UIView*      (^viewRemoveFromSuperview)();
/** <^(NSUInteger index)> */
LBDeclare UIView*      (^viewRemoveSubviewAt)(NSUInteger index);
/** <^()>移除所有子控件 */
LBDeclare UIView*      (^viewRemoveAllSubview)();
/** <^(UIView* subView, NSUInteger index)> */
LBDeclare UIView*      (^viewInsertSubviewAtIndex)(UIView* subView, NSUInteger index);
/** <^(UIView* toView, NSUInteger index)> */
LBDeclare UIView*      (^viewInsertToViewAtIndex)(UIView* toView, NSUInteger index);
/** <^(UIView* subView, UIView* abouveView)> */
LBDeclare UIView*      (^viewInsertSubviewAbouve)(UIView* subView, UIView* abouveView);
/** <^(UIView* toView, UIView* abouveView)> */
LBDeclare UIView*      (^viewInsertToViewAbouve)(UIView* toView, UIView* abouveView);
/** <^(UIView* subView, UIView* belowView)> */
LBDeclare UIView*      (^viewInsertSubviewBelow)(UIView* subView, UIView* belowView);
/** <^(UIView* toView, UIView* belowView)> */
LBDeclare UIView*      (^viewInsertToViewBelow)(UIView* toView, UIView* belowView);
/** <^(NSUInteger index1, NSUInteger index2)> */
LBDeclare UIView*      (^viewExchangeSubviewByIndex)(NSUInteger index1, NSUInteger index2);
/** <^(UIView* subview)> */
LBDeclare UIView*      (^viewAddSubview)(UIView* subview);
/** <^(__weak UIView* view)> */
LBDeclare UIView*      (^viewAddToView)(__weak UIView* view);
/** <^(Class clazz)> */
LBDeclare NSMutableArray*      (^viewFindSubviews)(Class clazz);
/** <^()> */
LBDeclare UIView*      (^viewSetNeedsLayout)();
/** <^()> */
LBDeclare UIView*      (^viewLayoutIfNeeded)();
/** <^()> */
LBDeclare UIView*      (^viewSetNeedsDisplay)();
#pragma mark - 常见动画部分
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
/** <^()>苹果桌面视差效果，大于iOS7系统有效 */
LBDeclare UIView*      (^viewAnimateAppleMotionEffects)() NS_DEPRECATED_IOS(2_0, 7_0, "ios more than 7.0 effective"); //
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
LBDeclare UIView*      (^viewAnimateRemove)();
/** <^()>是否正在动画 */
LBDeclare BOOL         (^viewAnimateIsDoing)();
/** <^()>暂停动画 */
LBDeclare UIView*      (^viewAnimatePause)();
/** <^()>恢复动画，在暂停动画后使用 */
LBDeclare UIView*      (^viewAnimateResume)();
/** <^()>截屏当前视图 */
LBDeclare UIImage*     (^viewSnapshot)();

#pragma mark - 辅助手动布局
/** <^(UIView* fromView)> */
LBDeclare UIView*      (^viewCopyX)(UIView* fromView);
/** <^(UIView* fromView)> */
LBDeclare UIView*      (^viewCopyY)(UIView* fromView);
/** <^(UIView* fromView)> */
LBDeclare UIView*      (^viewCopyFrame)(UIView* fromView);
/** <^(UIView* fromView)> */
LBDeclare UIView*      (^viewCopySize)(UIView* fromView);
/** <^(UIView* fromView)> */
LBDeclare UIView*      (^viewCopyOrigin)(UIView* fromView);
/** <^(UIView* fromView)> */
LBDeclare UIView*      (^viewCopyCenter)(UIView* fromView);
/** <^(UIView* fromView)> */
LBDeclare UIView*      (^viewCopyCenterX)(UIView* fromView);
/** <^(UIView* fromView)> */
LBDeclare UIView*      (^viewCopyCenterY)(UIView* fromView);
/** <^(UIView* toView, CGFloat margin)> */
LBDeclare UIView*      (^viewTopTo)(UIView* toView, CGFloat margin);
/** <^(UIView* toView, CGFloat margin)> */
LBDeclare UIView*      (^viewLeftTo)(UIView* toView, CGFloat margin);
/** <^(UIView* toView, CGFloat margin)> */
LBDeclare UIView*      (^viewBottomTo)(UIView* toView, CGFloat margin);
/** <^(UIView* toView, CGFloat margin)> */
LBDeclare UIView*      (^viewRightTo)(UIView* toView, CGFloat margin);
#pragma mark - Autolayout
/** <^()>移除所有约束以及父视图中相关约束 */
LBDeclare UIView*      (^viewRemoveConstraints)();
/** <^()>是否使用Autolayout */
LBDeclare BOOL         (^viewIsUsingAutolayout)();
#pragma mark - Autoresizing
/** <^()>是否使用Autoresizing */
LBDeclare BOOL         (^viewIsUsingAutoresizing)();
/** <^()> */
LBDeclare UIView*      (^viewRemoveAutoresizing)();
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
