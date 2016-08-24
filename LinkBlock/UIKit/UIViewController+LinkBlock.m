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
        LinkHandle_REF(UIViewController, UIViewController)
        LinkGroupHandle_REF(vcAddChildVC,childVC)
        [_self addChildViewController:childVC];
        return _self;
    };
}

- (UIViewController *(^)(NSString *))vcTitle
{
    return ^id(NSString* title){
        LinkHandle_REF(UIViewController, UIViewController)
        LinkGroupHandle_REF(vcTitle,title)
        _self.title = title;
        return _self;
    };
}

@end
