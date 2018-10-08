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

#pragma mark - Foundation Mirror/镜像
@property LB_BK UIImageView*         (^img_viewImage)(UIImage* image);
@property LB_BK UIImageView*         (^img_viewImageHighlight)(UIImage* image);
@property LB_BK UIImageView*         (^img_viewImageStrHighlight)(NSString* imageStr);
@property LB_BK UIImageView*         (^img_viewHighlight)(BOOL b);
@property LB_BK UIImageView*         (^img_viewAnimationImages)( NSArray<UIImage *>* imgs);
@property LB_BK UIImageView*         (^img_viewHighlightedAnimationImages)( NSArray<UIImage *>* imgs);
#pragma mark - Foundation Speed/速度
/** set image */
@property LB_BK UIImageView*         (^img_viewImageWithName)(NSString* imageStr);


@end

@interface UIImageView(UIImageViewLinkBlock)
/** 扩展触摸识别区域；如果扩展范围和其它控件重叠，应该禁用它的交互或者将本控件置于它之上； */
@property LB_BK UIImageView* (^img_viewExtensionOfTouchSide)(UIEdgeInsets insets);

/** 扩展出没识别区域；rects内是参考自身坐标系的相对位置 */
@property LB_BK UIImageView* (^img_viewExtensionOfTouchRects)(NSArray<NSString*>* rects);
@end
