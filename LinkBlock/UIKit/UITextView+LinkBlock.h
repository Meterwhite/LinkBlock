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
#pragma mark - Foundation Mirror/镜像
LBDeclare UITextView*        (^txtViewText)(NSString* text);
LBDeclare UITextView*        (^txtViewAttributedText)(NSAttributedString* attributedText);
LBDeclare UITextView*        (^txtViewTextColor)(UIColor* textColor);
LBDeclare UITextView*        (^txtViewFont)(UIFont* font);
LBDeclare UITextView*        (^txtViewTextAlignment)(NSTextAlignment textAlignment);
LBDeclare UITextView*         (^txtViewEditable)(BOOL b);
LBDeclare UITextView*         (^txtViewSelectable)(BOOL b);


#pragma mark - Foundation Speed/速度
LBDeclare UITextView*         (^txtViewSelectRangeSet)(NSRange range);
LBDeclare NSRange             (^txtViewSelectRangeGet)(void);

@end
