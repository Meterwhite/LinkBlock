//
//  TObjectling_lessN.h
//  Objcling
//
//  Created by MeterWhite on 2020/9/14.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "AlingAction.h"

NS_ASSUME_NONNULL_BEGIN

@interface TObjectling_lessN : AlingAction
<
    TActionParametric,
    TActionVariableParametric
>

@property (nonatomic) id at0;

- (NSMutableArray *)arrayForValist;

@end

NS_ASSUME_NONNULL_END
