//
//  UIView+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIViewNew ([UIView new])
@interface NSObject(UIViewLinkBlock)
@property (nonatomic,copy) BOOL         (^viewIsZeroSize)();
@property (nonatomic,copy) CGFloat      (^viewX)();
@property (nonatomic,copy) CGFloat      (^viewY)();
@property (nonatomic,copy) CGFloat      (^viewMaxX)();
@property (nonatomic,copy) CGFloat      (^viewMaxY)();
@property (nonatomic,copy) CGPoint      (^viewOrigin)();
@property (nonatomic,copy) CGFloat      (^viewCenterX)();
@property (nonatomic,copy) CGFloat      (^viewCenterY)();
@property (nonatomic,copy) CGFloat      (^viewWidth)();
@property (nonatomic,copy) CGFloat      (^viewHeight)();
@property (nonatomic,copy) CGSize       (^viewSize)();

@property (nonatomic,copy) UIView*      (^viewSetFrame)(CGFloat x,CGFloat y, CGFloat width,CGFloat height);
@property (nonatomic,copy) UIView*      (^viewSetX)(CGFloat x);
@property (nonatomic,copy) UIView*      (^viewSetY)(CGFloat y);
@property (nonatomic,copy) UIView*      (^viewSetOrigin)(CGFloat x,CGFloat y);
@property (nonatomic,copy) UIView*      (^viewSetCenterX)(CGFloat centerX);
@property (nonatomic,copy) UIView*      (^viewSetCenterY)(CGFloat centerY);
@property (nonatomic,copy) UIView*      (^viewSetCenter)(CGFloat x,CGFloat y);
@property (nonatomic,copy) UIView*      (^viewSetWidth)(CGFloat width);
@property (nonatomic,copy) UIView*      (^viewSetHeight)(CGFloat height);
@property (nonatomic,copy) UIView*      (^viewSetSize)(CGFloat width, CGFloat height);
/** 背景色 */
@property (nonatomic,copy) UIView*      (^viewBGColor)(UIColor* color);
/** 随机背景色 */
@property (nonatomic,copy) UIView*      (^viewBGColorRandom)();
@property (nonatomic,copy) UIView*      (^viewBorderColor)(UIColor* color);
@property (nonatomic,copy) UIView*      (^viewBorderWidth)(CGFloat w);
@property (nonatomic,copy) UIView*      (^viewCornerRadius)(CGFloat radius);
/** 不同方位的圆角 */
@property (nonatomic,copy) UIView*      (^viewCornerRadiusSide)(UIRectCorner side , CGSize radius);
@property (nonatomic,copy) UIView*      (^viewMasksToBounds)(BOOL b);
/** 前置视图 */
@property (nonatomic,copy) UIView*      (^viewBringFrontInView)();
/** 下沉视图 */
@property (nonatomic,copy) UIView*      (^viewSendBackInView)();

@property (nonatomic,copy) BOOL         (^viewIsSubviewTo)(UIView* theView);
/** 递归此视图，找到第一响应者的的输入类型控件 */
@property (nonatomic,copy) UIView*      (^viewFirstResponderSubViewForInput)();
/** 控制子控件的并发触控 */
@property (nonatomic,copy) UIView*      (^viewSubiewsExclusiveTouch)(BOOL b);
/** 控件相对window的位置 */
@property (nonatomic,copy) CGRect       (^viewConvertRectToWindow)();
/** 更换父视图，即移动视图到另一个视图中作为子视图，参数：aView目标视图 ，isKeep是否保持当前相对屏幕位置不变。
 注意：不考虑Autolayou */
@property (nonatomic,copy) UIView*      (^viewConvertSuperverTo)(UIView* aView , BOOL isKeep);
@property (nonatomic,copy) UIView*      (^viewUserInteractionEnabled)(BOOL b);
@property (nonatomic,copy) UIView*      (^viewMultipleTouchEnabled)(BOOL b);
@property (nonatomic,copy) UIView*      (^viewExclusiveTouch)(BOOL b);
@property (nonatomic,copy) UIView*      (^viewAutoresizingMask)(UIViewAutoresizing mask);
@property (nonatomic,copy) UIView*      (^viewClipsToBounds)(BOOL b);
@property (nonatomic,copy) UIView*      (^viewAlpha)(CGFloat alpha);
@property (nonatomic,copy) UIView*      (^viewOpaque)(CGFloat opaque);
@property (nonatomic,copy) UIView*      (^viewHidden)(BOOL hidden);
@property (nonatomic,copy) UIView*      (^viewContentMode)(UIViewContentMode contentMode);
@property (nonatomic,copy) UIView*      (^viewSubviewAt)(NSUInteger index);


@property (nonatomic,copy) UIView*      (^viewRemoveFromSuperview)();
@property (nonatomic,copy) UIView*      (^viewRemoveSubviewAt)(NSUInteger index);
/** 尝试移除一个子控件 */
@property (nonatomic,copy) UIView*      (^viewRemoveSubviewTry)(UIView* view);
@property (nonatomic,copy) UIView*      (^viewRemoveAll)();
@property (nonatomic,copy) UIView*      (^viewInsertSubviewAtIndex)(UIView* subView, NSUInteger index);
@property (nonatomic,copy) UIView*      (^viewExchangeSubviewByIndex)(NSUInteger index1, NSUInteger index2);
@property (nonatomic,copy) UIView*      (^viewAddSubview)(UIView* subview);
@property (nonatomic,copy) UIView*      (^viewAddToView)(__weak UIView* view);

#pragma mark - 常见动画部分
/** 注意：真实移动了视图的位置 */
@property (nonatomic,copy) UIView*      (^viewAnimateMoveUp)(CGFloat distance, NSTimeInterval time);
/** 注意：真实移动了视图的位置 */
@property (nonatomic,copy) UIView*      (^viewAnimateMoveDown)(CGFloat distance, NSTimeInterval time);
/** 注意：真实移动了视图的位置 */
@property (nonatomic,copy) UIView*      (^viewAnimateMoveRight)(CGFloat distance, NSTimeInterval time);
/** 注意：真实移动了视图的位置 */
@property (nonatomic,copy) UIView*      (^viewAnimateMoveLeft)(CGFloat distance, NSTimeInterval time);
/** 水平摇晃 */
@property (nonatomic,copy) UIView*      (^viewAnimateShakeHorizental)(double duration);
/** 垂直摇晃 */
@property (nonatomic,copy) UIView*      (^viewAnimateShakeVertical)(double duration);
/** 苹果桌面视差效果，大于iOS7系统有效 */
@property (nonatomic,copy) UIView*      (^viewAnimateAppleMotionEffects)() NS_DEPRECATED_IOS(2_0, 7_0, "ios more than 7.0 effective"); //
/** 脉冲形式的放大缩小 */
@property (nonatomic,copy) UIView*      (^viewAnimatePulse)(CGFloat scale,NSTimeInterval duration,BOOL repeat);
/** 翻转动画 */
@property (nonatomic,copy) UIView*      (^viewAnimateFlipFromTop)(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse);
/** 翻转动画 */
@property (nonatomic,copy) UIView*      (^viewAnimateFlipFromBotton)(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse);
/** 翻转动画 */
@property (nonatomic,copy) UIView*      (^viewAnimateFlipFromRight)(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse);
/** 翻转动画 */
@property (nonatomic,copy) UIView*      (^viewAnimateFlipFromLeft)(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse);
/** 
 *  旋转动画
 *  angle：end angle of the rotation. Pass M_PI * 2.0 for full circle rotation.
 */
@property (nonatomic,copy) UIView*      (^viewAnimateRotateToRight)(CGFloat angle,NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse);
/** 旋转动画 */
@property (nonatomic,copy) UIView*      (^viewAnimateRotateToLeft)(CGFloat angle,NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse);
/** 移除所有动画 */
@property (nonatomic,copy) UIView*      (^viewAnimateRemove)();
/** 是否正在动画 */
@property (nonatomic,copy) BOOL         (^viewAnimateIsDoing)();
/** 暂停动画 */
@property (nonatomic,copy) UIView*      (^viewAnimatePause)();
/** 恢复动画，在暂停动画后使用 */
@property (nonatomic,copy) UIView*      (^viewAnimateResume)();
/** 截屏当前视图 */
@property (nonatomic,copy) UIImage*     (^viewSnapshot)();

#pragma mark - 辅助手动布局
@property (nonatomic,copy) UIView*      (^viewCopyX)(UIView* fromView);
@property (nonatomic,copy) UIView*      (^viewCopyY)(UIView* fromView);
@property (nonatomic,copy) UIView*      (^viewCopyFrame)(UIView* fromView);
@property (nonatomic,copy) UIView*      (^viewCopySize)(UIView* fromView);
@property (nonatomic,copy) UIView*      (^viewCopyOrigin)(UIView* fromView);
@property (nonatomic,copy) UIView*      (^viewCopyCenter)(UIView* fromView);
@property (nonatomic,copy) UIView*      (^viewCopyCenterX)(UIView* fromView);
@property (nonatomic,copy) UIView*      (^viewCopyCenterY)(UIView* fromView);
@property (nonatomic,copy) UIView*      (^viewTopTo)(UIView* toView, CGFloat margin);
@property (nonatomic,copy) UIView*      (^viewLeftTo)(UIView* toView, CGFloat margin);
@property (nonatomic,copy) UIView*      (^viewBottomTo)(UIView* toView, CGFloat margin);
@property (nonatomic,copy) UIView*      (^viewRightTo)(UIView* toView, CGFloat margin);

@end

@interface UIView (UIViewLinkBlock)
#pragma mark - 测试
- (UIButton*)viewAddTestBtn:(CGRect)frame block:(void(^)(NSInteger idx, UIButton* testButton))block;

@end