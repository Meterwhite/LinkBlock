//
//  TlingBranchINAction.m
//  Objcling
//
//  Created by meterwhite on 2020/8/30.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TlingBranchINAction.h"
#import "DynamilingInfo.h"
#import "Aling.h"

@implementation TlingBranchINAction

- (id)sendMsg:(TlingErr * _Nullable __autoreleasing *)err {
    return self.block ? self.block(self.dynamiling) : (id)self.dynamiling;
}

@end
