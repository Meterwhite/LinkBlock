//
//  TImageViewling.h
//  Objcling
//
//  Created by MeterWhite on 2020/9/8.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "Tling.h"

@class TImageViewling;

NS_ASSUME_NONNULL_BEGIN

@protocol TImageViewLetling <NSObject>

@property (readonly) TImageViewling *highlighted;

@property (readonly) TImageViewling *noHighlight;

@end

@interface TImageViewling : Tling

@property (readonly) TImageViewling<TImageViewLetling> *let;

@property (readonly) TImageViewling *(^image)(UIImage *img);

@property (readonly) TImageViewling *(^highlightImage)(UIImage *img);

@property (readonly) TImageViewling *(^highlight)(bool b);

@end


@interface TImageViewling (Generic)

@end

NS_ASSUME_NONNULL_END
