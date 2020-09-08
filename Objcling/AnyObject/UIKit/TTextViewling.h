//
//  TTextViewling.h
//  Objcling
//
//  Created by MeterWhite on 2020/9/8.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "Tling.h"

@class TTextViewling;

NS_ASSUME_NONNULL_BEGIN

@protocol TTextViewLetling <NSObject>

@property (readonly) TTextViewling *editEnable;

@property (readonly) TTextViewling *editDisable;

@property (readonly) TTextViewling *selectEnable;

@property (readonly) TTextViewling *selectDisable;

@end

@interface TTextViewling : Tling

@property (readonly) TTextViewling<TTextViewLetling> *let;

@property (readonly) TTextViewling *(^alignment)(NSTextAlignment ali);

@property (readonly) TTextViewling *(^attributedText)(NSAttributedString *s);

@property (readonly) TTextViewling *(^editable)(bool b);

@property (readonly) TTextViewling *(^selectable)(bool b);

@end

@interface TTextViewling (Generic)

@end
NS_ASSUME_NONNULL_END
