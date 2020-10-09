//
//  TlingStopWhileAction.h
//  Objcling
//
//  Created by MeterWhite on 2020/9/3.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "AlingAction.h"

NS_ASSUME_NONNULL_BEGIN

@interface TlingStopWhileAction : AlingAction
<
    TActionParametric
>
@property (nullable,nonatomic) NSPredicate *predicate;

@end

NS_ASSUME_NONNULL_END
