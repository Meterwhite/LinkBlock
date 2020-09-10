//
//  TlingStopWhileAction.m
//  Objcling
//
//  Created by MeterWhite on 2020/9/3.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TlingStopWhileAction.h"
#import "DynamilingInfo.h"
#import "Tling.h"

@implementation TlingStopWhileAction

- (id)sendMsg:(TlingErr * _Nullable __autoreleasing *)err {
    Aling *ling = self.dynamiling;
    if([self.predicate evaluateWithObject:DelingWith(ling)]) {
        ling->status = AlingStatusReturning;
    }
    return nil;
}

@end
