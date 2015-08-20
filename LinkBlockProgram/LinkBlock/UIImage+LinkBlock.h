//
//  UIImage+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject(UIImageLinkBlock)
@property (nonatomic,copy) NSData*          (^imgToData)(float ratio);
@property (nonatomic,copy) UIImage*         (^imgResize)(CGSize maxSize);
@property (nonatomic,copy) UIImage*         (^imgCut)(CGRect frame);
@property (nonatomic,copy) UIImage*         (^imgBlur)(float percent);
@end
