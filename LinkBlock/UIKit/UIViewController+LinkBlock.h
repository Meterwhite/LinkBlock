//
//  UIViewController+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/8.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIViewControllerNew ([UIViewController new])
@interface NSObject(UIViewControllerLinkBlock)
@property (nonatomic,copy) UIViewController*    (^vcAddChildVC)(UIViewController* childVC);
@property (nonatomic,copy) UIViewController*    (^vcTitle)(NSString* title);
@end
