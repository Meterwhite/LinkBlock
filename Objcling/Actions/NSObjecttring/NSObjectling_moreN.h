//
//  NSObjectling_moreN.h
//  Objcling
//
//  Created by MeterWhite on 2020/8/17.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "AlingAction.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObjectling_moreN : AlingAction
<
    TlingParametric,
    TlingVariableParametric
>

@property id at0;

- (NSMutableArray *)arrayForValist;

@end

NS_ASSUME_NONNULL_END
