//
//  TLingBranchAction.m
//  ObjcLingDemo
//
//  Created by MeterWhite on 2020/8/23.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TLingBranchAction.h"

@implementation TLingBranchAction

+ (SEL)associatedSEL {
    static SEL _value;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _value = NSSelectorFromString(@"branch");
    });
    return _value;
}

- (NSUInteger)count {
    return 1;
}

@end
