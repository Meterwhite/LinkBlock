//
//  TObjectling_less.m
//  Objcling
//
//  Created by MeterWhite on 2020/9/15.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TObjectling_lessN.h"
#import "TObjectling_less.h"
#import <objc/runtime.h>

@interface TObjectling_less ()

@property (nullable,nonatomic,strong) id args;

@end

@implementation TObjectling_less

- (NSUInteger)count {
    return 1;
}

- (id)sendMsg:(TlingErr * _Nullable __autoreleasing *)err {
    IMP imp = class_getMethodImplementation(TObjectling_lessN.class, _cmd);
    return ((id(*)(id,SEL,TlingErr**))imp)(self, _cmd, err);
}

@end
