//
//  UIImage+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

@interface NSObject(UIImageLinkBlock)
/**
 *  <^(float ratio)>
 *  图片转NSData
 *  @ ratio: 仅仅针对JPEG格式有效的压缩质量
 */
LBDeclare NSData*          (^imgToData)(float ratio);
/** <^(CGSize maxSize)>保持比例放大或缩小图片 */
LBDeclare UIImage*         (^imgResizeAspect)(CGSize maxSize);
/** <^(CGRect frame)>剪切 */
LBDeclare UIImage*         (^imgCut)(CGRect frame);
/** <^(float percent)>高斯模糊 #import <Accelerate/Accelerate.h> */
LBDeclare UIImage*         (^imgBlur)(float percent);
/** <^(UIImageRenderingMode mode)>渲染模式 */
LBDeclare UIImage*         (^imgRenderingMode)(UIImageRenderingMode mode);
/** <^(UIImage* aImg , CGRect rect)>水印；图片合并到图片； */
LBDeclare UIImage*         (^imgAddImg)(UIImage* aImg , CGRect rect);
/** <^()>图片取色 */
LBDeclare UIColor*         (^imgGetPatternColor)();
/** <^()>矫正方向的图片 */
LBDeclare UIImage*         (^imgOrientationFix)();

/** <UIImageView* ^(UIImageView* imgView)>图片设置到控件并返回控件 */
LBDeclare UIImageView*     (^imgSetToImgView_linkTo)(UIImageView* imgView);
/** <UIButton* ^(UIButton* btn,UIControlState state)>图片设置到控件并返回控件 */
LBDeclare UIButton*        (^imgSetToBtnBGImg_linkTo)(UIButton* btn,UIControlState state);
/** <UIButton* ^(UIButton* btn,UIControlState state)>图片设置到控件并返回控件 */
LBDeclare UIButton*        (^imgSetToBtn_linkTo)(UIButton* btn,UIControlState state);
/** <^(CGFloat lWidth,CGFloat tHeight)>图片拉伸 */
LBDeclare UIImage*        (^imgStretchableImageWithLeftCapWidthAndTopCapHeight)(CGFloat lWidth,CGFloat tHeight);
/** <^(CGFloat top,CGFloat left,CGFloat bottom, CGFloat right)>图片拉伸 */
LBDeclare UIImage*        (^imgResizableWithCapInsets)(CGFloat top,CGFloat left,CGFloat bottom, CGFloat right);
@end
