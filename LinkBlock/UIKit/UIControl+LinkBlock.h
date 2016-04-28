//
//  UIControl+LinkBlock.h
//
//  Created by NOVO on 15/8/18.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject(UIControlLinkBlock)
@property (nonatomic,copy) UIControl*       (^controlEnable)(BOOL enable);
@property (nonatomic,copy) UIControl*       (^controlSelected)(BOOL selected);
@property (nonatomic,copy) UIControl*       (^controlHighlighted)(BOOL highlighted);
@property (nonatomic,copy) UIControl*       (^controlContentHorizontalAlignment)(UIControlContentHorizontalAlignment alignment);
@property (nonatomic,copy) UIControl*       (^controlContentVerticalAlignment)(UIControlContentVerticalAlignment alignment);
@end
