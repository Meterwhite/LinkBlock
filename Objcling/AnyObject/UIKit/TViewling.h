//
//  TViewling.h
//  Objcling
//
//  Created by MeterWhite on 2020/8/25.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TObjectling.h"

@class TViewling;

NS_ASSUME_NONNULL_BEGIN
@protocol TViewLetling <NSObject>


@end

@interface TViewling : TObjectling

@property (readonly) TViewling *(^text)(NSString *txt);

@property (readonly) TViewling<TViewLetling> *hide;
@property (readonly) TViewling<TViewLetling> *noHide;
/// ?
@property (readonly) TViewling *isHidden;

- (TViewling<TViewLetling>*)let;
/// let
@end

NS_ASSUME_NONNULL_END
