//
//  NSAttributedString+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject(NSAttributedStringLinkBlock)
/** <^(CGFloat maxWidth)>默认情况下计算尺寸，如支持UILable文字排版计算 */
@property (nonatomic,copy,readonly) CGRect   (^attr_strSize)(CGFloat maxWidth);
/** <^(CGFloat maxWidth, NSStringDrawingOptions optoins)> */
@property (nonatomic,copy,readonly) CGRect   (^attr_strSizeWithOptions)(CGFloat maxWidth, NSStringDrawingOptions optoins);
/** <^(NSAttributedString* attrStr)> */
@property (nonatomic,copy,readonly) BOOL     (^attr_strIsEqualToAttrStr)(NSAttributedString* attrStr);
/** <^(UIImage* image, CGRect rect)>属性文本绘制到图片 */
@property (nonatomic,copy,readonly) UIImage* (^attr_strDrawImgRect)(UIImage* image, CGRect rect);
@end
