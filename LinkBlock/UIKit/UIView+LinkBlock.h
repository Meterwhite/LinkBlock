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
/** 保持比例设置宽,autolayout（需要宽高约束）优先 */
@property (nonatomic,copy) UIView*      (^viewSetWidthAspect)(CGFloat width);
/** 保持比例设置高,autolayout（需要宽高约束）优先 */
@property (nonatomic,copy) UIView*      (^viewSetHeightAspect)(CGFloat height);
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
/** 是否为子视图 */
@property (nonatomic,copy) BOOL         (^viewIsSubviewTo)(UIView* theView);
/** 当前视图位于同一层的前一个视图，注意没有返回nil */
@property (nonatomic,copy) UIView*      (^viewBeforeIndexView)();
/** 当前视图位于同一层的后一个视图，注意没有返回nil */
@property (nonatomic,copy) UIView*      (^viewNextIndexView)();
/** 当前视图是否是父级别的视图 */
@property (nonatomic,copy) BOOL         (^viewIsSuperviewTo)(UIView* aView);
/** 递归此视图，找到第一响应者的的输入类型控件 */
@property (nonatomic,copy) UIView*      (^viewFirstResponderSubViewForInput)();
/** 控制子控件的并发触控 */
@property (nonatomic,copy) UIView*      (^viewSubiewsExclusiveTouch)(BOOL b);
/** 控件相对window的位置 */
@property (nonatomic,copy) CGRect       (^viewConvertRectToWindow)();
/** 更换父视图：即移动视图到另一个视图中作为子视图，参数：aView目标视图 ，isKeep是否保持当前视觉位置不变。
 PS：不考虑Autolayou */
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
/** 移除所有子控件 */
@property (nonatomic,copy) UIView*      (^viewRemoveAll)();
@property (nonatomic,copy) UIView*      (^viewInsertSubviewAtIndex)(UIView* subView, NSUInteger index);
@property (nonatomic,copy) UIView*      (^viewInsertSubviewAbouve)(UIView* subView, UIView* abouveView);
@property (nonatomic,copy) UIView*      (^viewInsertSubviewBelow)(UIView* subView, UIView* belowView);
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
#pragma mark - Autolayout
/** 移除所有约束以及父视图中相关约束 */
@property (nonatomic,copy) UIView*      (^viewRemoveConstraints)();
/** 是否使用Autolayout */
@property (nonatomic,copy) BOOL         (^viewIsUsingAutolayout)();
#pragma mark - Autoresizing
/** 是否使用Autoresizing */
@property (nonatomic,copy) BOOL         (^viewIsUsingAutoresizing)();
@property (nonatomic,copy) UIView*      (^viewRemoveAutoresizing)();
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