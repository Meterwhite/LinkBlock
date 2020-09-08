//
//  TObjectling_more.m
//  Objcling
//
//  Created by meterwhite on 2020/8/19.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TObjectling_moreN.h"
#import "TObjectling_more.h"
#import <objc/runtime.h>

@interface TObjectling_more ()
@property (nullable,nonatomic,strong) id args;
@end

@implementation TObjectling_more

- (NSUInteger)count {
    return 1;
}

- (id)sendMsg:(TlingErr * _Nullable __autoreleasing *)err {
    IMP imp = class_getMethodImplementation(TObjectling_moreN.class, _cmd);
    return ((id(*)(id,SEL,TlingErr**))imp)(self, _cmd, err);
}

@end
