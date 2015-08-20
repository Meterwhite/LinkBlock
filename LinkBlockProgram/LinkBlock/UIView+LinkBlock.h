//
//  UIView+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject(UIViewLinkBlock)
@property (nonatomic,copy) CGFloat      (^viewX)();
@property (nonatomic,copy) CGFloat      (^viewY)();
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

@property (nonatomic,copy) UIView*      (^viewBGColor)(UIColor* color);
@property (nonatomic,copy) UIView*      (^viewBorderColor)(UIColor* color);
@property (nonatomic,copy) UIView*      (^viewBorderWidth)(CGFloat w);
@property (nonatomic,copy) UIView*      (^viewCornerRadius)(CGFloat radius);
/** 不同方位的圆角 */
/** The rounded corners of different orientation  */
@property (nonatomic,copy) UIView*      (^viewCornerRadiusSide)(UIRectCorner side , CGSize radius);
@property (nonatomic,copy) UIView*      (^viewMasksToBounds)(BOOL b);



@property (nonatomic,copy) BOOL         (^viewIsSubviewTo)(UIView* theView);
/** 递归此视图，找到第一响应者的的输入类型控件 */
/** Recursive this view ，find first responder input type control */
@property (nonatomic,copy) UIView*      (^viewFirstResponderSubViewForInput)();
/** 控制子控件的并发触控 */
/** Concurrent touch control subviews  */
@property (nonatomic,copy) UIView*      (^viewSubiewsExclusiveTouch)(BOOL b);
/** 控件相对window的位置 */
/** The location of the control relative to the window  */
@property (nonatomic,copy) CGRect       (^viewConvertRectToWindow)();
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
/** Try to remove a subview  */
@property (nonatomic,copy) UIView*      (^viewRemoveSubviewTry)(UIView* view);
@property (nonatomic,copy) UIView*      (^viewRemoveAll)();
@property (nonatomic,copy) UIView*      (^viewInsertSubviewAtIndex)(UIView* subView, NSUInteger index);
@property (nonatomic,copy) UIView*      (^viewExchangeSubviewByIndex)(NSUInteger index1, NSUInteger index2);
@property (nonatomic,copy) UIView*      (^viewAddSubview)(UIView* subview);
@property (nonatomic,copy) UIView*      (^viewAddToView)(UIView* view);

@end
