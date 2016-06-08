//
//  UIButton+LinkBlock.h
//
//  Created by NOVO on 15/8/19.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIButtonNew ([UIButton buttonWithType:UIButtonTypeCustom])
@interface NSObject(UIButtonLinkBlock)
@property (nonatomic,copy) UIButton* (^btnTitleEdgeInsets)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);
@property (nonatomic,copy) UIButton* (^btnImageEdgeInsets)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);
@property (nonatomic,copy) UIButton* (^btnTitle)(NSString* title, UIControlState state);
@property (nonatomic,copy) UIButton* (^btnTitleColor)(UIColor* color , UIControlState state);
@property (nonatomic,copy) UIButton* (^btnAttributeTitle)(NSAttributedString* attrStr, UIControlState state);
@property (nonatomic,copy) UIButton* (^btnImage)(UIImage* img, UIControlState state);
@property (nonatomic,copy) UIButton* (^btnBGImage)(UIImage* img, UIControlState state);
@property (nonatomic,copy) UIButton* (^btnTitleFont)(UIFont* font);
@property (nonatomic,copy) UIButton* (^btnTitleFontSystemSizeSet)(CGFloat size);
@property (nonatomic,copy) CGFloat   (^btnTitleFontSystemSizeGet)();
@end
