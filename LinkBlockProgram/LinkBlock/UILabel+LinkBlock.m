//
//  UILabel+LinkBlock.m

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"
#import "UILabel+LinkBlock.h"
#import "NSObject+LinkBlock.h"

@implementation UILabel(LinkBlock)
- (UILabel *(^)())blockAlignTop
{
    return ^(){
        CGSize fontSize = self.text.blockSizeWithFont(self.font);
        double finalHeight = fontSize.height *self.numberOfLines;
        if(!finalHeight){
            finalHeight= self.bounds.size.height;
        }
        double finalWidth =self.bounds.size.width;//expected width of label
        CGSize theStringSize;
        if([[UIDevice currentDevice].systemVersion floatValue]>=7.0){
            NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
            CGSize maxSize= CGSizeMake(finalWidth, finalHeight);
            attrs.blockAttrStrFont(self.font);
            theStringSize = [self.text boundingRectWithSize: maxSize
                                                    options:NSStringDrawingTruncatesLastVisibleLine |
                             NSStringDrawingUsesLineFragmentOrigin |
                             NSStringDrawingUsesFontLeading
                                                 attributes:attrs
                                                    context:nil].size;//NSStringDrawingUsesFontLeading
        }else{
            theStringSize =[self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(finalWidth, finalHeight) lineBreakMode:self.lineBreakMode];
        }
        
        int newLinesToPad =(finalHeight - theStringSize.height)/ fontSize.height;
        for(int i=0; i<newLinesToPad; i++)
            self.text =[self.text stringByAppendingString:@"\n "];
        return self;
    };
}

- (UILabel *(^)())blockAlignBottom
{
    return ^(){
        CGSize fontSize =self.text.blockSizeWithFont(self.font);
        double finalHeight = fontSize.height *self.numberOfLines;
        if(!finalHeight){
            finalHeight = self.bounds.size.height;
        }
        double finalWidth =self.bounds.size.width;//expected width of label
        CGSize theStringSize;
        if([[UIDevice currentDevice].systemVersion floatValue]>=7.0){
            NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
            CGSize maxSize= CGSizeMake(finalWidth, finalHeight);
            attrs.blockAttrStrFont(self.font);
            theStringSize = [self.text boundingRectWithSize: maxSize
                                                    options:NSStringDrawingTruncatesLastVisibleLine |
                             NSStringDrawingUsesLineFragmentOrigin |
                             NSStringDrawingUsesFontLeading
                                                 attributes:attrs
                                                    context:nil].size;//NSStringDrawingUsesFontLeading
        }else{
            theStringSize =[self.text sizeWithFont:self.font
                                 constrainedToSize:CGSizeMake(finalWidth, finalHeight)
                                     lineBreakMode:self.lineBreakMode];
        }
        int newLinesToPad =(finalHeight - theStringSize.height) / fontSize.height;
        for(int i=0; i<newLinesToPad; i++)
            self.text =[NSString stringWithFormat:@" \n%@",self.text];
        return self;
    };
}

- (UILabel *(^)(NSInteger))blockNumberOfLines
{
    return ^(NSInteger lines){
        self.numberOfLines= lines;
        return self;
    };
}
- (UILabel *(^)(NSTextAlignment))blockAlignment
{
    return ^(NSTextAlignment alighment){
        self.textAlignment = alighment;
        return self;
    };
}
- (UILabel *(^)(NSString *))blockText
{
    return ^(NSString * txt){
        self.text= txt;
        return self;
    };
}
- (UILabel *(^)(UIColor *))blockTextColor
{
    return ^(UIColor * color){
        self.textColor= color;
        return self;
    };
}
- (UILabel *(^)(UIFont *))blockFont
{
    return ^(UIFont * font){
        self.font= font;
        return self;
    };
}
- (UILabel *(^)(CGFloat))blockFontSizeSystem
{
    return ^(CGFloat size){
        self.font= [UIFont systemFontOfSize:size];
        return self;
    };
}
- (void)setBlockFontSizeSystem:(UILabel *(^)(CGFloat))blockFontSize{};

- (void)setBlockAlignBottom:(UILabel *(^)())blockAlignBottom{};
- (void)setBlockAlignTop:(UILabel *(^)())blockAlignTop{};
- (void)setBlockAlignment:(UILabel *(^)(NSTextAlignment))blockAlignment{};
- (void)setBlockText:(UILabel *(^)(NSString *))blockText{};
- (void)setBlockTextColor:(UILabel *(^)(UIColor *))blockTextColor{};
- (void)setBlockFont:(UILabel *(^)(UIFont *))blockFont{};
- (void)setBlockNumberOfLines:(UILabel *(^)(NSInteger))blockNumberOfLines{};
@end
