//
//  UILabel+LinkBlock.h

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel(LinkBlock)
@property (nonatomic,copy) UILabel*         (^blockAlignTop)();
@property (nonatomic,copy) UILabel*         (^blockAlignBottom)();
@property (nonatomic,copy) UILabel*         (^blockAlignment)(NSTextAlignment alighment);
@property (nonatomic,copy) UILabel*         (^blockNumberOfLines)(NSInteger lines);
@property (nonatomic,copy) UILabel*         (^blockText)(NSString* txt);
@property (nonatomic,copy) UILabel*         (^blockTextColor)(UIColor* color);
@property (nonatomic,copy) UILabel*         (^blockFont)(UIFont* font);

@end
