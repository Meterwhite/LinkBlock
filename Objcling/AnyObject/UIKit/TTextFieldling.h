//
//  TTextFieldling.h
//  Objcling
//
//  Created by MeterWhite on 2020/9/8.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TViewling.h"

NS_ASSUME_NONNULL_BEGIN

@interface TTextFieldling : TViewling

@property (readonly) TTextFieldling *(^alignment)(NSTextAlignment ali);

@property (readonly) TTextFieldling *(^placeholder)(NSString *s);

@property (readonly) TTextFieldling *(^attributedPlaceholder)(NSAttributedString *s);

@property (readonly) TTextFieldling *(^attributedText)(NSAttributedString *s);

@end

@interface TTextFieldling (ObjclingGoing)

@end
NS_ASSUME_NONNULL_END
