//
//  TObjectling_kvcClean.h
//  Objcling
//
//  Created by MeterWhite on 2020/9/30.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "AlingAction.h"

NS_ASSUME_NONNULL_BEGIN

@interface TObjectling_kvcClean : AlingAction
<
    TActionParametric,
    TActionVariableParametric
>

@property (nonatomic) NSString *at0;

- (NSMutableArray *)arrayForValist;
@end

NS_ASSUME_NONNULL_END
