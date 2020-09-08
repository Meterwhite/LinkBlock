//
//  TObjectling_log.m
//  Objcling
//
//  Created by meterwhite on 2020/8/16.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "TObjectling_log.h"
#import "Aling.h"

@implementation TObjectling_log

- (id)sendMsg:(TlingErr * _Nullable __autoreleasing *)err {
    NSLog(@"%@", self.target);
    return nil;
}

@end
