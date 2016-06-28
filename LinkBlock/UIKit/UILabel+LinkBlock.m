//
//  UILabel+LinkBlock.m

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

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
//        if([[UIDevice currentDevice].systemVersion floatValue]>=7.0){
            NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
            CGSize maxSize= CGSizeMake(finalWidth, finalHeight);
            attrs.makeAttrDictFont(_self.font);
            theStringSize = [_self.text boundingRectWithSize: maxSize
                                                    options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                 attributes:attrs
                                                    context:nil].size;//NSStringDrawingUsesFontLeading
//        }
//        else{
//            theStringSize =[_self.text sizeWithFont:_self.font constrainedToSize:CGSizeMake(finalWidth, finalHeight) lineBreakMode:_self.lineBreakMode];
//        }
        
        int newLinesToPad =(finalHeight - theStringSize.height)/ fontSize.height;
        for(int i=0; i<newLinesToPad; i++)
            _self.text =[_self.text stringByAppendingString:@"\n "];
        return _self;
    };
}
- (void)setLabAlignTop:(UILabel *(^)())labAlignTop{};

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
//        if([[UIDevice currentDevice].systemVersion floatValue]>=7.0){
            NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
            CGSize maxSize= CGSizeMake(finalWidth, finalHeight);
            attrs.makeAttrDictFont(_self.font);
            theStringSize = [_self.text boundingRectWithSize: maxSize
                                                    options:NSStringDrawingTruncatesLastVisibleLine |
                             NSStringDrawingUsesLineFragmentOrigin |
                             NSStringDrawingUsesFontLeading
                                                 attributes:attrs
                                                    context:nil].size;//NSStringDrawingUsesFontLeading
//        }
//        else{
//            theStringSize =[_self.text sizeWithFont:_self.font
//                                 constrainedToSize:CGSizeMake(finalWidth, finalHeight)
//                                     lineBreakMode:_self.lineBreakMode];
//        }
        int newLinesToPad =(finalHeight - theStringSize.height) / fontSize.height;
        for(int i=0; i<newLinesToPad; i++)
            _self.text =[NSString stringWithFormat:@" \n%@",_self.text];
        return _self;
    };
}
- (void)setLabAlignBottom:(UILabel *(^)())labAlignBottom{};

- (UILabel *(^)(NSInteger))labNumberOfLines
{
    return ^(NSInteger lines){
        LinkError_REF_AUTO(UILabel, UILabel);
        _self.numberOfLines= lines;
        return _self;
    };
}
- (void)setLabNumberOfLines:(UILabel *(^)(NSInteger))labNumberOfLines{};

- (UILabel *(^)(NSTextAlignment))labAlignment
{
    return ^(NSTextAlignment alighment){
        LinkError_REF_AUTO(UILabel, UILabel);
        _self.textAlignment = alighment;
        return _self;
    };
}
- (void)setLabAlignment:(UILabel *(^)(NSTextAlignment))labAlignment{};

- (UILabel *(^)(NSString *))labText
{
    return ^(NSString * txt){
        LinkError_REF_AUTO(UILabel, UILabel);
        _self.text= txt;
        return _self;
    };
}
- (void)setLabText:(UILabel *(^)(NSString *))labText{};

- (UILabel *(^)(UIColor *))labTextColor
{
    return ^(UIColor * color){
        LinkError_REF_AUTO(UILabel, UILabel);
        _self.textColor= color;
        return _self;
    };
}
- (void)setLabTextColor:(UILabel *(^)(UIColor *))labTextColor{};

- (UILabel *(^)(UIFont *))labFont
{
    return ^(UIFont * font){
        LinkError_REF_AUTO(UILabel, UILabel);
        _self.font= font;
        return _self;
    };
}
- (void)setLabFont:(UILabel *(^)(UIFont *))labFont{};

- (UILabel *(^)(CGFloat))labFontSystemSizeSet
{
    return ^(CGFloat size){
        LinkError_REF_AUTO(UILabel, UILabel);
        _self.font= [UIFont systemFontOfSize:size];
        return _self;
    };
}
- (void)setLabFontSystemSizeSet:(UILabel *(^)(CGFloat))labFontSystemSizeSet{};

- (CGFloat (^)())labFontSystemSizeGet
{
    return ^(){
        LinkError_VAL_IF(UILabel){
            return (CGFloat)0.0;
        }
        return _self.font.pointSize;
    };
}
- (void)setLabFontSystemSizeGet:(CGFloat (^)())labFontSystemSizeGet{};
@end
