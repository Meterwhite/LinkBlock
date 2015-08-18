//
//  UIButton+LinkBlock.h
//
//  Created by NOVO on 15/8/19.
//  Copyright (c) 2015年 QuXingYi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton(LinkBlock)
@property (nonatomic,copy) UIButton* (^blockTitleEdgeInsets)(CGFloat top, CGFloat left, CGFloat botton, CGFloat right);
@property (nonatomic,copy) UIButton* (^blockImageEdgeInsets)(CGFloat top, CGFloat left, CGFloat botton, CGFloat right);
@property (nonatomic,copy) UIButton* (^blockTitleSet)(NSString* title, UIControlState state);
@property (nonatomic,copy) UIButton* (^blockAttributeTitleSet)(NSAttributedString* attrStr, UIControlState state);
@property (nonatomic,copy) UIButton* (^blockImageSet)(UIImage* img, UIControlState state);
@property (nonatomic,copy) UIButton* (^blockBGImageSet)(UIImage* img, UIControlState state);
@property (nonatomic,copy) UIButton* (^blockTitleFontSet)(UIFont* font);
@property (nonatomic,copy) UIButton* (^blockTitleFontSizeSet)(CGFloat size);
@end
