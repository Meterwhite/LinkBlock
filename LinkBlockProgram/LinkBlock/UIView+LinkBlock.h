//
//  UIView+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(LinkBlock)
@property (nonatomic,copy) CGFloat      (^blockXGet)();
@property (nonatomic,copy) CGFloat      (^blockYGet)();
@property (nonatomic,copy) CGPoint      (^blockOriginGet)();
@property (nonatomic,copy) CGFloat      (^blockCenterXGet)();
@property (nonatomic,copy) CGFloat      (^blockCenterYGet)();
@property (nonatomic,copy) CGFloat      (^blockWidthGet)();
@property (nonatomic,copy) CGFloat      (^blockHeightGet)();
@property (nonatomic,copy) CGSize       (^blockSizeGet)();

@property (nonatomic,copy) UIView*      (^blockFrameSet)(CGFloat x,CGFloat y, CGFloat width,CGFloat height);
@property (nonatomic,copy) UIView*      (^blockXSet)(CGFloat x);
@property (nonatomic,copy) UIView*      (^blockYSet)(CGFloat y);
@property (nonatomic,copy) UIView*      (^blockOriginSet)(CGFloat x,CGFloat y);
@property (nonatomic,copy) UIView*      (^blockCenterXSet)(CGFloat centerX);
@property (nonatomic,copy) UIView*      (^blockCenterYSet)(CGFloat centerY);
@property (nonatomic,copy) UIView*      (^blockCenterSet)(CGFloat x,CGFloat y);
@property (nonatomic,copy) UIView*      (^blockWidthSet)(CGFloat width);
@property (nonatomic,copy) UIView*      (^blockHeightSet)(CGFloat height);
@property (nonatomic,copy) UIView*      (^blockSizeSet)(CGFloat width, CGFloat height);
@property (nonatomic,copy) UIView*      (^blockBGColor)(UIColor* color);
@property (nonatomic,copy) UIView*      (^blockBorderColor)(UIColor* color);
@property (nonatomic,copy) UIView*      (^blockBorderWidth)(CGFloat w);
@property (nonatomic,copy) UIView*      (^blockCornerRadius)(CGFloat radius);
/** 不同方位的圆角 */
/** The rounded corners of different orientation  */
@property (nonatomic,copy) UIView*      (^blockCornerRadiusSide)(UIRectCorner side , CGSize radius);
@property (nonatomic,copy) UIView*      (^blockMasksToBounds)(BOOL b);



@property (nonatomic,copy) BOOL         (^blockIsSubviewTo)(UIView* theView);
/** 递归此视图，找到第一响应者的的输入类型控件 */
/** Recursive this view ，find first responder input type control */
@property (nonatomic,copy) UIView*      (^blockFirstResponderInputSubView)();
/** 控制子控件的并发触控 */
/** Concurrent touch control subviews  */
@property (nonatomic,copy) void         (^blockSubiewsExclusiveTouch)(BOOL b);
/** 控件相对window的位置 */
/** The location of the control relative to the window  */
@property (nonatomic,copy) CGRect       (^blockConvertRectToWindow)();
@property (nonatomic,copy) UIView*      (^blockUserInteractionEnabled)(BOOL b);
@property (nonatomic,copy) UIView*      (^blockMultipleTouchEnabled)(BOOL b);
@property (nonatomic,copy) UIView*      (^blockExclusiveTouch)(BOOL b);
@property (nonatomic,copy) UIView*      (^blockAutoresizingMask)(UIViewAutoresizing mask);
@property (nonatomic,copy) UIView*      (^blockClipsToBounds)(BOOL b);
@property (nonatomic,copy) UIView*      (^blockAlpha)(CGFloat alpha);
@property (nonatomic,copy) UIView*      (^blockOpaque)(CGFloat opaque);
@property (nonatomic,copy) UIView*      (^blockHidden)(BOOL hidden);
@property (nonatomic,copy) UIView*      (^blockContentMode)(UIViewContentMode contentMode);
@property (nonatomic,copy) UIView*      (^blockSuperview)();
@property (nonatomic,copy) NSArray*     (^blockSubviews)();
@property (nonatomic,copy) UIView*      (^blockSubviewAtIndex)(NSUInteger index);
@property (nonatomic,copy) UIWindow*    (^blockWindow)();

@property (nonatomic,copy) UIView*      (^blockRemoveFromSuperview)();
@property (nonatomic,copy) UIView*      (^blockRemoveSubviewAtIndex)(NSUInteger index);
/** 尝试移除一个子控件 */
/** Try to remove a subview  */
@property (nonatomic,copy) UIView*      (^blockRemoveSubviewTry)(UIView* view);
@property (nonatomic,copy) UIView*      (^blockRemoveAllSubview)();
@property (nonatomic,copy) UIView*      (^blockInsertSubviewAtIndex)(UIView* subView, NSUInteger index);
@property (nonatomic,copy) UIView*      (^blockExchangeSubviewByIndex)(NSUInteger index1, NSUInteger index2);
@property (nonatomic,copy) UIView*      (^blockAddSubview)(UIView* subview);
@property (nonatomic,copy) UIView*      (^blockAddToView)(UIView* view);

@end
