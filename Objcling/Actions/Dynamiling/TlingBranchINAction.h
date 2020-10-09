//
//  TlingBranchINAction.h
//  Objcling
//
//  Created by meterwhite on 2020/8/30.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "AlingAction.h"
#import "LingDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface TlingBranchINAction : AlingAction
<
    TActionParametric
>
@property (nullable,nonatomic,copy) TlingBranchIN block;

@end

NS_ASSUME_NONNULL_END
