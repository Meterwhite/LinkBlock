//
//  UIView+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIViewNew ([UIView new])
@interface NSObject(UIViewLinkBlock)
@property (nonatomic,copy,readonly) BOOL         (^viewIsZeroSize)();
@property (nonatomic,copy,readonly) CGFloat      (^viewX)();
@property (nonatomic,copy,readonly) CGFloat      (^viewY)();
@property (nonatomic,copy,readonly) CGFloat      (^viewMaxX)();
@property (nonatomic,copy,readonly) CGFloat      (^viewMaxY)();
@property (nonatomic,copy,readonly) CGPoint      (^viewOrigin)();
@property (nonatomic,copy,readonly) CGFloat      (^viewCenterX)();
@property (nonatomic,copy,readonly) CGFloat      (^viewCenterY)();
@property (nonatomic,copy,readonly) CGFloat      (^viewWidth)();
@property (nonatomic,copy,readonly) CGFloat      (^viewHeight)();
@property (nonatomic,copy,readonly) CGSize       (^viewSize)();

@property (nonatomic,copy,readonly) UIView*      (^viewSetFrame)(CGFloat x,CGFloat y, CGFloat width,CGFloat height);
@property (nonatomic,copy,readonly) UIView*      (^viewSetX)(CGFloat x);
@property (nonatomic,copy,readonly) UIView*      (^viewSetY)(CGFloat y);
@property (nonatomic,copy,readonly) UIView*      (^viewSetOrigin)(CGFloat x,CGFloat y);
@property (nonatomic,copy,readonly) UIView*      (^viewSetCenterX)(CGFloat centerX);
@property (nonatomic,copy,readonly) UIView*      (^viewSetCenterY)(CGFloat centerY);
@property (nonatomic,copy,readonly) UIView*      (^viewSetCenter)(CGFloat x,CGFloat y);
@property (nonatomic,copy,readonly) UIView*      (^viewSetWidth)(CGFloat width);
@property (nonatomic,copy,readonly) UIView*      (^viewSetHeight)(CGFloat height);
/** 保持比例设置宽,autolayout（需要宽高约束）优先 */
@property (nonatomic,copy,readonly) UIView*      (^viewSetWidthAspect)(CGFloat width);
/** 保持比例设置高,autolayout（需要宽高约束）优先 */
@property (nonatomic,copy,readonly) UIView*      (^viewSetHeightAspect)(CGFloat height);
@property (nonatomic,copy,readonly) UIView*      (^viewSetSize)(CGFloat width, CGFloat height);
/** 背景色 */
@property (nonatomic,copy,readonly) UIView*      (^viewBGColor)(UIColor* color);
/** 随机背景色 */
@property (nonatomic,copy,readonly) UIView*      (^viewBGColorRandom)();
@property (nonatomic,copy,readonly) UIView*      (^viewBorderColor)(UIColor* color);
@property (nonatomic,copy,readonly) UIView*      (^viewBorderWidth)(CGFloat w);
/** view.layer.cornerRadius */
@property (nonatomic,copy,readonly) UIView*      (^viewCornerRadius)(CGFloat radius);
/** 方位组合的圆角 */
@property (nonatomic,copy,readonly) UIView*      (^viewCornerRadiusSide)(UIRectCorner side , CGSize radius);
/** view.layer.masksToBounds */
@property (nonatomic,copy,readonly) UIView*      (^viewMasksToBounds)(BOOL b);
@property (nonatomic,copy,readonly) UIView*      (^viewClipsToBounds)(BOOL b);
@property (nonatomic,copy,readonly) UIView*      (^viewEndEditing)(BOOL force);
@property (nonatomic,copy,readonly) UIView*      (^viewBecomeFirstResponder)();
@property (nonatomic,copy,readonly) UIView*      (^viewResignFirstResponder)();
@property (nonatomic,copy,readonly) BOOL         (^viewIsFirstResponder)();
/** 递归此视图，找到第一响应者的的输入类型控件 */
@property (nonatomic,copy,readonly) UIView*      (^viewFirstResponderSubViewForInput)();
/** 前置视图 */
@property (nonatomic,copy,readonly) UIView*      (^viewBringFrontInView)();
/** 下沉视图 */
@property (nonatomic,copy,readonly) UIView*      (^viewSendBackInView)();
/** 是否为子视图，包括多层次的子视图 */
@property (nonatomic,copy,readonly) BOOL         (^viewIsSubviewTo)(UIView* theView);
/** 当前视图位于同一层的前一个视图，没有则返回nil */
@property (nonatomic,copy,readonly) UIView*      (^viewBeforeIndexView)();
/** 当前视图位于同一层的后一个视图，没有则返回nil */
@property (nonatomic,copy,readonly) UIView*      (^viewNextIndexView)();
/** 当前视图是否是父级别的视图 */
@property (nonatomic,copy,readonly) BOOL         (^viewIsSuperviewTo)(UIView* aView);
/** 控制子控件的并发触控 */
@property (nonatomic,copy,readonly) UIView*      (^viewSubiewsExclusiveTouch)(BOOL b);
/** 控件相对window的位置 */
@property (nonatomic,copy,readonly) CGRect       (^viewConvertRectToWindow)();
/** 更换父视图：即移动视图到另一个视图中作为子视图，参数：aView目标视图 ，isKeep是否保持当前视觉位置不变。
 PS：不考虑Autolayou */
@property (nonatomic,copy,readonly) UIView*      (^viewConvertSuperverTo)(UIView* aView , BOOL isKeep);
@property (nonatomic,copy,readonly) UIView*      (^viewUserInteractionEnabled)(BOOL b);
@property (nonatomic,copy,readonly) UIView*      (^viewMultipleTouchEnabled)(BOOL b);
@property (nonatomic,copy,readonly) UIView*      (^viewExclusiveTouch)(BOOL b);
@property (nonatomic,copy,readonly) UIView*      (^viewAutoresizingMask)(UIViewAutoresizing mask);
@property (nonatomic,copy,readonly) UIView*      (^viewAlpha)(CGFloat alpha);
@property (nonatomic,copy,readonly) UIView*      (^viewOpaque)(CGFloat opaque);
@property (nonatomic,copy,readonly) UIView*      (^viewHidden)(BOOL hidden);
@property (nonatomic,copy,readonly) UIView*      (^viewContentMode)(UIViewContentMode contentMode);
@property (nonatomic,copy,readonly) UIView*      (^viewSubviewAt)(NSUInteger index);


@property (nonatomic,copy,readonly) UIView*      (^viewRemoveFromSuperview)();
@property (nonatomic,copy,readonly) UIView*      (^viewRemoveSubviewAt)(NSUInteger index);
/** 尝试移除一个子控件 */
@property (nonatomic,copy,readonly) UIView*      (^viewRemoveSubviewTry)(UIView* view);
/** 移除所有子控件 */
@property (nonatomic,copy,readonly) UIView*      (^viewRemoveAll)();
@property (nonatomic,copy,readonly) UIView*      (^viewInsertSubviewAtIndex)(UIView* subView, NSUInteger index);
@property (nonatomic,copy,readonly) UIView*      (^viewInsertSubviewAbouve)(UIView* subView, UIView* abouveView);
@property (nonatomic,copy,readonly) UIView*      (^viewInsertSubviewBelow)(UIView* subView, UIView* belowView);
@property (nonatomic,copy,readonly) UIView*      (^viewExchangeSubviewByIndex)(NSUInteger index1, NSUInteger index2);
@property (nonatomic,copy,readonly) UIView*      (^viewAddSubview)(UIView* subview);
@property (nonatomic,copy,readonly) UIView*      (^viewAddToView)(__weak UIView* view);
@property (nonatomic,copy,readonly) UIView*      (^viewSetNeedsLayout)();
@property (nonatomic,copy,readonly) UIView*      (^viewLayoutIfNeeded)();
@property (nonatomic,copy,readonly) UIView*      (^viewSetNeedsDisplay)();
#pragma mark - 常见动画部分
/** 注意：真实移动了视图的位置 */
@property (nonatomic,copy,readonly) UIView*      (^viewAnimateMoveUp)(CGFloat distance, NSTimeInterval time);
/** 注意：真实移动了视图的位置 */
@property (nonatomic,copy,readonly) UIView*      (^viewAnimateMoveDown)(CGFloat distance, NSTimeInterval time);
/** 注意：真实移动了视图的位置 */
@property (nonatomic,copy,readonly) UIView*      (^viewAnimateMoveRight)(CGFloat distance, NSTimeInterval time);
/** 注意：真实移动了视图的位置 */
@property (nonatomic,copy,readonly) UIView*      (^viewAnimateMoveLeft)(CGFloat distance, NSTimeInterval time);
/** 水平摇晃 */
@property (nonatomic,copy,readonly) UIView*      (^viewAnimateShakeHorizental)(double duration);
/** 垂直摇晃 */
@property (nonatomic,copy,readonly) UIView*      (^viewAnimateShakeVertical)(double duration);
/** 苹果桌面视差效果，大于iOS7系统有效 */
@property (nonatomic,copy,readonly) UIView*      (^viewAnimateAppleMotionEffects)() NS_DEPRECATED_IOS(2_0, 7_0, "ios more than 7.0 effective"); //
/** 脉冲形式的放大缩小 */
@property (nonatomic,copy,readonly) UIView*      (^viewAnimatePulse)(CGFloat scale,NSTimeInterval duration,BOOL repeat);
/** 翻转动画 */
@property (nonatomic,copy,readonly) UIView*      (^viewAnimateFlipFromTop)(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse);
/** 翻转动画 */
@property (nonatomic,copy,readonly) UIView*      (^viewAnimateFlipFromBotton)(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse);
/** 翻转动画 */
@property (nonatomic,copy,readonly) UIView*      (^viewAnimateFlipFromRight)(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse);
/** 翻转动画 */
@property (nonatomic,copy,readonly) UIView*      (^viewAnimateFlipFromLeft)(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse);
/** 
 *  旋转动画
 *  angle：end angle of the rotation. Pass M_PI * 2.0 for full circle rotation.
 */
@property (nonatomic,copy,readonly) UIView*      (^viewAnimateRotateToRight)(CGFloat angle,NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse);
/** 旋转动画 */
@property (nonatomic,copy,readonly) UIView*      (^viewAnimateRotateToLeft)(CGFloat angle,NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse);
/** 移除所有动画 */
@property (nonatomic,copy,readonly) UIView*      (^viewAnimateRemove)();
/** 是否正在动画 */
@property (nonatomic,copy,readonly) BOOL         (^viewAnimateIsDoing)();
/** 暂停动画 */
@property (nonatomic,copy,readonly) UIView*      (^viewAnimatePause)();
/** 恢复动画，在暂停动画后使用 */
@property (nonatomic,copy,readonly) UIView*      (^viewAnimateResume)();
/** 截屏当前视图 */
@property (nonatomic,copy,readonly) UIImage*     (^viewSnapshot)();

#pragma mark - 辅助手动布局
@property (nonatomic,copy,readonly) UIView*      (^viewCopyX)(UIView* fromView);
@property (nonatomic,copy,readonly) UIView*      (^viewCopyY)(UIView* fromView);
@property (nonatomic,copy,readonly) UIView*      (^viewCopyFrame)(UIView* fromView);
@property (nonatomic,copy,readonly) UIView*      (^viewCopySize)(UIView* fromView);
@property (nonatomic,copy,readonly) UIView*      (^viewCopyOrigin)(UIView* fromView);
@property (nonatomic,copy,readonly) UIView*      (^viewCopyCenter)(UIView* fromView);
@property (nonatomic,copy,readonly) UIView*      (^viewCopyCenterX)(UIView* fromView);
@property (nonatomic,copy,readonly) UIView*      (^viewCopyCenterY)(UIView* fromView);
@property (nonatomic,copy,readonly) UIView*      (^viewTopTo)(UIView* toView, CGFloat margin);
@property (nonatomic,copy,readonly) UIView*      (^viewLeftTo)(UIView* toView, CGFloat margin);
@property (nonatomic,copy,readonly) UIView*      (^viewBottomTo)(UIView* toView, CGFloat margin);
@property (nonatomic,copy,readonly) UIView*      (^viewRightTo)(UIView* toView, CGFloat margin);
#pragma mark - Autolayout
/** 移除所有约束以及父视图中相关约束 */
@property (nonatomic,copy,readonly) UIView*      (^viewRemoveConstraints)();
/** 是否使用Autolayout */
@property (nonatomic,copy,readonly) BOOL         (^viewIsUsingAutolayout)();
#pragma mark - Autoresizing
/** 是否使用Autoresizing */
@property (nonatomic,copy,readonly) BOOL         (^viewIsUsingAutoresizing)();
@property (nonatomic,copy,readonly) UIView*      (^viewRemoveAutoresizing)();
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