//
//  NSObjectling_log.m
//  Objcling
//
//  Created by MeterWhite on 2020/8/16.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "NSObjectling_log.h"
#import "Aling.h"

@implementation NSObjectling_log

- (id)sendMsg:(TlingErr * _Nullable __autoreleasing *)err {
    NSLog(@"%@", self.target);
    return nil;
}

@end
