//
//  UIImageView+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 15/8/30.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "UIImageView+LinkBlock.h"
#import "LinkBlock.h"

@implementation NSObject(UIImageViewLinkBlock)
- (UIImageView *(^)(UIImage *))img_viewImage
{
    return ^(UIImage * img){
        LinkError_REF_AUTO(UIImageView, UIImageView);
        _self.image= img;
        return _self;
    };
}
- (void)setImg_viewImage:(UIImageView *(^)(UIImage *))img_viewImage{};

- (UIImageView *(^)(UIImage *))img_viewImageHighlight
{
    return ^(UIImage * img){
        LinkError_REF_AUTO(UIImageView, UIImageView);
        _self.highlightedImage= img;
        return _self;
    };
}
- (void)setImg_viewImageHighlight:(UIImageView *(^)(UIImage *))img_viewImageHighlight{};

- (UIImageView *(^)(NSString *))img_viewImageStr
{
    return ^(NSString * imgStr){
        LinkError_REF_AUTO(UIImageView, UIImageView);
        _self.image = [UIImage imageNamed:imgStr];
        return _self;
    };
}
- (void)setImg_viewImageStr:(UIImageView *(^)(NSString *))img_viewImageStr{};

- (UIImageView *(^)(NSString *))img_viewImageStrHighlight
{
    return ^(NSString * imgStr){
        LinkError_REF_AUTO(UIImageView, UIImageView);
        _self.highlightedImage = [UIImage imageNamed:imgStr];
        return _self;
    };
}
- (void)setImg_viewImageStrHighlight:(UIImageView *(^)(NSString *))img_viewImageStrHighlight{};

- (UIImageView *(^)(BOOL))img_viewHighlight
{
    return ^(BOOL b){
        LinkError_REF_AUTO(UIImageView, UIImageView);
        _self.highlighted = b;
        return _self;
    };
}
- (void)setImg_viewHighlight:(UIImageView *(^)(BOOL))img_viewHighlight{};
@end
