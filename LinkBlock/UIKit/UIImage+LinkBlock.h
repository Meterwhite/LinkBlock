//
//  UIImage+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject(UIImageLinkBlock)
/**
 *  <^(float ratio)>
 *  图片转NSData
 *  @ ratio: 仅仅针对JPEG格式有效的压缩质量
 */
@property (nonatomic,copy,readonly) NSData*          (^imgToData)(float ratio);
/** <^(CGSize maxSize)>保持比例放大或缩小图片 */
@property (nonatomic,copy,readonly) UIImage*         (^imgResizeAspect)(CGSize maxSize);
/** <^(CGRect frame)>剪切 */
@property (nonatomic,copy,readonly) UIImage*         (^imgCut)(CGRect frame);
/** <^(float percent)>高斯模糊 #import <Accelerate/Accelerate.h> */
@property (nonatomic,copy,readonly) UIImage*         (^imgBlur)(float percent);
/** <^(UIImageRenderingMode mode)>渲染模式 */
@property (nonatomic,copy,readonly) UIImage*         (^imgRenderingMode)(UIImageRenderingMode mode);
/** <^(UIImage* aImg , CGRect rect)>水印；图片合并到图片； */
@property (nonatomic,copy,readonly) UIImage*         (^imgAddImg)(UIImage* aImg , CGRect rect);
/** <^()>图片取色 */
@property (nonatomic,copy,readonly) UIColor*         (^imgGetPatternColor)();

/** <UIImageView* ^(UIImageView* imgView)> */
@property (nonatomic,copy,readonly) UIImageView*     (^imgSetToImgView_linkTo)(UIImageView* imgView);
/** <UIButton* ^(UIButton* btn,UIControlState state)> */
@property (nonatomic,copy,readonly) UIButton*        (^imgSetToBtnBGImg_linkTo)(UIButton* btn,UIControlState state);
/** <UIButton* ^(UIButton* btn,UIControlState state)> */
@property (nonatomic,copy,readonly) UIButton*        (^imgSetToBtn_linkTo)(UIButton* btn,UIControlState state);
@end
