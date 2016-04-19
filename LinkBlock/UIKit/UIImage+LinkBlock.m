//
//  UIImage+LinkBlock.m

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//
#import "LinkBlock.h"
#import "UIImage+LinkBlock.h"
#import "NSObject+LinkBlock.h"
#import <Accelerate/Accelerate.h>

@implementation NSObject(UIImageLinkBlockLinkBlock)

- (NSData *(^)(float))imgToData
{
    return ^(float ratio){
        LinkError_REF_AUTO(NSData, UIImage);
        NSData* reIsData = UIImageJPEGRepresentation(_self, ratio);
        if(!reIsData){
            reIsData= UIImagePNGRepresentation(_self);
        }
        return reIsData;
    };
}
- (void)setImgToData:(NSData *(^)(float))imgToData{};

- (UIImage *(^)(CGSize))imgResizeAspect
{
    return ^(CGSize maxSize){
        LinkError_REF_AUTO(UIImage, UIImage);
        CGFloat originWidth= _self.size.width;
        CGFloat originHeight= _self.size.height;
        CGFloat originRatio = originWidth / originHeight;//宽长比
        if(originWidth > maxSize.width || originHeight > maxSize.height)
        {
            CGFloat toRatio = maxSize.width / maxSize.height;//将要压缩到的宽长比
            if(originRatio > toRatio){//横向压，固定宽
                originRatio = maxSize.width / originWidth;
                originHeight = originRatio * originHeight;
                originWidth = maxSize.width;
            } else {//竖向压，固定高
                originRatio = maxSize.height / originHeight;
                originWidth = originRatio * originWidth;
                originHeight = maxSize.height;
            }
        }
        CGRect rect = CGRectMake(0.0, 0.0, originWidth, originHeight);
        UIGraphicsBeginImageContext(rect.size);
        [_self drawInRect:rect];  // scales image to rect
        UIImage* re = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return re;
    };
}
- (void)imgResizeAspect:(UIImage *(^)(CGSize))imgResize{};

- (UIImage *(^)(CGRect))imgCut
{
    return ^(CGRect frame){
        LinkError_REF_AUTO(UIImage, UIImage);
        CGImageRef cgImgRef= CGImageCreateWithImageInRect(_self.CGImage, frame);
        UIImage* re= [UIImage imageWithCGImage:cgImgRef];
        CGImageRelease(cgImgRef);
        return re;
    };
}
- (void)setImgCut:(UIImage *(^)(CGRect))imgCut{};

- (UIImage *(^)(float))imgBlur
{
    return ^(float percent){
        LinkError_REF_AUTO(UIImage, UIImage);
        if ((percent < 0.0f) || (percent > 1.0f)) {
            percent = 0.5f;
        }
        
        int boxSize = (int)(percent * 100);
        boxSize -= (boxSize % 2) + 1;
        
        CGImageRef img = _self.CGImage;
        
        vImage_Buffer inBuffer, outBuffer;
        vImage_Error error;
        void *pixelBuffer;
        
        CGDataProviderRef inProvider = CGImageGetDataProvider(img);
        CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
        
        inBuffer.width = CGImageGetWidth(img);
        inBuffer.height = CGImageGetHeight(img);
        inBuffer.rowBytes = CGImageGetBytesPerRow(img);
        inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
        
        pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
        
        outBuffer.data = pixelBuffer;
        outBuffer.width = CGImageGetWidth(img);
        outBuffer.height = CGImageGetHeight(img);
        outBuffer.rowBytes = CGImageGetBytesPerRow(img);
        
        error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL,
                                           0, 0, boxSize, boxSize, NULL,
                                           kvImageEdgeExtend);
        
        if (error) {
            NSLog(@"blur error（高斯模糊错误 %ld\r\nCode in:[%@.m line%d >> %s]\r\n",
                  error,
                  NSStringFromClass([_self class]),__LINE__,__FUNCTION__);
        }
        
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGContextRef ctx = CGBitmapContextCreate(
                                                 outBuffer.data,
                                                 outBuffer.width,
                                                 outBuffer.height,
                                                 8,
                                                 outBuffer.rowBytes,
                                                 colorSpace,
                                                 CGImageGetBitmapInfo(_self.CGImage));
        
        CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
        UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
        
        //clean up
        CGContextRelease(ctx);
        
        free(pixelBuffer);
        CFRelease(inBitmapData);
        
        CGColorSpaceRelease(colorSpace);
        CGImageRelease(imageRef);
        CGImageRelease(img);
        return returnImage;
    };
}
- (void)setImgBlur:(UIImage *(^)(float))imgBlur{};

- (UIImage *(^)(UIImageRenderingMode))imgRenderingMode
{
    return ^(UIImageRenderingMode mode){
        LinkError_REF_AUTO(UIImage, UIImage);
        return [_self imageWithRenderingMode:mode];
    };
}
- (void)setImgRenderingMode:(UIImage *(^)(UIImageRenderingMode))imgRenderingMode{};




- (UIImage *(^)(NSArray *, UIControlState))imgSetBgImgToBtns
{
    return ^(NSArray* views,UIControlState state){
        LinkError_REF_AUTO(UIImage, UIImage);
        [views enumerateObjectsUsingBlock:^(UIButton *btn, NSUInteger idx, BOOL *stop) {
            if([btn isKindOfClass:[UIButton class]])
                [btn setBackgroundImage:_self forState:state];
        }];
        return _self;
    };
}
- (void)setImgSetBgImgToBtns:(UIImage *(^)(NSArray *, UIControlState))imgSetBgImgToBtns{};

- (UIImage *(^)(NSArray *))imgSetImgToImageViews
{
    return ^(NSArray* views){
        LinkError_REF_AUTO(UIImage, UIImage);
        [views enumerateObjectsUsingBlock:^(UIImageView *imgView, NSUInteger idx, BOOL *stop) {
            if([imgView isKindOfClass:[UIImageView class]])
                ((UIImageView*)imgView).image = _self;
        }];
        return _self;
    };
}
- (void)setImgSetImgToImageViews:(UIImage *(^)(NSArray *))imgSetImgToImageViews{};

- (UIImage *(^)(NSArray *, UIControlState))imgSetImgToBtns
{
    return ^(NSArray* btns, UIControlState state){
        LinkError_REF_AUTO(UIImage, UIImage);
        [btns enumerateObjectsUsingBlock:^(UIButton* btn, NSUInteger idx, BOOL *stop) {
            if([btn isKindOfClass:[UIButton class]])
                [btn setImage:_self forState:state];
        }];
        return _self;
    };
}
- (void)setImgSetImgToBtns:(UIImage *(^)(NSArray *, UIControlState))imgSetImgToBtns{};
@end
