//
//  TObjectling_moreAt.m
//  Objcling
//
//  Created by MeterWhite on 2020/9/12.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TObjectling_moreAt.h"
#import "ObjclingRuntime.h"
#import <objc/runtime.h>

NSMutableString *moreAt_string (TObjectling_moreAt* act, TlingErr **err) {
    NSMutableString *rt = ocling_mutablecopy_ifneed(act.target);
    [rt insertString:act.at0 atIndex:act.at1];
    return rt;
}

NSMutableArray *moreAt_col (TObjectling_moreAt* act, TlingErr **err) {
    id rt = act.target;
    if(![rt respondsToSelector:@selector(insertObject:atIndex:)]) {
        // push error
        return rt;
    }
    [rt insertObject:act.at0 atIndex:act.at1];
    return rt;
}

UIView *moreAt_view (TObjectling_moreAt* act, TlingErr **err) {
    UIView *rt = act.target;
    [rt insertSubview:act.at0 atIndex:act.at1];
    return rt;
}

@implementation TObjectling_moreAt

- (NSUInteger)count {
    return 2;
}

- (id)sendMsg:(TlingErr * _Nullable __autoreleasing *)err {
    Class c = object_getClass(self.target);
    id rt = nil;
    if([c isSubclassOfClass:NSString.class]) {
        rt = moreAt_string(self, err);
    } else if([c isSubclassOfClass:UIView.class]) {
        rt = moreAt_view(self, err);
    } else {
        rt = moreAt_col(self, err);
    }
    return self.target == rt ? nil : rt;
}

@end
