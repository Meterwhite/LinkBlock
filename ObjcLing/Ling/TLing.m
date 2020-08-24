//
//  TLing.m
//  ObjcLing
//
//  Created by MeterWhite on 2020/8/16.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "TLingBranchAction.h"
#import "TDynamicLingInfo.h"
#import "NSObjectling.h"
#import "ALingAction.h"
#import "LingDefines.h"
#import "TLingErr.h"
#import "TLing.h"

@implementation TLing

- (TLing * _Nonnull (^)(TLingBranchIN block))branchIN {
    return ^ TLing *(TLingBranchIN block) {
        // 需要增加act
        if(self->status == ALingStatusFuture) {
            TLingBranchAction *act = [[TLingBranchAction alloc] init];
        }
        return block ? block(self) : self;
    };
}

- (bool (^)(TLingConditionIN))issIN {
    return ^bool(TLingConditionIN block){
        if(self->status == ALingStatusFuture) {
            [self dynamicInvoke];
        }
        return block ? block(self) : true;
    };
}

- (id)get {
    if(status == ALingStatusFuture) {
        [self dynamicInvoke];
    }
    if(error && safe > ALingSafeKindTrying) {
        @throw error;
        return nil;
    }
    step ++;
    if(self.count > 1) return self.targets;
    return self.target;
}

- (instancetype)will {
    step ++;
    status = ALingStatusFuture;
    return self;
}

- (void(^)(void))done {
    if(status == ALingStatusFuture) {
        [self dynamicInvoke];
    }
    if(error && safe > ALingSafeKindTrying) {
        @throw error;
    }
    step ++;
    return ^(){};
}

- (instancetype)trying {
    step ++;
    safe = ALingSafeKindTrying;
    return self;
}

- (instancetype)throwing {
    step ++;
    safe = ALingSafeKindThrowing;
    return self;
}

- (void)dynamicInvoke {
    TLingErr *err;
    NSUInteger index = 0;
    for (ALingAction *act in dynamicActions) {
        for (id tag in targets) {
            if(act.dynamicLingInfo.dependentClass) {
                if(![tag isKindOfClass:act.dynamicLingInfo.dependentClass]) {
                    [self pushError:[[TLingErr allocWith:(self.count > 1) ? self.targets : self.target] initForKind:act.dynamicLingInfo.dependentClass sel:act.dynamicLingInfo.sel]];
                    return;
                }
            }
            [act setTarget:tag];
            id newTag = [act sendMsg:&err];
            if(err) {
                [self pushError:err];
                return;
            }
            if(newTag){
                if(self.count == 1) {
                    [self switchTarget:newTag];
                } else {
                    [targets replaceObjectAtIndex:index withObject:newTag];
                }
            }
        }
        index++;
        step++;
    }
}

@end
