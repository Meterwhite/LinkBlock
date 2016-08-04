//
//  UILabel+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UILabelNew ([UILabel new])
@interface NSObject(UILabelLinkBlock)
/** 即时的文本顶部对齐 */
@property (nonatomic,copy,readonly) UILabel*         (^labAlignTop)();
/** 即时的文本底部对齐 */
@property (nonatomic,copy,readonly) UILabel*         (^labAlignBottom)();
@property (nonatomic,copy,readonly) UILabel*         (^labAlignment)(NSTextAlignment alighment);
@property (nonatomic,copy,readonly) UILabel*         (^labNumberOfLines)(NSInteger lines);
@property (nonatomic,copy,readonly) UILabel*         (^labText)(NSString* txt);
@property (nonatomic,copy,readonly) UILabel*         (^labTextColor)(UIColor* color);
@property (nonatomic,copy,readonly) UILabel*         (^labFont)(UIFont* font);
@property (nonatomic,copy,readonly) CGFloat          (^labFontSystemSizeGet)();
@property (nonatomic,copy,readonly) UILabel*         (^labFontSystemSizeSet)(CGFloat fontSize);
@end
