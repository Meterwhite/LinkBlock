//
//  UILabel+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject(UILabelLinkBlock)
/** Alignment top */
@property (nonatomic,copy) UILabel*         (^labAlignTop)();
/** Alignment bottom */
@property (nonatomic,copy) UILabel*         (^labAlignBottom)();
@property (nonatomic,copy) UILabel*         (^labAlignment)(NSTextAlignment alighment);
@property (nonatomic,copy) UILabel*         (^labNumberOfLines)(NSInteger lines);
@property (nonatomic,copy) UILabel*         (^labText)(NSString* txt);
@property (nonatomic,copy) UILabel*         (^labTextColor)(UIColor* color);
@property (nonatomic,copy) UILabel*         (^labFont)(UIFont* font);
@property (nonatomic,copy) UILabel*         (^labFontSizeSystem)(CGFloat fontSize);
@end
