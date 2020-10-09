//
//  TObjectling_appendto.m
//  Objcling
//
//  Created by MeterWhite on 2020/9/12.
//  Copyright © 2020 Meterwhite. All rights reserved.
//



#import <UIKit/UIKit.h>

#import "TObjectling_appendto.h"
#import "ObjclingRuntime.h"
#import <objc/runtime.h>
#import "TObjectling.h"
#import "TlingErr.h"

void appendto_string (TObjectling_appendto* act, TlingErr **err) {
    if(!act.target) {
       /// push error
        *err = [[TlingErr allocWith:act.target] initForParameterNonnull];
        return;
    }
    [act.at0 appendString:act.target];
}

void appendto_col (TObjectling_appendto* act, TlingErr **err) {
    if(![act.at0 respondsToSelector:@selector(addObject:)] || act.target) {
       /// push error
        *err = [[TlingErr allocWith:act.target] initForParameterNonnull];
        return;
    }
    [act.at0 addObject:act.target];
}

void appendto_view (TObjectling_appendto* act, TlingErr **err) {
    if(![act.target isKindOfClass:UIView.class]) {
        /// push error
        *err = [[TlingErr allocWith:act.target] initForKind:UIView.class sel:@selector(appendto)];
        return;
    }
    [act.at0 addSubview:act.target];
}

void appendto_dic (TObjectling_appendto* act, TlingErr **err) {
    if(!act.target || ![act.target isKindOfClass:NSDictionary.class]) {
       /// push error
        return;
    }
    [act.at0 addEntriesFromDictionary:act.target];
}


@implementation TObjectling_appendto

- (id)sendMsg:(TlingErr * _Nullable __autoreleasing *)err {
    if(ocling_is_mutableobject(self.at0)) {
        /// push error
        return nil;
    }
    Class c = object_getClass(self.at0);
    if([c isSubclassOfClass:NSString.class]) {
        appendto_string(self, err);
    } else if([c isSubclassOfClass:UIView.class]) {
        appendto_view(self, err);
    } else if([c isSubclassOfClass:NSDictionary.class]) {
        appendto_dic(self, err);
    } else {
        appendto_col(self, err);
    }
    return nil;
}

- (NSUInteger)count {
    return 1;
}

@end

