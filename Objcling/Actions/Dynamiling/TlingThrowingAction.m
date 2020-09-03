//
//  TlingThrowingAction.m
//  Objcling
//
//  Created by meterwhite on 2020/8/30.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TlingThrowingAction.h"
#import "DynamilingInfo.h"
#import "Tling.h"

@implementation TlingThrowingAction

- (id)sendMsg:(TlingErr * _Nullable __autoreleasing *)err {
    self.dynamiling->safe = AlingSafeKindThrowing;
    return nil;
}

@end
