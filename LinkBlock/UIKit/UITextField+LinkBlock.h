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
/** <^(NSString* text)> */
LBDeclare UITextField*        (^txtFieldText)(NSString* text);
/** <^(NSAttributedString* attributedText)> */
LBDeclare UITextField*        (^txtFieldAttributedText)(NSAttributedString* attributedText);
/** <^(UIColor* textColor)> */
LBDeclare UITextField*        (^txtFieldTextColor)(UIColor* textColor);
/** <^(UIFont* font)> */
LBDeclare UITextField*        (^txtFieldFont)(UIFont* font);
/** <^(NSTextAlignment textAlignment)> */
LBDeclare UITextField*        (^txtFieldTextAlignment)(NSTextAlignment textAlignment);
/** <^(NSString* placeholder)> */
LBDeclare UITextField*        (^txtFieldPlaceholder)(NSString* placeholder);
/** <^(NSAttributedString* attributedPlaceholder)> */
LBDeclare UITextField*        (^txtFieldAttributedPlaceholder)(NSAttributedString* attributedPlaceholder);



/** <^(UIColor* color)> */
LBDeclare UITextField*        (^txtFieldPlaceholdColor)(UIColor* color);
/** <^(NSRange range)> */
LBDeclare UITextField*        (^txtFieldSelectRangeSet)(NSRange range);
/** <^()> */
LBDeclare NSRange             (^txtFieldSelectRangeGet)(void);
@end
