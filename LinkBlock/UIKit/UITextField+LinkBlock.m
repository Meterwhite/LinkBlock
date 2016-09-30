//
//  UITextField+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 16/1/29.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(UITextFieldLinkBlock)

- (UITextField* (^)(UIColor *))txtFieldPlaceholdColor
{
    return ^id(UIColor* color){
        LinkHandle_REF(UITextField)
        LinkGroupHandle_REF(txtFieldPlaceholdColor,color)
        [_self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
        return _self;
    };
}

- (UITextField *(^)(NSRange))txtFieldSelectRangeSet
{
    return ^id(NSRange range){
        LinkHandle_REF(UITextField)
        LinkGroupHandle_REF(txtFieldSelectRangeSet,range)
        UITextPosition* beginning = _self.beginningOfDocument;
        UITextPosition* startPosition = [_self positionFromPosition:beginning offset:range.location];
        UITextPosition* endPosition = [_self positionFromPosition:beginning offset:range.location + range.length];
        UITextRange* selectionRange = [_self textRangeFromPosition:startPosition toPosition:endPosition];
        [_self setSelectedTextRange:selectionRange];
        return _self;
    };
}

- (NSRange (^)())txtFieldSelectRangeGet
{
    return ^NSRange(){
        LinkHandle_VAL_IFNOT(UITextField){
            return NSMakeRange(NSNotFound, 0);
        }
        LinkGroupHandle_VAL(txtFieldSelectRangeGet)
        
        UITextPosition* beginning = _self.beginningOfDocument;
        UITextRange* selectedRange = _self.selectedTextRange;
        UITextPosition* selectionStart = selectedRange.start;
        UITextPosition* selectionEnd = selectedRange.end;
        
        const NSInteger location = [_self offsetFromPosition:beginning toPosition:selectionStart];
        const NSInteger length = [_self offsetFromPosition:selectionStart toPosition:selectionEnd];
        
        return NSMakeRange(location, length);
    };
}

@end
