//
//  UITextView+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/8/16.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>
#define UITextViewNew ([UITextView new])
@interface NSObject(UITextViewLinkBlock)
/** <^(NSRange range)> */
@property (nonatomic,copy,readonly) UITextView*         (^txtViewSelectRangeSet)(NSRange range);
/** <^()> */
@property (nonatomic,copy,readonly) NSRange             (^txtViewSelectRangeGet)();
@end
