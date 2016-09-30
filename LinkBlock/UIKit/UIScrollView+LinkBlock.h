//
//  UIScrollView+LinkBlock.h
//
//  Created by NOVO on 15/8/29.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef UIScrollViewNew
#define UIScrollViewNew ([UIScrollView new])
#endif
@interface NSObject(UIScrollViewLinkBlock)
/** <^(CGFloat w , CGFloat h)> */
@property (nonatomic,copy,readonly) UIScrollView*        (^scroll_viewContentSize)(CGFloat w , CGFloat h);
/** <^(CGFloat top , CGFloat left , CGFloat bottom , CGFloat right)> */
@property (nonatomic,copy,readonly) UIScrollView*        (^scroll_viewContentInserts)(CGFloat top , CGFloat left , CGFloat bottom , CGFloat right);
/** <^(CGFloat w , CGFloat h)> */
@property (nonatomic,copy,readonly) UIScrollView*        (^scroll_viewContentOffset)(CGFloat w , CGFloat h);
/** <^(id<UIScrollViewDelegate> delegate)> */
@property (nonatomic,copy,readonly) UIScrollView*        (^scroll_viewDelegate)(id<UIScrollViewDelegate> delegate);
/** <^(BOOL b)> */
@property (nonatomic,copy,readonly) UIScrollView*        (^scroll_viewShowsHorizontal)(BOOL b);
/** <^(BOOL b)> */
@property (nonatomic,copy,readonly) UIScrollView*        (^scroll_viewShowsVertical)(BOOL b);
/** <^(BOOL b)> */
@property (nonatomic,copy,readonly) UIScrollView*        (^scroll_viewBounce)(BOOL b);
/** <^(BOOL b)> */
@property (nonatomic,copy,readonly) UIScrollView*        (^scroll_viewPagingEnabled)(BOOL b);
/** <^(BOOL b)> */
@property (nonatomic,copy,readonly) UIScrollView*        (^scroll_viewScrollEnabled)(BOOL b);
/** <^(BOOL b)> */
@property (nonatomic,copy,readonly) UIScrollView*        (^scroll_viewDelaysContentTouches)(BOOL b);
/** <^(BOOL b)> */
@property (nonatomic,copy,readonly) UIScrollView*        (^scroll_viewCanCancelContentTouches)(BOOL b);
/** <^(BOOL b)>锁定单一滚动方向 */
@property (nonatomic,copy,readonly) UIScrollView*        (^scroll_viewDirectionalLockEnabled)(BOOL b);
@end
