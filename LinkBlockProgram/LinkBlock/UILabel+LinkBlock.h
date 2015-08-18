//
//  UILabel+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel(LinkBlock)
/** Alignment top */
@property (nonatomic,copy) UILabel*         (^blockAlignTop)();
/** Alignment bottom */
@property (nonatomic,copy) UILabel*         (^blockAlignBottom)();
@property (nonatomic,copy) UILabel*         (^blockAlignment)(NSTextAlignment alighment);
@property (nonatomic,copy) UILabel*         (^blockNumberOfLines)(NSInteger lines);
@property (nonatomic,copy) UILabel*         (^blockText)(NSString* txt);
@property (nonatomic,copy) UILabel*         (^blockTextColor)(UIColor* color);
@property (nonatomic,copy) UILabel*         (^blockFont)(UIFont* font);
@property (nonatomic,copy) UILabel*         (^blockFontSizeSystem)(CGFloat fontSize);
@end
