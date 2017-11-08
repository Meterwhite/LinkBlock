//
//  UIImageView+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 15/8/30.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"
#import <objc/runtime.h>

#ifndef UIImageViewNew
#define UIImageViewNew ([UIImageView new])
#endif
@interface NSObject(UIImageViewLinkBlock)
/** <^(UIImage* image)> */
LBDeclare UIImageView*         (^img_viewImage)(UIImage* image);
/** <^(UIImage* image)> */
LBDeclare UIImageView*         (^img_viewImageHighlight)(UIImage* image);
/** <^(NSString* imageStr)> */
LBDeclare UIImageView*         (^img_viewImageStr)(NSString* imageStr);
/** <^(NSString* imageStr)> */
LBDeclare UIImageView*         (^img_viewImageStrHighlight)(NSString* imageStr);
/** <^(BOOL b)> */
LBDeclare UIImageView*         (^img_viewHighlight)(BOOL b);
/** <^(NSArray<UIImage *>* imgs)> */
LBDeclare UIImageView*         (^img_viewAnimationImages)( NSArray<UIImage *>* imgs);
/** <^(NSArray<UIImage *>* imgs)> */
LBDeclare UIImageView*         (^img_viewHighlightedAnimationImages)( NSArray<UIImage *>* imgs);
@end

@interface UIImageView(UIImageViewLinkBlock)
/** 扩展触摸识别区域；如果扩展范围和其它控件重叠，应该禁用它的交互或者将本控件置于它之上； */
LBDeclare UIImageView* (^img_viewExtensionOfTouchSide)(UIEdgeInsets insets);
@end
