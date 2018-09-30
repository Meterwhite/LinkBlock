//
//  UIScrollView+LinkBlock.h
//
//  Created by NOVO on 15/8/29.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

#ifndef UIScrollViewNew
#define UIScrollViewNew ([UIScrollView new])
#endif
@interface NSObject(UIScrollViewLinkBlock)
#pragma mark - Foundation Mirror/镜像
LBDeclare UIScrollView*        (^scroll_viewContentSize)(CGFloat w , CGFloat h);
LBDeclare UIScrollView*        (^scroll_viewContentInserts)(CGFloat top , CGFloat left , CGFloat bottom , CGFloat right);
LBDeclare UIScrollView*        (^scroll_viewContentOffset)(CGFloat w , CGFloat h);
LBDeclare UIScrollView*        (^scroll_viewDelegate)(id<UIScrollViewDelegate> delegate);
LBDeclare UIScrollView*        (^scroll_viewShowsHorizontal)(BOOL b);
LBDeclare UIScrollView*        (^scroll_viewShowsVertical)(BOOL b);
LBDeclare UIScrollView*        (^scroll_viewBounce)(BOOL b);
LBDeclare UIScrollView*        (^scroll_viewPagingEnabled)(BOOL b);
LBDeclare UIScrollView*        (^scroll_viewScrollEnabled)(BOOL b);
LBDeclare UIScrollView*        (^scroll_viewDelaysContentTouches)(BOOL b);
LBDeclare UIScrollView*        (^scroll_viewCanCancelContentTouches)(BOOL b);
LBDeclare UIScrollView*        (^scroll_viewDirectionalLockEnabled)(BOOL b);
#pragma mark - Foundation Speed/速度


@end
