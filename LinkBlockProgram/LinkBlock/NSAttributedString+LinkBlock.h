//
//  NSAttributedString+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString(LinkBlock)
/** 默认情况下计算尺寸，如支持UILable文字排版计算 */
/** Calculation string size , like UILable*/
@property (nonatomic,copy) CGRect   (^blockSize)(CGFloat maxWidth);
@property (nonatomic,copy) CGRect   (^blockSizeWithOptions)(CGFloat maxWidth, NSStringDrawingOptions optoins);
@property (nonatomic,copy) BOOL     (^blockIsEqualToAttrStr)(NSAttributedString* attrStr);
@end
