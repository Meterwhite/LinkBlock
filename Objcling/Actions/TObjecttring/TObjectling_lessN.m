//
//  TObjectling_lessN.m
//  Objcling
//
//  Created by MeterWhite on 2020/9/14.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TObjectling_lessN.h"
#import "ObjclingRuntime.h"
#import <objc/runtime.h>
#import "TlingErr.h"

NSMutableString *less_string (TObjectling_lessN* ling, TlingErr **err);

NSMutableArray  *less_col (TObjectling_lessN* ling, TlingErr **err);

NSDecimalNumber *less_number (TObjectling_lessN* ling, TlingErr **err);

UIView *less_view (TObjectling_lessN* act, TlingErr **err);

NSMutableDictionary *less_dic (TObjectling_lessN* act, TlingErr **err);

@interface TObjectling_lessN ()

@property (nonnull,nonatomic,strong) NSMutableArray *args;

@end

@implementation TObjectling_lessN

- (NSMutableArray *)args {
    if(!_args) {
        _args = [NSMutableArray array];
    }
    return _args;
}

#pragma mark - TActionParametric
- (id)sendMsg:(TlingErr * _Nullable __autoreleasing *)err {
    Class c = object_getClass(self.target);
    id rt = nil;
    if([c isSubclassOfClass:NSString.class]) {
        rt = less_string(self, err);
    } else if([c isSubclassOfClass:NSNumber.class]) {
        rt = less_number(self, err);
    } else if([c isSubclassOfClass:UIView.class]) {
        rt = less_view(self, err);
    } else if([c isSubclassOfClass:NSDictionary.class]) {
        rt = less_dic(self, err);
    } else {
        rt = less_col(self, err);
    }
    return self.target == rt ? nil : rt;
}

- (NSUInteger)count {
    return 1;
}

#pragma mark - TActionVariableParametric
- (NSMutableArray *)arrayForValist {
    return self.args;
}

@end

NSMutableString *less_string (TObjectling_lessN* act, TlingErr **err) {
    NSMutableString *rt = ocling_mutablecopy_ifneed(act.target);
    [rt replaceOccurrencesOfString:ocling_to_string(act.at0) withString:@"" options:0 range:NSMakeRange(0, rt.length - 1)];
    if(act.args.count) {
        for (NSString *vaArg in act.args) {
            [rt replaceOccurrencesOfString:ocling_to_string(vaArg) withString:@"" options:0 range:NSMakeRange(0, rt.length - 1)];
        }
    }
    return rt;
}

NSMutableArray *less_col (TObjectling_lessN* act, TlingErr **err) {
    id rt = act.target;
    if(![rt respondsToSelector:@selector(removeObject:)]) {
        // push error
        return act.target;
    }
    [rt removeObject:act.at0];
    if(act.args.count) {
        for (NSString *vaArg in act.args) {
            [rt removeObject:vaArg];
        }
    }
    return rt;
}

NSDecimalNumber *less_number (TObjectling_lessN* act, TlingErr **err) {
    NSDecimalNumber *rt = ocling_get_decimal(act.target);
    NSDecimalNumber *be = ocling_get_decimal(act.at0);
    if(!rt || !be) {
        return act.target;
    }
    rt = [rt decimalNumberBySubtracting:be];
    if(act.args.count) {
        for (id vaArg in act.args) {
            be = ocling_get_decimal(vaArg);
            if(!be) {
                // push error
                return act.target;
            }
            rt = [rt decimalNumberBySubtracting:be];
        }
    }
    return rt;
}

UIView *less_view (TObjectling_lessN* act, TlingErr **err) {
    UIView *rt = act.target;
    if([rt.subviews containsObject:rt]) {
        [rt removeFromSuperview];
    }
    if(act.args.count) {
        for (UIView *vaArg in act.args) {
            if([rt.subviews containsObject:vaArg]) {
                [vaArg removeFromSuperview];
            }
        }
    }
    return rt;
}

NSMutableDictionary *less_dic (TObjectling_lessN* act, TlingErr **err) {
    NSMutableDictionary *rt = ocling_mutablecopy_ifneed(act.target);
    if(![act.at0 isKindOfClass:NSString.class]) {
        // push error
        return act.target;
    }
    [rt removeObjectForKey:act.at0];
    if(act.args.count) {
        for (NSString *k in act.args) {
            if(![k isKindOfClass:NSString.class]) {
                // push error
                return act.target;
            }
            [rt removeObjectForKey:k];
        }
    }
    return rt;
}
