//
//  TDictionaryling.h
//  Objcling
//
//  Created by meterwhite on 2020/8/22.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "Tling.h"

@class TDictionaryling;

NS_ASSUME_NONNULL_BEGIN

@protocol TDictionaryLetling <NSObject>

@property (readonly)
TDictionaryling<TDictionaryLetling>* (^attributedFont)(UIFont *font);

@property (readonly)
TDictionaryling<TDictionaryLetling>* (^attributedColor)(UIColor *color);

@property (readonly)
TDictionaryling<TDictionaryLetling>* (^attributedBgcolor)(UIColor *color);

@property (readonly)
TDictionaryling<TDictionaryLetling>* (^attributedAttachment)(NSTextAttachment* a);

@property (readonly)
TDictionaryling<TDictionaryLetling>* (^attributedParagraph)(NSParagraphStyle *p);

@property (readonly)
TDictionaryling<TDictionaryLetling>* (^attributedLigature)(NSNumber *n);

@property (readonly)
TDictionaryling<TDictionaryLetling>* (^attributedKern)(NSNumber *n);

@property (readonly)
TDictionaryling<TDictionaryLetling>* (^attributedStrikethrough)(NSNumber *n);

@property (readonly)
TDictionaryling<TDictionaryLetling>* (^attributedUnderline)(NSUnderlineStyle u);

@property (readonly)
TDictionaryling<TDictionaryLetling>* (^attributedStrokeColor)(UIColor* c);

@property (readonly)
TDictionaryling<TDictionaryLetling>* (^attributedStrokeWidth)(NSNumber *n);

@property (readonly)
TDictionaryling<TDictionaryLetling>* (^attributedShadow)(NSShadow* s);

@property (readonly)
TDictionaryling<TDictionaryLetling>* (^attributedTextEffect)(NSString* e);

@property (readonly)
TDictionaryling<TDictionaryLetling>* (^attributedLink)(NSURL* url);

@property (readonly)
TDictionaryling<TDictionaryLetling>* (^attributedBaselineOffset)(NSNumber *n);

@property (readonly)
TDictionaryling<TDictionaryLetling>* (^attributedUnderlineColor)(UIColor* c);

@property (readonly)
TDictionaryling<TDictionaryLetling>* (^attributedStrikethroughColor)(UIColor* c);

@property (readonly)
TDictionaryling<TDictionaryLetling>* (^attributedObliquenes)(NSNumber *n);

@property (readonly)
TDictionaryling<TDictionaryLetling>* (^attributedExpansion)(NSNumber *n);

@property (readonly)
TDictionaryling<TDictionaryLetling>* (^attributedWritingDirection)(NSArray* a);

@property (readonly)
TDictionaryling<TDictionaryLetling>* (^attributedVerticalGlyphForm)(NSNumber *n);



@end

@interface TDictionaryling : Tling

@property (readonly) TDictionaryling<TDictionaryLetling> *let;

@property (readonly) TDictionaryling *(^object)(id<NSCopying> forKey);
@property (readonly) TDictionaryling *(^setObject)(id obj, id<NSCopying> forKey);
@property (readonly) TDictionaryling *(^containsKey)(id<NSCopying> k);
@property (readonly) TDictionaryling *(^containsValue)(id<NSCopying> k);
@property (readonly) TDictionaryling *(^keysOfValue)(id value);
@property (readonly) TDictionaryling *(^addEntries)(NSDictionary *dic);

@end

@interface TDictionaryling<__covariant TargetType> (Generic)

@end

NS_ASSUME_NONNULL_END
