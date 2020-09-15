//
//  TObjectling_appendtoAt.h
//  Objcling
//
//  Created by MeterWhite on 2020/9/14.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "AlingAction.h"

NS_ASSUME_NONNULL_BEGIN

@interface TObjectling_appendtoAt : AlingAction
<
    TActionParametric
>
@property (nonatomic) id at0;

@property (nonatomic) NSUInteger at1;

@end

NS_ASSUME_NONNULL_END
