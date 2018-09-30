//
//  UIViewController+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/8.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

#ifndef UIViewControllerNew
#define UIViewControllerNew ([UIViewController new])
#endif
@interface NSObject(UIViewControllerLinkBlock)

#pragma mark - Foundation Mirror/镜像
LBDeclare UIViewController*    (^vcAddChildVC)(UIViewController* childVC);
LBDeclare UIViewController*    (^vcTitle)(NSString* title);
LBDeclare UIViewController*    (^vcNavigationControllerPushVC)(UIViewController* vc);
LBDeclare UIViewController*    (^vcNavigationControllerPopTo)(UIViewController* vc);
LBDeclare UIViewController*    (^vcNavigationControllerPop)(void);
LBDeclare UIViewController*    (^vcHidesBottomBarWhenPushed)(BOOL b);
LBDeclare UIViewController*    (^vcHidesBottomBarWhenPushedYES)(void);

#pragma mark - Foundation Speed/速度
LBDeclare UIViewController*    (^vcViewAddSubview)(UIView* view);

@end
