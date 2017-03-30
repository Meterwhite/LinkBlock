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
/** <^(UIColor* color)> */
LBDeclare UITextField*        (^txtFieldPlaceholdColor)(UIColor* color);
/** <^(NSRange range)> */
LBDeclare UITextField*        (^txtFieldSelectRangeSet)(NSRange range);
/** <^()> */
LBDeclare NSRange             (^txtFieldSelectRangeGet)();
@end
