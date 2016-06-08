//
//  UILabel+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UILabelNew ([UILabel new])
@interface NSObject(UILabelLinkBlock)
/** 文本顶部对齐 */
@property (nonatomic,copy) UILabel*         (^labAlignTop)();
/** 文本底部对齐 */
@property (nonatomic,copy) UILabel*         (^labAlignBottom)();
@property (nonatomic,copy) UILabel*         (^labAlignment)(NSTextAlignment alighment);
@property (nonatomic,copy) UILabel*         (^labNumberOfLines)(NSInteger lines);
@property (nonatomic,copy) UILabel*         (^labText)(NSString* txt);
@property (nonatomic,copy) UILabel*         (^labTextColor)(UIColor* color);
@property (nonatomic,copy) UILabel*         (^labFont)(UIFont* font);
@property (nonatomic,copy) CGFloat          (^labFontSystemSizeGet)();
@property (nonatomic,copy) UILabel*         (^labFontSystemSizeSet)(CGFloat fontSize);
@end
