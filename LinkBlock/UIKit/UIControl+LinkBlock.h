//
//  UIControl+LinkBlock.h
//
//  Created by NOVO on 15/8/18.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject(UIControlLinkBlock)
@property (nonatomic,copy,readonly) UIControl*       (^controlEnable)(BOOL enable);
@property (nonatomic,copy,readonly) UIControl*       (^controlSelected)(BOOL selected);
@property (nonatomic,copy,readonly) UIControl*       (^controlHighlighted)(BOOL highlighted);
@property (nonatomic,copy,readonly) UIControl*       (^controlContentHorizontalAlignment)(UIControlContentHorizontalAlignment alignment);
@property (nonatomic,copy,readonly) UIControl*       (^controlContentVerticalAlignment)(UIControlContentVerticalAlignment alignment);
@end
