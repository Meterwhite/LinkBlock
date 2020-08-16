//
//  NSObjecttring_log.m
//  LinkAnyObjectDemo
//
//  Created by MeterWhite on 2020/8/16.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "NSObjecttring_log.h"
#import "ALing.h"

@implementation NSObjecttring_log

- (id)sendMsg:(TLingErr * _Nullable __autoreleasing *)err {
    NSLog(@"%@", self.tag);
    return nil;
}

@end
