//
//  NSObjectling_log.m
//  ObjcLing
//
//  Created by MeterWhite on 2020/8/16.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "NSObjectling_log.h"
#import "ALing.h"

@implementation NSObjectling_log

- (id)sendMsg:(TLingErr * _Nullable __autoreleasing *)err {
    NSLog(@"%@", self.target);
    return nil;
}

@end
