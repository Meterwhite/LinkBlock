//
//  NSObjectling_more.m
//  ObjcLingDemo
//
//  Created by MeterWhite on 2020/8/19.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "NSObjectling_moreN.h"
#import "NSObjectling_more.h"
#import <objc/runtime.h>

@interface NSObjectling_more ()
@property (nullable,nonatomic,strong) id args;
@end

@implementation NSObjectling_more

- (NSUInteger)count {
    return 1;
}

- (id)sendMsg:(TLingErr * _Nullable __autoreleasing *)err {
    IMP imp = class_getMethodImplementation(NSObjectling_moreN.class, _cmd);
    return ((id(*)(id,SEL,TLingErr**))imp)(self, _cmd, err);
}

@end
