//
//  TLingObj.h
//  LinkAnyObjectDemo
//
//  Created by MeterWhite on 2020/8/15.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "TLing.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObjecttring<__covariant ObjectType> : TLing

/// T@"..."
@property (readonly) NSObjecttring *log;
/// T@?
@property (readonly) NSObjecttring *(^more)(id x);


@end

NS_ASSUME_NONNULL_END
