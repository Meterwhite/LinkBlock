//
//  UILabel+LinkBlock.m

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"
#import "UILabel+LinkBlock.h"
#import "NSObject+LinkBlock.h"

@implementation NSObject(UILabelLinkBlock)
- (UILabel *(^)())labAlignTop
{
    return ^(){
        LinkError_REF_AUTO(UILabel, UILabel);
        CGSize fontSize = _self.text.strSizeWithFont(_self.font);
        double finalHeight = fontSize.height *_self.numberOfLines;
        if(!finalHeight){
            finalHeight= _self.bounds.size.height;
        }
        double finalWidth =_self.bounds.size.width;//expected width of label
        CGSize theStringSize;
        if([[UIDevice currentDevice].systemVersion floatValue]>=7.0){
            NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
            CGSize maxSize= CGSizeMake(finalWidth, finalHeight);
            attrs.m_dictAttrStrFont(_self.font);
            theStringSize = [_self.text boundingRectWithSize: maxSize
                                                    options:NSStringDrawingTruncatesLastVisibleLine |
                             NSStringDrawingUsesLineFragmentOrigin |
                             NSStringDrawingUsesFontLeading
                                                 attributes:attrs
                                                    context:nil].size;//NSStringDrawingUsesFontLeading
        }else{
            theStringSize =[_self.text sizeWithFont:_self.font constrainedToSize:CGSizeMake(finalWidth, finalHeight) lineBreakMode:_self.lineBreakMode];
        }
        
        int newLinesToPad =(finalHeight - theStringSize.height)/ fontSize.height;
        for(int i=0; i<newLinesToPad; i++)
            _self.text =[_self.text stringByAppendingString:@"\n "];
        return _self;
    };
}

- (UILabel *(^)())labAlignBottom
{
    return ^(){
        LinkError_REF_AUTO(UILabel, UILabel);
        CGSize fontSize =_self.text.strSizeWithFont(_self.font);
        double finalHeight = fontSize.height *_self.numberOfLines;
        if(!finalHeight){
            finalHeight = _self.bounds.size.height;
        }
        double finalWidth =_self.bounds.size.width;//expected width of label
        CGSize theStringSize;
        if([[UIDevice currentDevice].systemVersion floatValue]>=7.0){
            NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
            CGSize maxSize= CGSizeMake(finalWidth, finalHeight);
            attrs.m_dictAttrStrFont(_self.font);
            theStringSize = [_self.text boundingRectWithSize: maxSize
                                                    options:NSStringDrawingTruncatesLastVisibleLine |
                             NSStringDrawingUsesLineFragmentOrigin |
                             NSStringDrawingUsesFontLeading
                                                 attributes:attrs
                                                    context:nil].size;//NSStringDrawingUsesFontLeading
        }else{
            theStringSize =[_self.text sizeWithFont:_self.font
                                 constrainedToSize:CGSizeMake(finalWidth, finalHeight)
                                     lineBreakMode:_self.lineBreakMode];
        }
        int newLinesToPad =(finalHeight - theStringSize.height) / fontSize.height;
        for(int i=0; i<newLinesToPad; i++)
            _self.text =[NSString stringWithFormat:@" \n%@",_self.text];
        return _self;
    };
}

- (UILabel *(^)(NSInteger))labNumberOfLines
{
    return ^(NSInteger lines){
        LinkError_REF_AUTO(UILabel, UILabel);
        _self.numberOfLines= lines;
        return _self;
    };
}
- (UILabel *(^)(NSTextAlignment))labAlignment
{
    return ^(NSTextAlignment alighment){
        LinkError_REF_AUTO(UILabel, UILabel);
        _self.textAlignment = alighment;
        return _self;
    };
}
- (UILabel *(^)(NSString *))labText
{
    return ^(NSString * txt){
        LinkError_REF_AUTO(UILabel, UILabel);
        _self.text= txt;
        return _self;
    };
}
- (UILabel *(^)(UIColor *))labTextColor
{
    return ^(UIColor * color){
        LinkError_REF_AUTO(UILabel, UILabel);
        _self.textColor= color;
        return _self;
    };
}
- (UILabel *(^)(UIFont *))labFont
{
    return ^(UIFont * font){
        LinkError_REF_AUTO(UILabel, UILabel);
        _self.font= font;
        return _self;
    };
}
- (UILabel *(^)(CGFloat))labFontSizeSystem
{
    return ^(CGFloat size){
        LinkError_REF_AUTO(UILabel, UILabel);
        _self.font= [UIFont systemFontOfSize:size];
        return _self;
    };
}
- (void)setLabFontSizeSystem:(UILabel *(^)(CGFloat))blockFontSize{};

- (void)setLabAlignBottom:(UILabel *(^)())blockAlignBottom{};
- (void)setLabAlignTop:(UILabel *(^)())blockAlignTop{};
- (void)setLabAlignment:(UILabel *(^)(NSTextAlignment))blockAlignment{};
- (void)setLabText:(UILabel *(^)(NSString *))blockText{};
- (void)setLabTextColor:(UILabel *(^)(UIColor *))blockTextColor{};
- (void)setLabFont:(UILabel *(^)(UIFont *))blockFont{};
- (void)setLabNumberOfLines:(UILabel *(^)(NSInteger))blockNumberOfLines{};
@end
