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
/** <^(UIViewController* childVC)> */
LBDeclare UIViewController*    (^vcAddChildVC)(UIViewController* childVC);
/** <^(NSString* title)> */
LBDeclare UIViewController*    (^vcTitle)(NSString* title);
/** <^(UIViewController* vc)>push控制器 动画YES */
LBDeclare UIViewController*    (^vcNavigationControllerPushVC)(UIViewController* vc);
@end
