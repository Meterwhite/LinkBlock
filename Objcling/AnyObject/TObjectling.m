//
//  TObjectling.m
//  Objcling
//
//  Created by meterwhite on 2020/8/15.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "TObjectling.h"

@implementation TObjectling

- (Class)dependentClass {
    static Class c;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        c = [NSObject class];
    });
    return c;
}

@end
