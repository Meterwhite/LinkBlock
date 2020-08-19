//
//  NSObjectling_more.m
//  ObjcLing
//
//  Created by MeterWhite on 2020/8/17.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "NSObjectling_more.h"
#import <objc/runtime.h>
#import "TLingErr.h"

NSMutableString *more_string (NSObjectling_more* ling);

NSMutableArray  *more_array (NSObjectling_more* ling);

NSDecimalNumber *more_number (NSObjectling_more* ling);

@interface NSObjectling_more ()
@property (nonnull,nonatomic,strong) NSMutableArray *args;
@end

@implementation NSObjectling_more

- (NSMutableArray *)args {
    if(_args) {
        _args = [NSMutableArray array];
    }
    return _args;
}


#pragma mark - TLingParametric
- (id)sendMsg:(TLingErr * _Nullable __autoreleasing *)err {
    Class clz = object_getClass(self.target);
    if([clz isSubclassOfClass:NSString.class]) {
        return more_string(self);
    } else if([clz isSubclassOfClass:NSArray.class]) {
        return more_array(self);
    } else if([clz isSubclassOfClass:NSNumber.class]) {
        return more_number(self);
    }
    return nil;
}

- (NSUInteger)count {
    return 1;
}

#pragma mark - TLingVariableParametric
- (NSMutableArray *)arrayForValist {
    return self.args;
}

@end

NSMutableString *more_string (NSObjectling_more* act) {
    NSMutableString *rt = [act.target mutableCopy];
    [rt appendString:act.at0];
    if(act.args.count) {
        for (NSString *vaArg in act.args) {
            [rt appendString:vaArg];
        }
    }
    return rt;
}

NSMutableArray *more_array (NSObjectling_more* act) {
    NSMutableArray *rt = [[act.target class] isSubclassOfClass:NSMutableArray.class] ? act.target : [act.target mutableCopy];
    [rt addObject:act.at0];
    if(act.args.count) {
        for (NSString *vaArg in act.args) {
            [rt addObject:vaArg];
        }
    }
    return rt;
}

NSDecimalNumber *get_decimal(id x) {
    if([x isKindOfClass:NSNumber.class]) {
        return [NSDecimalNumber decimalNumberWithDecimal:[x decimalValue]];
    }
    if([x isKindOfClass:NSString.class]) {
        return [NSDecimalNumber decimalNumberWithString:x];
    }
    if([x isKindOfClass:NSDecimalNumber.class]) return x;
    return nil;
}

NSDecimalNumber *more_number (NSObjectling_more* act) {
    NSDecimalNumber *rt = get_decimal(act.target);
    NSDecimalNumber *be = get_decimal(act.at0);
    if(!rt || !be) {
        return nil;
    }
    rt = [rt decimalNumberByAdding:be];
    if(act.args.count) {
        for (id vaArg in act.args) {
            rt = [rt decimalNumberByAdding:get_decimal(vaArg)];
            if(!rt) return nil;
        }
    }
    return rt;
}
