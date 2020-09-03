//
//  NSObject+ObjcLing.m
//  Objcling
//
//  Created by meterwhite on 2020/8/17.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "NSObject+Objcling.h"

@implementation NSObject(Objcling)

- (TObjectling *)ling {
    return [TObjectling lingWith:self];
}

- (TObjectling *)lings {
    return [TObjectling lingsWith:(id)self];
}

@end
