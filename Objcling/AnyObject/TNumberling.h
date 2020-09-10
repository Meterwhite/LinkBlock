//
//  TNumberling.h
//  Objcling
//
//  Created by meterwhite on 2020/8/22.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TValueling.h"

NS_ASSUME_NONNULL_BEGIN

@interface TNumberling : TValueling

@property (readonly) TNumberling *(^adding)(id n);
@property (readonly) TNumberling *(^subtracting)(id n);
@property (readonly) TNumberling *(^multiplying)(id n);
@property (readonly) TNumberling *(^dividing)(id n);
@property (readonly) TNumberling *(^equal)(id n);
@property (readonly) TNumberling *(^greatThan)(id n);
@property (readonly) TNumberling *(^greatEqual)(id n);
@property (readonly) TNumberling *(^lessThan)(id n);
@property (readonly) TNumberling *(^lessEqual)(id n);
@property (readonly) TNumberling *(^forLoopIN)(TlingLoopForIN block);
@property (readonly) TNumberling *is0;
@property (readonly) TNumberling *isNaN;
/// 相反数
@property (readonly) TNumberling *opposite;

@end

@interface TNumberling (ObjclingGoing)

@end

NS_ASSUME_NONNULL_END
