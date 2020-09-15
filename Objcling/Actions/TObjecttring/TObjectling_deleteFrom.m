//
//  TObjectling_deleteFrom.m
//  Objcling
//
//  Created by MeterWhite on 2020/9/15.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TObjectling_deleteFrom.h"
#import "ObjclingRuntime.h"
#import <objc/runtime.h>
#import "TObjectling.h"
#import "TlingErr.h"

void delfrom_string (TObjectling_deleteFrom* act, TlingErr **err) {
    if(!ocling_is_mutableobject(act.at0)) {
        // push error
        return;
    }
    NSMutableString *rt = act.at0;
    if(![act.target isKindOfClass:NSString.class]) {
        // push error
        *err = [[TlingErr allocWith:act.target] initForKind:NSString.class sel:@selector(deleteFrom)];
        return;
    }
    [rt replaceOccurrencesOfString:act.target withString:@"" options:0 range:NSMakeRange(0, rt.length - 1)];
}

void delfrom_array (TObjectling_deleteFrom* act, TlingErr **err) {
    if(!ocling_is_mutableobject(act.at0)) {
        // push error
        return;
    }
    NSMutableArray *rt = act.at0;
    [rt removeObject:act.target];
}

void delfrom_view (TObjectling_deleteFrom* act, TlingErr **err) {
    if(!ocling_is_mutableobject(act.at0)) {
        // push error
        return;
    }
    UIView *rt = act.at0;
    if([rt.subviews containsObject:act.target]) {
        [act.target removeFromSuperview];
    }
}

@implementation TObjectling_deleteFrom

- (id)sendMsg:(TlingErr * _Nullable __autoreleasing *)err {
    ///修改字符串，减少集合内容，视图的移除
    Class c = object_getClass(self.at0);
    if([c isSubclassOfClass:NSString.class]) {
        delfrom_string(self, err);
    } else if([c isSubclassOfClass:NSArray.class]) {
        delfrom_array(self, err);
    } else if([c isSubclassOfClass:UIView.class]) {
        delfrom_view(self, err);
    }
    return nil;
}

@end
