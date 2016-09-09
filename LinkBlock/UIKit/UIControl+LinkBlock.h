//
//  UIControl+LinkBlock.h
//
//  Created by NOVO on 15/8/18.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject(UIControlLinkBlock)
/** <^(BOOL enable)> */
@property (nonatomic,copy,readonly) UIControl*  (^controlEnable)(BOOL enable);
/** <^(BOOL enable)> */
@property (nonatomic,copy,readonly) UIControl*  (^controlSelected)(BOOL enable);
/** <^(BOOL enable)> */
@property (nonatomic,copy,readonly) UIControl*  (^controlHighlighted)(BOOL enable);
/** <^(UIControlContentHorizontalAlignment alignment)> */
@property (nonatomic,copy,readonly) UIControl*  (^controlContentHorizontalAlignment)(UIControlContentHorizontalAlignment alignment);
/** <^(UIControlContentVerticalAlignment alignment)> */
@property (nonatomic,copy,readonly) UIControl*  (^controlContentVerticalAlignment)(UIControlContentVerticalAlignment alignment);
@end
