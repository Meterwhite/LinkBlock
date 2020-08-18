//
//  TLing.h
//  ObjcLing
//
//  Created by MeterWhite on 2020/8/16.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "ALing.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TLingContrl <NSObject>

- (instancetype)trying;

- (instancetype)throwing;

- (id)get;

- (void)done;

@end

/// Ling for type
@interface TLing<__covariant ObjectType> : ALing<TLingContrl>

- (ObjectType)get;

- (void(^)(void))done;

- (instancetype)trying;

- (instancetype)throwing;

@end

NS_ASSUME_NONNULL_END
