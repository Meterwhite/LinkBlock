//
//  UIButton+LinkBlock.h
//
//  Created by NOVO on 15/8/19.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef UIButtonNew
#define UIButtonNew ([UIButton buttonWithType:UIButtonTypeCustom])
#endif
@interface NSObject(UIButtonLinkBlock)
/** <^(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)> */
@property (nonatomic,copy,readonly) UIButton* (^btnTitleEdgeInsets)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);
/** <^(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)> */
@property (nonatomic,copy,readonly) UIButton* (^btnImageEdgeInsets)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);

#pragma mark - Title
/** <^(NSString* title, UIControlState state)> */
@property (nonatomic,copy,readonly) UIButton* (^btnTitle)(NSString* title, UIControlState state);
/** <^(NSString* title)> */
@property (nonatomic,copy,readonly) UIButton* (^btnTitleUIControlStateNormal)(NSString* title);
/** <^(NSString* title)> */
@property (nonatomic,copy,readonly) UIButton* (^btnTitleUIControlStateHighlighted)(NSString* title);
/** <^(NSString* title)> */
@property (nonatomic,copy,readonly) UIButton* (^btnTitleUIControlStateDisabled)(NSString* title);
/** <^(NSString* title)> */
@property (nonatomic,copy,readonly) UIButton* (^btnTitleUIControlStateSelected)(NSString* title);
/** <^(NSString* title)> */
@property (nonatomic,copy,readonly) UIButton* (^btnTitleUIControlStateFocused)(NSString* title);
/** <^(NSString* title)> */
@property (nonatomic,copy,readonly) UIButton* (^btnTitleUIControlStateApplication)(NSString* title);
/** <^(NSString* title)> */
@property (nonatomic,copy,readonly) UIButton* (^btnTitleUIControlStateReserved)(NSString* title);
#pragma mark - Title Color
/** <^(UIColor* color , UIControlState state)> */
@property (nonatomic,copy,readonly) UIButton* (^btnTitleColor)(UIColor* color , UIControlState state);
/** <^(UIColor* color)> */
@property (nonatomic,copy,readonly) UIButton* (^btnTitleColorUIControlStateNormal)(UIColor* color);
/** <^(UIColor* color)> */
@property (nonatomic,copy,readonly) UIButton* (^btnTitleColorUIControlStateHighlighted)(UIColor* color);
/** <^(UIColor* color)> */
@property (nonatomic,copy,readonly) UIButton* (^btnTitleColorUIControlStateDisabled)(UIColor* color);
/** <^(UIColor* color)> */
@property (nonatomic,copy,readonly) UIButton* (^btnTitleColorUIControlStateSelected)(UIColor* color);
/** <^(UIColor* color)> */
@property (nonatomic,copy,readonly) UIButton* (^btnTitleColorUIControlStateFocused)(UIColor* color);
/** <^(UIColor* color)> */
@property (nonatomic,copy,readonly) UIButton* (^btnTitleColorUIControlStateApplication)(UIColor* color);
/** <^(UIColor* color)> */
@property (nonatomic,copy,readonly) UIButton* (^btnTitleColorUIControlStateReserved)(UIColor* color);
#pragma mark - AttributedString
/** <^(NSAttributedString* attrStr, UIControlState state)> */
@property (nonatomic,copy,readonly) UIButton* (^btnAttributeTitle)(NSAttributedString* attrStr, UIControlState state);

#pragma mark - Image
/** <^(UIImage* img, UIControlState state)> */
@property (nonatomic,copy,readonly) UIButton* (^btnImage)(UIImage* img, UIControlState state);
/** <^(UIImage* img)> */
@property (nonatomic,copy,readonly) UIButton* (^btnImageUIControlStateNormal)(UIImage* img);
/** <^(UIImage* img)> */
@property (nonatomic,copy,readonly) UIButton* (^btnImageUIControlStateHighlighted)(UIImage* img);
/** <^(UIImage* img)> */
@property (nonatomic,copy,readonly) UIButton* (^btnImageUIControlStateDisabled)(UIImage* img);
/** <^(UIImage* img)> */
@property (nonatomic,copy,readonly) UIButton* (^btnImageUIControlStateSelected)(UIImage* img);
/** <^(UIImage* img)> */
@property (nonatomic,copy,readonly) UIButton* (^btnImageUIControlStateFocused)(UIImage* img);
/** <^(UIImage* img)> */
@property (nonatomic,copy,readonly) UIButton* (^btnImageUIControlStateApplication)(UIImage* img);
/** <^(UIImage* img)> */
@property (nonatomic,copy,readonly) UIButton* (^btnImageUIControlStateReserved)(UIImage* img);

#pragma mark - BG Image
/** <^(UIImage* img, UIControlState state)> */
@property (nonatomic,copy,readonly) UIButton* (^btnBGImage)(UIImage* img, UIControlState state);
/** <^(UIImage* img)> */
@property (nonatomic,copy,readonly) UIButton* (^btnBGImageUIControlStateNormal)(UIImage* img);
/** <^(UIImage* img)> */
@property (nonatomic,copy,readonly) UIButton* (^btnBGImageUIControlStateHighlighted)(UIImage* img);
/** <^(UIImage* img)> */
@property (nonatomic,copy,readonly) UIButton* (^btnBGImageUIControlStateDisabled)(UIImage* img);
/** <^(UIImage* img)> */
@property (nonatomic,copy,readonly) UIButton* (^btnBGImageUIControlStateSelected)(UIImage* img);
/** <^(UIImage* img)> */
@property (nonatomic,copy,readonly) UIButton* (^btnBGImageUIControlStateFocused)(UIImage* img);
/** <^(UIImage* img)> */
@property (nonatomic,copy,readonly) UIButton* (^btnBGImageUIControlStateApplication)(UIImage* img);
/** <^(UIImage* img)> */
@property (nonatomic,copy,readonly) UIButton* (^btnBGImageUIControlStateReserved)(UIImage* img);

/** <^(UIFont* font)> */
@property (nonatomic,copy,readonly) UIButton* (^btnTitleFont)(UIFont* font);
/** <^(CGFloat size)> */
@property (nonatomic,copy,readonly) UIButton* (^btnTitleFontSystemSizeSet)(CGFloat size);
/** <^()> */
@property (nonatomic,copy,readonly) CGFloat   (^btnTitleFontSystemSizeGet)();
@end
