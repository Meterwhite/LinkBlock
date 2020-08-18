//
//  TLingObj.h
//  ObjcLing
//
//  Created by MeterWhite on 2020/8/15.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "TLing.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObjectling<__covariant ObjectType> : TLing

/// T@"..."
@property (readonly) NSObjectling *log;
/// T@?
@property (readonly) NSObjectling *(^more)(id x);


@end

NS_ASSUME_NONNULL_END
