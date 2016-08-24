//
//  UIImageView+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 15/8/30.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(UIImageViewLinkBlock)
- (UIImageView *(^)(UIImage *))img_viewImage
{
    return ^id(UIImage * img){
        LinkHandle_REF(UIImageView, UIImageView)
        LinkGroupHandle_REF(img_viewImage,img)
        _self.image= img;
        return _self;
    };
}

- (UIImageView *(^)(UIImage *))img_viewImageHighlight
{
    return ^id(UIImage * img){
        LinkHandle_REF(UIImageView, UIImageView)
        LinkGroupHandle_REF(img_viewImageHighlight,img)
        _self.highlightedImage= img;
        return _self;
    };
}

- (UIImageView *(^)(NSString *))img_viewImageStr
{
    return ^id(NSString * imgStr){
        LinkHandle_REF(UIImageView, UIImageView)
        LinkGroupHandle_REF(img_viewImageStr,imgStr)
        _self.image = [UIImage imageNamed:imgStr];
        return _self;
    };
}

- (UIImageView *(^)(NSString *))img_viewImageStrHighlight
{
    return ^id(NSString * imgStr){
        LinkHandle_REF(UIImageView, UIImageView)
        LinkGroupHandle_REF(img_viewImageStrHighlight,imgStr)
        _self.highlightedImage = [UIImage imageNamed:imgStr];
        return _self;
    };
}

- (UIImageView *(^)(BOOL))img_viewHighlight
{
    return ^id(BOOL b){
        LinkHandle_REF(UIImageView, UIImageView)
        LinkGroupHandle_REF(img_viewHighlight,b)
        _self.highlighted = b;
        return _self;
    };
}

@end
