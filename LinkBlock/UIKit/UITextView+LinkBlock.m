//
//  UITextView+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 16/8/16.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(UITextViewLinkBlock)

- (UITextView *(^)(NSRange))txtViewSelectRangeSet
{
    return ^id(NSRange range){
        LinkHandle_REF(UITextView)
        LinkGroupHandle_REF(txtViewSelectRangeSet,range)
        
        UITextPosition* beginning = _self.beginningOfDocument;
        UITextPosition* startPosition = [_self positionFromPosition:beginning offset:range.location];
        UITextPosition* endPosition = [_self positionFromPosition:beginning offset:range.location + range.length];
        UITextRange* selectionRange = [_self textRangeFromPosition:startPosition toPosition:endPosition];
        [_self setSelectedTextRange:selectionRange];
        return _self;
    };
}

- (NSRange (^)())txtViewSelectRangeGet
{
    return ^NSRange(){
        LinkHandle_VAL_IFNOT(UITextView){
            return NSMakeRange(NSNotFound, 0);
        }
        LinkGroupHandle_VAL(txtViewSelectRangeGet)
        
        UITextPosition* beginning = _self.beginningOfDocument;
        UITextRange* selectedRange = _self.selectedTextRange;
        UITextPosition* selectionStart = selectedRange.start;
        UITextPosition* selectionEnd = selectedRange.end;
        
        const NSInteger location = [_self offsetFromPosition:beginning toPosition:selectionStart];
        const NSInteger length = [_self offsetFromPosition:selectionStart toPosition:selectionEnd];
        return NSMakeRange(location, length);
    };
}

- (UITextView *(^)(BOOL))txtViewEditable
{
    return ^id(BOOL b){
        LinkHandle_REF(UITextView)
        LinkGroupHandle_REF(txtViewEditable,b)
        _self.editable = b;
        return _self;
    };
}

- (UITextView *(^)(BOOL))txtViewSelectable
{
    return ^id(BOOL b){
        LinkHandle_REF(UITextView)
        LinkGroupHandle_REF(txtViewSelectable,b)
        _self.selectable = b;
        return _self;
    };
}
@end
