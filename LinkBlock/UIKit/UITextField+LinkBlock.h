//
//  UITextField+LinkBlock.h
//  LinkBlockProgram
//
//  Created by madrock-iOS-苏北 on 16/1/29.
//  Copyright © 2016年 QuXingYi. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UITextFieldNew ([UITextField new])
@interface NSObject(UITextFieldLinkBlock)
@property (nonatomic,copy) UITextField*     (^txtFieldPlaceholdColor)(UIColor* color);

@end
