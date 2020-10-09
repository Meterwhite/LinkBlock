//
//  TObjectling_appendtoAt.m
//  Objcling
//
//  Created by MeterWhite on 2020/9/14.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TObjectling_appendtoAt.h"
#import "ObjclingRuntime.h"
#import <objc/runtime.h>
#import "TlingErr.h"

void appendtoAt_string (TObjectling_appendtoAt* act, TlingErr **err) {
    if(!act.target) {
        /// push error
        return;
    }
    [act.at0 insertObject:act.target atIndex:act.at1];
}

void appendtoAt_col (TObjectling_appendtoAt* act, TlingErr **err) {
    id rt = act.target;
    if(![act.at0 respondsToSelector:@selector(insertObject:atIndex:)] || !rt) {
        /// push error
        return;
    }
    [act.at0 insertObject:rt atIndex:act.at1];
}

void appendtoAt_view (TObjectling_appendtoAt* act, TlingErr **err) {
    if([act.target isKindOfClass:UIView.class]) {
        /// push error
        return;
    }
    [act.at0 insertSubview:act.target atIndex:act.at1];
}

@implementation TObjectling_appendtoAt

- (id)sendMsg:(TlingErr * _Nullable __autoreleasing *)err {
    if(ocling_is_mutableobject(self.at0)) {
        /// push error
        return nil;
    }
    Class c = object_getClass(self.at0);
    if([c isSubclassOfClass:NSString.class]) {
        appendtoAt_string(self, err);
    } else if([c isSubclassOfClass:UIView.class]) {
        appendtoAt_view(self, err);
    } else {
        appendtoAt_col(self, err);
    }
    return nil;
}

- (NSUInteger)count {
    return 2;
}

@end
