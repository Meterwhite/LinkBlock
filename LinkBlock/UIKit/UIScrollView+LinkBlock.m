//
//  UIScrollView+LinkBlock.m
//
//  Created by NOVO on 15/8/29.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "UIScrollView+LinkBlock.h"
#import "LinkBlock.h"

@implementation NSObject(UIScrollViewLinkBlock)
- (UIScrollView *(^)(CGFloat, CGFloat))scroll_viewContentSize
{
    return ^(CGFloat w, CGFloat h){
        LinkError_REF_AUTO(UIScrollView, UIScrollView);
        _self.contentSize= CGSizeMake(w, h);
        return _self;
    };
}
- (void)setScroll_viewContentSize:(UIScrollView *(^)(CGFloat, CGFloat))scroll_viewContentSize{};

- (UIScrollView *(^)(CGFloat, CGFloat))scroll_viewContentOffset
{
    return ^(CGFloat x, CGFloat y){
        LinkError_REF_AUTO(UIScrollView, UIScrollView);
        _self.contentOffset= CGPointMake(x, y);
        return _self;
    };
}
- (void)setScroll_viewContentOffset:(UIScrollView *(^)(CGFloat, CGFloat))scroll_viewContentOffset{};

- (UIScrollView *(^)(CGFloat, CGFloat, CGFloat, CGFloat))scroll_viewContentInserts
{
    return ^(CGFloat top , CGFloat left , CGFloat bottom , CGFloat right){
        LinkError_REF_AUTO(UIScrollView, UIScrollView);
        _self.contentInset= UIEdgeInsetsMake(top, left, bottom, right);
        return _self;
    };
}
- (void)setScroll_viewContentInserts:(UIScrollView *(^)(CGFloat, CGFloat, CGFloat, CGFloat))scroll_viewContentInserts{};

- (UIScrollView *(^)(id<UIScrollViewDelegate>))scroll_viewDelegate
{
    return ^(id<UIScrollViewDelegate> delegate){
        LinkError_REF_AUTO(UIScrollView, UIScrollView);
        _self.delegate= delegate;
        return _self;
    };
}
- (void)setScroll_viewDelegate:(UIScrollView *(^)(id<UIScrollViewDelegate>))scroll_viewDelegate{};

- (UIScrollView *(^)(BOOL))scroll_viewShowsHorizontal
{
    return ^(BOOL b){
        LinkError_REF_AUTO(UIScrollView, UIScrollView);
        _self.showsHorizontalScrollIndicator= b;
        return _self;
    };
}
- (void)setScroll_viewShowsHorizontal:(UIScrollView *(^)(BOOL))scroll_viewShowsHorizontal{};

- (UIScrollView *(^)(BOOL))scroll_viewShowsVertical
{
    return ^(BOOL b){
        LinkError_REF_AUTO(UIScrollView, UIScrollView);
        _self.showsVerticalScrollIndicator= b;
        return _self;
    };
}
- (void)setScroll_viewShowsVertical:(UIScrollView *(^)(BOOL))scroll_viewShowsVertical{};

- (UIScrollView *(^)(BOOL))scroll_viewBounce
{
    return ^(BOOL b){
        LinkError_REF_AUTO(UIScrollView, UIScrollView);
        _self.bounces= b;
        return _self;
    };
}
- (void)setScroll_viewBounce:(UIScrollView *(^)(BOOL))scroll_viewBounce{};

- (UIScrollView *(^)(BOOL))scroll_viewScrollEnabled
{
    return ^(BOOL b){
        LinkError_REF_AUTO(UIScrollView, UIScrollView);
        _self.scrollEnabled = b;
        return _self;
    };
}
- (void)setScroll_viewScrollEnabled:(UIScrollView *(^)(BOOL))scroll_viewScrollEnabled{};
@end
