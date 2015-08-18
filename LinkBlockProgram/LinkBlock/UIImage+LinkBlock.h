//
//  UIImage+LinkBlock.h

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(LinkBlock)
@property (nonatomic,copy) NSData*          (^blockImageToData)(float ratio);
@property (nonatomic,copy) UIImage*         (^blockResize)(CGSize maxSize);
@property (nonatomic,copy) UIImage*         (^blockCut)(CGRect frame);
@property (nonatomic,copy) UIImage*         (^blockBlur)(float percent);
@end
