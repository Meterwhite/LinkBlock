//
//  TlingAsserttINAction.m
//  Objcling
//
//  Created by meterwhite on 2020/8/30.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TlingAsserttINAction.h"
#import "DynamilingInfo.h"
#import "Tling.h"

@implementation TlingAsserttINAction

- (id)sendMsg:(TlingErr * _Nullable __autoreleasing *)err {
    NSAssert(self.block ? self.block(DelingWith(self.dynamiling)) : true, @"Failure!");
    return nil;
}

@end
