//
//  UIButton+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 15/8/19.
//  Copyright (c) 2015年 QuXingYi. All rights reserved.
//

#import "UIButton+LinkBlock.h"
#import "LinkBlock.h"

@implementation UIButton(LinkBlock)
- (UIButton *(^)(CGFloat top, CGFloat left, CGFloat botton, CGFloat right))blockTitleEdgeInsets
{
    return ^(CGFloat top, CGFloat left, CGFloat botton, CGFloat right){
        self.titleEdgeInsets = UIEdgeInsetsMake(top, left, botton, right);
        return self;
    };
}
- (void)setBlockTitleEdgeInsets:(UIButton *(^)(CGFloat, CGFloat, CGFloat, CGFloat))blockTitleEdgeInsets{};

- (UIButton *(^)(CGFloat, CGFloat, CGFloat, CGFloat))blockImageEdgeInsets
{
    return ^(CGFloat top, CGFloat left, CGFloat botton, CGFloat right){
        self.imageEdgeInsets = UIEdgeInsetsMake(top, left, botton, right);
        return self;
    };
}
- (void)setBlockImageEdgeInsets:(UIButton *(^)(CGFloat, CGFloat, CGFloat, CGFloat))blockImageEdgeInsets{};

- (UIButton *(^)(NSString *, UIControlState))blockTitleSet
{
    return ^(NSString* title, UIControlState state){
        [self setTitle:title forState:state];
        return self;
    };
}
- (void)setBlockTitleSet:(UIButton *(^)(NSString *, UIControlState))blockSetTitle{};

- (UIButton *(^)(UIImage *, UIControlState))blockImageSet
{
    return ^(UIImage* img, UIControlState state){
        [self setImage:img forState:state];
        return self;
    };
}
- (void)setBlockImageSet:(UIButton *(^)(UIImage *, UIControlState))blockSetImage{};

- (UIButton *(^)(UIImage *, UIControlState))blockBGImageSet
{
    return ^(UIImage* img, UIControlState state){
        [self setBackgroundImage:img forState:state];
        return self;
    };
}
- (void)setBlockBGImageSet:(UIButton *(^)(UIImage *, UIControlState))blockSetBGImage{};

- (UIButton *(^)(UIFont *))blockTitleFontSet
{
    return ^(UIFont* font){
        self.titleLabel.blockFont(font);
        return self;
    };
}
- (void)setBlockTitleFontSet:(UIButton *(^)(UIFont *))blockTitleFontSet{};

- (UIButton *(^)(CGFloat))blockTitleFontSizeSet
{
    return ^(CGFloat size){
        self.titleLabel.blockFontSizeSystem(size);
        return self;
    };
}
- (void)setBlockTitleFontSizeSet:(UIButton *(^)(CGFloat))blockTitleFontSizeSet{};

- (UIButton *(^)(NSAttributedString *, UIControlState))blockAttributeTitleSet
{
    return ^(NSAttributedString* attrStr , UIControlState state){
        [self setAttributedTitle:attrStr forState:state];
        return self;
    };
}
- (void)setBlockAttributeTitleSet:(UIButton *(^)(NSAttributedString *, UIControlState))blockAttributeTitleSet{};
@end
