//
//  UIView+LinkBlock.h

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(LinkBlock)
/** <>_<>block */
@property (nonatomic,copy) UIView*      (^blockFrame)(CGFloat x,CGFloat y, CGFloat width,CGFloat height);
@property (nonatomic,copy) UIView*      (^blockX)(CGFloat x);
@property (nonatomic,copy) UIView*      (^blockY)(CGFloat y);
@property (nonatomic,copy) UIView*      (^blockOrigin)(CGFloat x,CGFloat y);
@property (nonatomic,copy) UIView*      (^blockCenterX)(CGFloat centerX);
@property (nonatomic,copy) UIView*      (^blockCenterY)(CGFloat centerY);
@property (nonatomic,copy) UIView*      (^blockCenter)(CGFloat x,CGFloat y);
@property (nonatomic,copy) UIView*      (^blockWidth)(CGFloat width);
@property (nonatomic,copy) UIView*      (^blockHeight)(CGFloat height);
@property (nonatomic,copy) UIView*      (^blockSize)(CGFloat width, CGFloat height);
@property (nonatomic,copy) UIView*      (^blockBgColor)(UIColor* color);
@property (nonatomic,copy) UIView*      (^blockBorderColor)(UIColor* color);
@property (nonatomic,copy) UIView*      (^blockBorderWidth)(CGFloat w);
@property (nonatomic,copy) UIView*      (^blockCornerRadius)(CGFloat radius);
@property (nonatomic,copy) UIView*      (^blockCornerRadiusSide)(UIRectCorner side , CGSize radius);
@property (nonatomic,copy) UIView*      (^blockMasksToBounds)(BOOL b);



@property (nonatomic,copy) BOOL         (^blockIsSubviewTo)(UIView* theView);
/** 递归此视图，找到第一响应者的控件 */
@property (nonatomic,copy) UIView*      (^blockFirstResponderSubView)();
/** 控制子控件同时触控 */
@property (nonatomic,copy) void         (^blockSubiewsExclusiveTouch)(BOOL b);

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
@property (nonatomic,copy) UIView*      (^blockRemoveSubviewTry)(UIView* view);
@property (nonatomic,copy) UIView*      (^blockRemoveAllSubview)();
@property (nonatomic,copy) UIView*      (^blockInsertSubviewAtIndex)(UIView* subView, NSUInteger index);
@property (nonatomic,copy) UIView*      (^blockExchangeSubviewByIndex)(NSUInteger index1, NSUInteger index2);
@property (nonatomic,copy) UIView*      (^blockAddSubview)(UIView* subview);
@property (nonatomic,copy) UIView*      (^blockAddToView)(UIView* view);

@end
