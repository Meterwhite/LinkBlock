//
//  NSObject+ObjcLing.m
//  ObjcLing
//
//  Created by MeterWhite on 2020/8/17.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "NSObject+ObjcLing.h"

@implementation NSObject(ObjcLing)

- (NSObjectling *)ling {
    return [NSObjectling lingWith:self];
}

- (NSObjectling *)lings {
    return [NSObjectling lingsWith:(id)self];
}

@end
