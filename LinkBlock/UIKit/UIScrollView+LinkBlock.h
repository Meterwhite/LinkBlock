//
//  UIScrollView+LinkBlock.h
//
//  Created by NOVO on 15/8/29.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject(UIScrollViewLinkBlock)
@property (nonatomic,copy) UIScrollView*        (^scroll_viewContentSize)(CGFloat w , CGFloat h);
@property (nonatomic,copy) UIScrollView*        (^scroll_viewContentInserts)(CGFloat top , CGFloat left , CGFloat bottom , CGFloat right);
@property (nonatomic,copy) UIScrollView*        (^scroll_viewContentOffset)(CGFloat w , CGFloat h);
@property (nonatomic,copy) UIScrollView*        (^scroll_viewDelegate)(id<UIScrollViewDelegate> delegate);

@property (nonatomic,copy) UIScrollView*        (^scroll_viewShowsHorizontal)(BOOL b);
@property (nonatomic,copy) UIScrollView*        (^scroll_viewShowsVertical)(BOOL b);
@property (nonatomic,copy) UIScrollView*        (^scroll_viewBounce)(BOOL b);
@property (nonatomic,copy) UIScrollView*        (^scroll_viewScrollEnabled)(BOOL b);

@end
