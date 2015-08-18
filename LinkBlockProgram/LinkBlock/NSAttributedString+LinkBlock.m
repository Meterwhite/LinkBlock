//
//  NSAttributedString+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"
#import "NSAttributedString+LinkBlock.h"
#import "NSObject+LinkBlock.h"

@implementation NSAttributedString(LinkBlock)
- (CGRect (^)(CGFloat))blockSize
{
    return ^(CGFloat maxWidth){
        return [self boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
    };
}
- (void)setBlockSize:(CGRect (^)(CGFloat))blockSize{};

- (CGRect (^)(CGFloat, NSStringDrawingOptions))blockSizeWithOptions
{
    return ^(CGFloat maxWidth,NSStringDrawingOptions options ){
        return [self boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:options context:nil];
    };
}
- (void)setBlockSizeWithOptions:(CGRect (^)(CGFloat, NSStringDrawingOptions))blockSizeWithOptions{};

- (BOOL (^)(NSAttributedString *))blockIsEqualToAttrStr
{
    return ^(NSAttributedString* attrStr){
        return [self isEqualToAttributedString:attrStr];
    };
}
- (void)setBlockIsEqualToAttrStr:(BOOL (^)(NSAttributedString *))blockIsEqualToAttrStr{};
@end
