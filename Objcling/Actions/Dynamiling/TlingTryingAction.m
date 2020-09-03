//
//  TlingTryingAction.m
//  Objcling
//
//  Created by meterwhite on 2020/8/30.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TlingTryingAction.h"
#import "DynamilingInfo.h"
#import "Tling.h"

@implementation TlingTryingAction

- (id)sendMsg:(TlingErr * _Nullable __autoreleasing *)err {
    self.dynamiling->safe = AlingSafeKindTrying;
    return nil;
}

@end
