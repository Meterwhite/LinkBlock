//
//  TDynamiling.h
//  Objcling
//
//  Created by MeterWhite on 2020/9/10.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TObjectling.h"

NS_ASSUME_NONNULL_BEGIN

/// 与NSObject+Objecling.h相同的声明
@interface TDynamiling : NSProxy

/// 空的动态链
@property (readonly,class) TObjectling *ling;
@property (readonly,class) TObjectling *lings;

@end

NS_ASSUME_NONNULL_END
