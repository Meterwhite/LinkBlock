//
//  TlingAsserttByAction.h
//  Objcling
//
//  Created by meterwhite on 2020/8/30.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "AlingAction.h"

NS_ASSUME_NONNULL_BEGIN

@interface TlingAsserttByAction : AlingAction
<
    TActionParametric
>
@property (nullable,nonatomic) NSPredicate *predicate;

@end

NS_ASSUME_NONNULL_END
