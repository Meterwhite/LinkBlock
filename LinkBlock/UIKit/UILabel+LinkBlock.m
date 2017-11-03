//
//  UILabel+LinkBlock.m

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(UILabelLinkBlock)
- (UILabel *(^)())labAlignmentRight
{
    return ^id(){
        LinkHandle_REF(UILabel)
        LinkGroupHandle_REF(labAlignmentRight)
        _self.textAlignment= NSTextAlignmentRight;
        return _self;
    };
}

- (UILabel *(^)())labAlignmentLeft
{
    return ^id(){
        LinkHandle_REF(UILabel)
        LinkGroupHandle_REF(labAlignmentLeft)
        _self.textAlignment= NSTextAlignmentLeft;
        return _self;
    };
}

- (UILabel *(^)())labAlignmentCenter
{
    return ^id(){
        LinkHandle_REF(UILabel)
        LinkGroupHandle_REF(labAlignmentCenter)
        _self.textAlignment= NSTextAlignmentCenter;
        return _self;
    };
}

- (UILabel *(^)(NSInteger))labNumberOfLines
{
    return ^id(NSInteger lines){
        LinkHandle_REF(UILabel)
        LinkGroupHandle_REF(labNumberOfLines,lines)
        _self.numberOfLines= lines;
        return _self;
    };
}

- (UILabel *(^)(NSTextAlignment))labAlignment
{
    return ^id(NSTextAlignment alighment){
        LinkHandle_REF(UILabel)
        LinkGroupHandle_REF(labAlignment,alighment)
        _self.textAlignment = alighment;
        return _self;
    };
}

- (UILabel *(^)(NSString *))labText
{
    return ^id(NSString * txt){
        LinkHandle_REF(UILabel)
        LinkGroupHandle_REF(labText,txt)
        _self.text= txt;
        return _self;
    };
}

- (UILabel *(^)(UIColor *))labTextColor
{
    return ^id(UIColor * color){
        LinkHandle_REF(UILabel)
        LinkGroupHandle_REF(labTextColor,color)
        _self.textColor= color;
        return _self;
    };
}

- (UILabel *(^)(UIFont *))labFont
{
    return ^id(UIFont * font){
        LinkHandle_REF(UILabel)
        LinkGroupHandle_REF(labFont,font)
        _self.font= font;
        return _self;
    };
}

- (UILabel *(^)(CGFloat))labFontSystemSizeSet
{
    return ^id(CGFloat size){
        LinkHandle_REF(UILabel)
        LinkGroupHandle_REF(labFontSystemSizeSet,size)
        _self.font= [UIFont systemFontOfSize:size];
        return _self;
    };
}

- (CGFloat (^)())labFontSystemSizeGet
{
    return ^CGFloat(){
        LinkHandle_VAL_IFNOT(UILabel){
            return 0.0;
        }
        LinkGroupHandle_VAL(labFontSystemSizeGet)
        return _self.font.pointSize;
    };
}

- (CGSize (^)(NSNumber *))labTextSize
{
    return ^CGSize(NSNumber* maxWidth){
        LinkHandle_VAL_IFNOT(UILabel){
            return CGSizeZero;
        }
        LinkGroupHandle_VAL(labTextSize,maxWidth)
        
        NSAttributedString* attrStr = _self.attributedText;
        attrStr = attrStr ? attrStr: [[NSAttributedString alloc] initWithString:_self.text attributes:@{NSForegroundColorAttributeName:_self.textColor,NSFontAttributeName:_self.font}
                                      ];
        return [attrStr boundingRectWithSize:CGSizeMake(maxWidth?maxWidth.doubleValue:CGRectGetWidth(_self.bounds), CGFLOAT_MAX)
                                     options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                     context:nil].size;
    };
}

@end
