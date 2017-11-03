//
//  UIFont+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 2017/11/2.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(UIFontLinkBlock)
/**
 根据字体获得行高
 
 @param line 行数
 @return 行高
 */
- (CGFloat (^)(NSUInteger))fontHeightWithLine
{
    return ^CGFloat(NSUInteger line){
        LinkHandle_VAL_IFNOT(UIFont){
            return 0.0;
        }
        LinkGroupHandle_VAL(fontHeightWithLine,line);
        if(line == 0) return 0.0;
        return line*[[[NSAttributedString alloc] initWithString:@" " attributes:@{NSFontAttributeName:_self}] size].height;
    };
}
@end
