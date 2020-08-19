//
//  NSObjectling_moreN.h
//  ObjcLing
//
//  Created by MeterWhite on 2020/8/17.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "ALingAction.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObjectling_moreN : ALingAction
<
    TLingParametric,
    TLingVariableParametric
>

@property id at0;

- (NSMutableArray *)arrayForValist;

@end

NS_ASSUME_NONNULL_END
