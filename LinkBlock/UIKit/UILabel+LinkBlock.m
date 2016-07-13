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
    return ^id(){
        LinkHandle_REF(UILabel, UILabel)
        LinkGroupHandle_REF(labAlignTop)
        CGSize fontSize = linkObj(_self.text).strSizeWithFont(_self.font);
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
    return ^id(){
        LinkHandle_REF(UILabel, UILabel)
        LinkGroupHandle_REF(labAlignBottom)
        if(!_self.text)
            return _self;
        CGSize fontSize =linkObj(_self.text).strSizeWithFont(_self.font);
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
    return ^id(NSInteger lines){
        LinkHandle_REF(UILabel, UILabel)
        LinkGroupHandle_REF(labNumberOfLines,lines)
        _self.numberOfLines= lines;
        return _self;
    };
}
- (void)setLabNumberOfLines:(UILabel *(^)(NSInteger))labNumberOfLines{};

- (UILabel *(^)(NSTextAlignment))labAlignment
{
    return ^id(NSTextAlignment alighment){
        LinkHandle_REF(UILabel, UILabel)
        LinkGroupHandle_REF(labAlignment,alighment)
        _self.textAlignment = alighment;
        return _self;
    };
}
- (void)setLabAlignment:(UILabel *(^)(NSTextAlignment))labAlignment{};

- (UILabel *(^)(NSString *))labText
{
    return ^id(NSString * txt){
        LinkHandle_REF(UILabel, UILabel)
        LinkGroupHandle_REF(labText,txt)
        _self.text= txt;
        return _self;
    };
}
- (void)setLabText:(UILabel *(^)(NSString *))labText{};

- (UILabel *(^)(UIColor *))labTextColor
{
    return ^id(UIColor * color){
        LinkHandle_REF(UILabel, UILabel)
        LinkGroupHandle_REF(labTextColor,color)
        _self.textColor= color;
        return _self;
    };
}
- (void)setLabTextColor:(UILabel *(^)(UIColor *))labTextColor{};

- (UILabel *(^)(UIFont *))labFont
{
    return ^id(UIFont * font){
        LinkHandle_REF(UILabel, UILabel)
        LinkGroupHandle_REF(labFont,font)
        _self.font= font;
        return _self;
    };
}
- (void)setLabFont:(UILabel *(^)(UIFont *))labFont{};

- (UILabel *(^)(CGFloat))labFontSystemSizeSet
{
    return ^id(CGFloat size){
        LinkHandle_REF(UILabel, UILabel)
        LinkGroupHandle_REF(labFontSystemSizeSet,size)
        _self.font= [UIFont systemFontOfSize:size];
        return _self;
    };
}
- (void)setLabFontSystemSizeSet:(UILabel *(^)(CGFloat))labFontSystemSizeSet{};

- (CGFloat (^)())labFontSystemSizeGet
{
    return ^(){
        LinkHandle_VAL_IFNOT(UILabel){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(labFontSystemSizeGet)
        return _self.font.pointSize;
    };
}
- (void)setLabFontSystemSizeGet:(CGFloat (^)())labFontSystemSizeGet{};
@end
