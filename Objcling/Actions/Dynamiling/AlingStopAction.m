//
//  AlingStopAction.m
//  Objcling
//
//  Created by meterwhite on 2020/8/28.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "AlingStopAction.h"
#import "DynamilingInfo.h"
#import "Tling.h"

@implementation AlingStopAction

- (id)sendMsg:(TlingErr * _Nullable __autoreleasing *)err {
    self.dynamiling->status = AlingStatusReturning;
    return nil;
}

@end
