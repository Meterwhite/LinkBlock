//
//  UITextField+LinkBlock.m
//  LinkBlockProgram
//
//  Created by madrock-iOS-苏北 on 16/1/29.
//  Copyright © 2016年 QuXingYi. All rights reserved.
//

#import "UITextField+LinkBlock.h"
#import "LinkBlock.h"

@implementation NSObject(UIViewControllerLinkBlock)

- (UITextField* (^)(UIColor *))txtFieldPlaceholdColor
{
    return ^(UIColor* color){
        LinkError_REF_AUTO(UITextField, UITextField);
        [_self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
        return _self;
    };
}
- (void)setTxtFieldPlaceholdColor:(UITextField *(^)(UIColor *))txtFieldPlaceholdColor{};
@end
