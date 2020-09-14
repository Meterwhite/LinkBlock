//
//  TObjectling_moreN.m
//  Objcling
//
//  Created by meterwhite on 2020/8/17.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TObjectling_moreN.h"
#import "ObjclingRuntime.h"
#import <objc/runtime.h>
#import "TlingErr.h"

NSMutableString *more_string (TObjectling_moreN* ling, TlingErr **err);

NSMutableArray  *more_array (TObjectling_moreN* ling, TlingErr **err);

NSDecimalNumber *more_number (TObjectling_moreN* ling, TlingErr **err);

UIView *more_view (TObjectling_moreN* act, TlingErr **err);

NSMutableDictionary *more_dic (TObjectling_moreN* act, TlingErr **err);

@interface TObjectling_moreN ()
@property (nonnull,nonatomic,strong) NSMutableArray *args;
@end

@implementation TObjectling_moreN

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
        rt = more_string(self, err);
    } else if([c isSubclassOfClass:NSArray.class]) {
        rt = more_array(self, err);
    } else if([c isSubclassOfClass:NSNumber.class]) {
        rt = more_number(self, err);
    } else if([c isSubclassOfClass:UIView.class]) {
        rt = more_view(self, err);
    } else if([c isSubclassOfClass:NSDictionary.class]) {
        rt = more_dic(self, err);
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

NSMutableString *more_string (TObjectling_moreN* act, TlingErr **err) {
    NSMutableString *rt = ocling_mutablecopy_ifneed(act.target);
    [rt appendString:act.at0];
    if(act.args.count) {
        for (NSString *vaArg in act.args) {
            [rt appendString:vaArg];
        }
    }
    return rt;
}

NSMutableArray *more_array (TObjectling_moreN* act, TlingErr **err) {
    NSMutableArray *rt = ocling_mutablecopy_ifneed(act.target);
    [rt addObject:act.at0];
    if(act.args.count) {
        for (NSString *vaArg in act.args) {
            [rt addObject:vaArg];
        }
    }
    return rt;
}

NSDecimalNumber *more_number (TObjectling_moreN* act, TlingErr **err) {
    NSDecimalNumber *rt = ocling_get_decimal(act.target);
    NSDecimalNumber *be = ocling_get_decimal(act.at0);
    if(!rt || !be) {
        return nil;
    }
    rt = [rt decimalNumberByAdding:be];
    if(act.args.count) {
        for (id vaArg in act.args) {
            rt = [rt decimalNumberByAdding:ocling_get_decimal(vaArg)];
            if(!rt) return nil;
        }
    }
    return rt;
}

UIView *more_view (TObjectling_moreN* act, TlingErr **err) {
    UIView *rt = act.target;
    [rt addSubview:act.at0];
    return rt;
}

NSMutableDictionary *more_dic (TObjectling_moreN* act, TlingErr **err) {
    NSMutableDictionary *rt = ocling_mutablecopy_ifneed(act.target);
    [rt addEntriesFromDictionary:act.at0];
    return rt;
}
