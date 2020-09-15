//
//  TObjectling_lessAt.m
//  Objcling
//
//  Created by MeterWhite on 2020/9/15.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TObjectling_lessAt.h"
#import "ObjclingRuntime.h"
#import <objc/runtime.h>

NSMutableString *lessAt_string (TObjectling_lessAt* act, TlingErr **err) {
    NSMutableString *rt = ocling_mutablecopy_ifneed(act.target);
    [rt deleteCharactersInRange:NSMakeRange(act.at0, 1)];
    return rt;
}

NSMutableArray *lessAt_array (TObjectling_lessAt* act, TlingErr **err) {
    NSMutableArray *rt = ocling_mutablecopy_ifneed(act.target);
    if(!act.at0) {
        // push error
        return act.target;
    }
    [rt removeObjectAtIndex:act.at0];
    return rt;
}


UIView *lessAt_view (TObjectling_lessAt* act, TlingErr **err) {
    UIView  *rt = act.target;
    if(act.at0 >= rt.subviews.count) {
        // push error
        return rt;
    }
    [rt.subviews[act.at0] removeFromSuperview];
    return rt;
}

@implementation TObjectling_lessAt

- (id)sendMsg:(TlingErr * _Nullable __autoreleasing *)err {
    ///修改字符串，减少集合内容，视图的移除
    Class c = object_getClass(self.target);
    id rt = nil;
    if([c isSubclassOfClass:NSString.class]) {
        rt = lessAt_string(self, err);
    } else if([c isSubclassOfClass:NSArray.class]) {
        rt = lessAt_array(self, err);
    } else if([c isSubclassOfClass:UIView.class]) {
        rt = lessAt_view(self, err);
    }
    return self.target == rt ? nil : rt;
}

@end
