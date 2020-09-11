//
//  TDictionaryling.m
//  Objcling
//
//  Created by meterwhite on 2020/8/22.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TDictionaryling.h"

@interface TDictionaryling ()
@property (readonly) TDictionaryling *(^attributedFont)(UIFont *font);

@property (readonly) TDictionaryling *(^attributedColor)(UIColor *color);

@property (readonly) TDictionaryling *(^attributedBgcolor)(UIColor *color);

@property (readonly) TDictionaryling *(^attributedAttachment)(NSTextAttachment* a);

@property (readonly) TDictionaryling *(^attributedParagraph)(NSParagraphStyle *p);

@property (readonly) TDictionaryling *(^attributedLigature)(NSNumber *n);

@property (readonly) TDictionaryling *(^attributedKern)(NSNumber *n);

@property (readonly) TDictionaryling *(^attributedStrikethrough)(NSNumber *n);

@property (readonly) TDictionaryling *(^attributedUnderline)(NSUnderlineStyle u);

@property (readonly) TDictionaryling *(^attributedStrokeColor)(UIColor* c);

@property (readonly) TDictionaryling *(^attributedStrokeWidth)(NSNumber *n);

@property (readonly) TDictionaryling *(^attributedShadow)(NSShadow* s);

@property (readonly) TDictionaryling *(^attributedTextEffect)(NSString* e);

@property (readonly) TDictionaryling *(^attributedLink)(NSURL* url);

@property (readonly) TDictionaryling *(^attributedBaselineOffset)(NSNumber *n);

@property (readonly) TDictionaryling *(^attributedUnderlineColor)(UIColor* c);

@property (readonly) TDictionaryling *(^attributedStrikethroughColor)(UIColor* c);

@property (readonly) TDictionaryling *(^attributedObliquenes)(NSNumber *n);

@property (readonly) TDictionaryling *(^attributedExpansion)(NSNumber *n);

@property (readonly) TDictionaryling *(^attributedWritingDirection)(NSArray* a);

@property (readonly) TDictionaryling *(^attributedVerticalGlyphForm)(NSNumber *n);
@end

@implementation TDictionaryling

- (id)let {
    return self;
}

@end
