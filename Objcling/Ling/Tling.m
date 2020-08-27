//
//  Tling.m
//  Objcling
//
//  Created by MeterWhite on 2020/8/16.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "TlingBranchAction.h"
#import "DynamilingInfo.h"
#import "TlingListener.h"
#import "TObjectling.h"
#import "AlingAction.h"
#import "LingDefines.h"
#import "TlingErr.h"
#import "Tling.h"

@implementation Tling

//- (Tling * _Nonnull (^)(TlingBranchIN block))branchIN {
//    return ^ Tling *(TlingBranchIN block) {
//        // 需要增加act
//        if(self->status == ALingStatusFuture) {
//            TlingBranchAction *act = [[TlingBranchAction alloc] init];
//        }
//        return block ? block(self) : self;
//    };
//}

- (Tling *(^)(NSNotificationName _Nonnull))notifiedDone {
    if(error) {
        if(safe > ALingSafeKindTrying) {
            @throw error;
            return nil;
        } else {
            return ^Tling *(NSNotificationName nam){
                return self;
            };
        }
    }
    return ^Tling *(NSNotificationName nam){
        __weak typeof(self) welf = self;
        TlingListener *lis = [[TlingListener alloc] initWithNotice:nam];
        [lis setWhenNotified:^(NSNotification * _Nonnull ntf) {
            [welf dynamicInvoke];
        }];
        [self->listeners addObject:lis];
        return self;
    };
}

- (Tling * _Nonnull (^)(NSNotificationName _Nonnull, TlingNotifiedIN))notifiedIN {
    if(error) {
        if(safe > ALingSafeKindTrying) {
            @throw error;
            return nil;
        } else {
            return ^Tling *(NSNotificationName nam, TlingNotifiedIN block){
                return self;
            };
        }
    }
    return ^Tling *(NSNotificationName nam, TlingNotifiedIN block){
        TlingListener *lis = [[TlingListener alloc] initWithNotice:nam];
        __weak typeof(self) welf = self;
        [lis setWhenNotified:^(NSNotification * _Nonnull ntf) {
            if(!block) return;
            if(welf.count == 1) {
                block(welf.target, ntf);
            } else {
                block(welf.targets, ntf);
            }
        }];
        [self->listeners addObject:lis];
        return self;
    };
}

- (bool (^)(TlingConditionIN))issIN {
    return ^bool(TlingConditionIN block){
        if(self.error) {
            return false;
        }
        if(self->status == ALingStatusFuture) {
            [self dynamicInvoke];
        }
        return block ? block(self) : false;
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

#pragma mark - dynamic
- (void)dynamicInvoke {
    TlingErr *err;
    NSUInteger index = 0;
    for (AlingAction *act in dynamicActions) {
        for (id x in targets) {
            if(act.dynamilingInfo.dependentClass) {
                if(![x isKindOfClass:act.dynamilingInfo.dependentClass]) {
                    [self pushError:[[TlingErr allocWith:(self.count > 1) ? self.targets : self.target] initForKind:act.dynamilingInfo.dependentClass sel:act.dynamilingInfo.sel]];
                    return;
                }
            }
            [act setTarget:x];
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
