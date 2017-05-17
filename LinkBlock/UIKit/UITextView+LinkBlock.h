//
//  UITextView+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/8/16.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

#ifndef UITextViewNew
#define UITextViewNew ([UITextView new])
#endif
@interface NSObject(UITextViewLinkBlock)
/** <^(NSString* text)> */
LBDeclare UITextView*        (^txtViewText)(NSString* text);
/** <^(NSAttributedString* attributedText)> */
LBDeclare UITextView*        (^txtViewAttributedText)(NSAttributedString* attributedText);
/** <^(UIColor* textColor)> */
LBDeclare UITextView*        (^txtViewTextColor)(UIColor* textColor);
/** <^(UIFont* font)> */
LBDeclare UITextView*        (^txtViewFont)(UIFont* font);
/** <^(NSTextAlignment textAlignment)> */
LBDeclare UITextView*        (^txtViewTextAlignment)(NSTextAlignment textAlignment);

/** <^(NSRange range)> */
LBDeclare UITextView*         (^txtViewSelectRangeSet)(NSRange range);
/** <^()> */
LBDeclare NSRange             (^txtViewSelectRangeGet)();
/** <^(BOOL b)> */
LBDeclare UITextView*         (^txtViewEditable)(BOOL b);
/** <^(BOOL b)> */
LBDeclare UITextView*         (^txtViewSelectable)(BOOL b);
@end
