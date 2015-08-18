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

@implementation UIImage(LinkBlock)

- (NSData *(^)(float))blockImageToData
{
    return ^(float ratio){
        NSData* reIsData = UIImageJPEGRepresentation(self, ratio);
        if(!reIsData){
            reIsData= UIImagePNGRepresentation(self);
        }
        return reIsData;
    };
}

- (UIImage *(^)(CGSize))blockResize
{
    return ^(CGSize maxSize){
        CGFloat originWidth= self.size.width;
        CGFloat originHeight= self.size.height;
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
        [self drawInRect:rect];  // scales image to rect
        UIImage* re = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return re;
    };
}
- (UIImage *(^)(CGRect))blockCut
{
    return ^(CGRect frame){
        CGImageRef cgImgRef= CGImageCreateWithImageInRect(self.CGImage, frame);
        UIImage* re= [UIImage imageWithCGImage:cgImgRef];
        CGImageRelease(cgImgRef);
        return re;
    };
}
- (UIImage *(^)(float))blockBlur
{
    return ^(float percent){
        if ((percent < 0.0f) || (percent > 1.0f)) {
            percent = 0.5f;
        }
        
        int boxSize = (int)(percent * 100);
        boxSize -= (boxSize % 2) + 1;
        
        CGImageRef img = self.CGImage;
        
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
                  NSStringFromClass([self class]),__LINE__,__FUNCTION__);
        }
        
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGContextRef ctx = CGBitmapContextCreate(
                                                 outBuffer.data,
                                                 outBuffer.width,
                                                 outBuffer.height,
                                                 8,
                                                 outBuffer.rowBytes,
                                                 colorSpace,
                                                 CGImageGetBitmapInfo(self.CGImage));
        
        CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
        UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
        
        //clean up
        CGContextRelease(ctx);
        CGColorSpaceRelease(colorSpace);
        
        free(pixelBuffer);
        CFRelease(inBitmapData);
        
        CGColorSpaceRelease(colorSpace);
        CGImageRelease(imageRef);
        CGImageRelease(img);
        return returnImage;
    };
}

- (void)setBlockImageToData:(NSData *(^)(float))blockImageToData{};
- (void)setBlockBlur:(UIImage *(^)(float))blockBlur{};
- (void)setBlockResize:(UIImage *(^)(CGSize))blockResize{};
- (void)setBlockCut:(UIImage *(^)(CGRect))blockCut{};
@end
