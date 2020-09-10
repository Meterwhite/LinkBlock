//
//  TLabelling.h
//  Objcling
//
//  Created by MeterWhite on 2020/9/8.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TViewling.h"

@class TLabelling;

NS_ASSUME_NONNULL_BEGIN

@protocol TLabeLetlling <NSObject>

@property (readonly) TLabelling<TLabeLetlling> *noLimitLines;

@property (readonly) TLabelling<TLabeLetlling> *alignmentCenter;

@property (readonly) TLabelling<TLabeLetlling> *alignmentRight;

@property (readonly) TLabelling<TLabeLetlling> *alignmentLeft;

@end

@interface TLabelling : TViewling

@property (readonly) TLabelling<TLabeLetlling> *let;

@property (readonly) TLabelling *(^lines)(NSInteger count);

@property (readonly) TLabelling *(^attributedText)(NSAttributedString *s);

@property (readonly) TLabelling *(^alignment)(NSTextAlignment ali);

@end

@interface TLabelling (ObjclingGoing)

@end

NS_ASSUME_NONNULL_END
