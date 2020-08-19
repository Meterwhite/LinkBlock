//
//  NSObjectling.m
//  ObjcLing
//
//  Created by MeterWhite on 2020/8/15.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "NSObjectling.h"

@implementation NSObjectling

- (Class)dependentClass {
    static Class c;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        c = [NSObject class];
    });
    return c;
}

@end
