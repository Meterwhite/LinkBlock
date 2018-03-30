//
//  UIViewController+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/8.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(UIViewControllerLinkBlock)

- (UIViewController *(^)(UIViewController *))vcAddChildVC
{
    return ^id(UIViewController* childVC){
        LinkHandle_REF(UIViewController)
        LinkGroupHandle_REF(vcAddChildVC,childVC)
        [_self addChildViewController:childVC];
        return _self;
    };
}

- (UIViewController *(^)(NSString *))vcTitle
{
    return ^id(NSString* title){
        LinkHandle_REF(UIViewController)
        LinkGroupHandle_REF(vcTitle,title)
        _self.title = title;
        return _self;
    };
}

- (UIViewController *(^)(UIViewController *))vcNavigationControllerPushVC
{
    return ^id(UIViewController* vc){
        LinkHandle_REF(UIViewController)
        LinkGroupHandle_REF(vcNavigationControllerPushVC,vc)
        [_self.navigationController pushViewController:vc animated:YES];
        return _self;
    };
}

- (UIViewController *(^)(UIViewController *))vcNavigationControllerPopTo
{
    return ^id(UIViewController* vc){
        LinkHandle_REF(UIViewController)
        LinkGroupHandle_REF(vcNavigationControllerPopTo,vc)
        [_self.navigationController popToViewController:vc animated:YES];
        return _self;
    };
}

- (UIViewController *(^)(void))vcNavigationControllerPop
{
    return ^id(){
        LinkHandle_REF(UIViewController)
        LinkGroupHandle_REF(vcNavigationControllerPop)
        [_self.navigationController popViewControllerAnimated:YES];
        return _self;
    };
}

- (UIViewController *(^)(BOOL))vcHidesBottomBarWhenPushed
{
    return ^id(BOOL b){
        LinkHandle_REF(UIViewController)
        LinkGroupHandle_REF(vcHidesBottomBarWhenPushed,b)
        _self.hidesBottomBarWhenPushed = b;
        return _self;
    };
}

- (UIViewController *(^)(void))vcHidesBottomBarWhenPushedYES
{
    return ^id(){
        LinkHandle_REF(UIViewController)
        LinkGroupHandle_REF(vcHidesBottomBarWhenPushedYES)
        _self.hidesBottomBarWhenPushed = YES;
        return _self;
    };
}

- (UIViewController *(^)(UIView *))vcViewAddSubview
{
    return ^id(UIView *view){
        LinkHandle_REF(UIViewController)
        LinkGroupHandle_REF(vcViewAddSubview,view)
        [_self.view addSubview:view];
        return _self;
    };
}
@end
