//
//  TlingAsserttByAction.m
//  Objcling
//
//  Created by meterwhite on 2020/8/30.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TlingAsserttByAction.h"
#import "DynamilingInfo.h"
#import "Tling.h"

@implementation TlingAsserttByAction

- (id)sendMsg:(TlingErr * _Nullable __autoreleasing *)err {
    NSAssert([self.predicate evaluateWithObject:DelingWith(self.dynamiling)], @"Failure!");
    return nil;
}

@end
