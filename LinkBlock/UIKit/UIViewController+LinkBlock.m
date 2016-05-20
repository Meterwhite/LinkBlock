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
    return ^(UIViewController* childVC){
        LinkError_REF_AUTO(UIViewController, UIViewController);
        [_self addChildViewController:childVC];
        return _self;
    };
}
- (void)setVcAddChildVC:(UIViewController *(^)(UIViewController *))vcAddChildVC{};

- (UIViewController *(^)(NSString *))vcTitle
{
    return ^(NSString* title){
        LinkError_REF_AUTO(UIViewController, UIViewController);
        _self.title = title;
        return _self;
    };
}
- (void)setVcTitle:(UIViewController *(^)(NSString *))vcTitle{};
@end
