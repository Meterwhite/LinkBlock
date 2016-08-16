//
//  UITextField+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/1/29.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UITextFieldNew ([UITextField new])
@interface NSObject(UITextFieldLinkBlock)
@property (nonatomic,copy,readonly) UITextField*        (^txtFieldPlaceholdColor)(UIColor* color);
@property (nonatomic,copy,readonly) UITextField*        (^txtFieldSelectRangeSet)(NSRange range);
@property (nonatomic,copy,readonly) NSRange             (^txtFieldSelectRangeGet)();
@end
