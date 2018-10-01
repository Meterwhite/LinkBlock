//
//  UITextField+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/1/29.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

#ifndef UITextFieldNew
#define UITextFieldNew ([UITextField new])
#endif
@interface NSObject(UITextFieldLinkBlock)
#pragma mark - Foundation Mirror/镜像
LBDeclare UITextField*        (^txtFieldText)(NSString* text);
LBDeclare UITextField*        (^txtFieldAttributedText)(NSAttributedString* attributedText);
LBDeclare UITextField*        (^txtFieldTextColor)(UIColor* textColor);
LBDeclare UITextField*        (^txtFieldFont)(UIFont* font);
LBDeclare UITextField*        (^txtFieldTextAlignment)(NSTextAlignment textAlignment);
LBDeclare UITextField*        (^txtFieldPlaceholder)(NSString* placeholder);
LBDeclare UITextField*        (^txtFieldAttributedPlaceholder)(NSAttributedString* attributedPlaceholder);
#pragma mark - Foundation Speed/速度
LBDeclare UITextField*        (^txtFieldPlaceholdColor)(UIColor* color);
LBDeclare UITextField*        (^txtFieldSelectRangeSet)(NSRange range);
LBDeclare NSRange             (^txtFieldSelectRangeGet)(void);





@end
