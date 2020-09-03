//
//  TlingNotifiedINAction.m
//  Objcling
//
//  Created by meterwhite on 2020/8/30.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TlingNotifiedINAction.h"
#import "DynamilingInfo.h"
#import "TlingListener.h"
#import "Tling.h"

@implementation TlingNotifiedINAction

- (id)sendMsg:(TlingErr * _Nullable __autoreleasing *)err {
    TlingListener *lis = [[TlingListener alloc] initWithNotice:self.nam];
    __weak typeof(self) welf = self;
    [lis setWhenNotified:^(NSNotification * _Nonnull ntf) {
        if(!welf.block) return;
        welf.block(DelingWith(welf.dynamilingInfo.dynamiling), ntf);
    }];
    [self.dynamiling->listeners addObject:lis];
    return nil;
}

@end
