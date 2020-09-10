//
//  Tling.m
//  Objcling
//
//  Created by meterwhite on 2020/8/16.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "TlingStopWhileAction.h"
#import "TlingNotifiedINAction.h"
#import "TlingAsserttByAction.h"
#import "TlingAsserttINAction.h"
#import "TlingThrowingAction.h"
#import "TlingBranchINAction.h"
#import "TlingTryingAction.h"
#import "DynamilingInfo.h"
#import "TlingListener.h"
#import <objc/runtime.h>
#import "TObjectling.h"
#import "AlingAction.h"
#import "LingDefines.h"
#import "TlingErr.h"
#import "Tling.h"

NSDictionary *arrayToDictionary(NSArray *a);

@implementation Tling

- (instancetype)let {
    return self;
}

- (id)get {
    NSAssert(status != AlingStatusFuture, @"Cannot be applied to dynamic ling.");
    if(error) {
        if(safe > AlingSafeKindTrying) @throw error;
        return nil;
    }
    step++;
    if(self.itemCount > 1) return self.targets;
    return self.target;
}

- (bool)getBool {
    NSAssert(status != AlingStatusFuture, @"Cannot be applied to dynamic ling.");
    if(error) {
        if(safe > AlingSafeKindTrying) @throw error;
        return false;
    }
    step++;
    NSAssert(self.itemCount == 1, @"Cannot be applied to lings");
    id x = self.target;
    /// 数字，字符串
    if([x respondsToSelector:@selector(boolValue)]) {
        return [x boolValue];
    }
    return x;
}

- (NSInteger)getInt {
    NSAssert(status != AlingStatusFuture, @"Cannot be applied to dynamic ling.");
    if(error) {
        if(safe > AlingSafeKindTrying) @throw error;
        return 0;
    }
    step++;
    NSAssert(self.itemCount == 1, @"Cannot be applied to lings");
    id x = self.target;
    /// 数字，字符串
    if([x respondsToSelector:@selector(integerValue)]) {
        return [x integerValue];
    }
    return 0;
}

- (NSUInteger)getUInt {
    NSAssert(status != AlingStatusFuture, @"Cannot be applied to dynamic ling.");
    if(error) {
        if(safe > AlingSafeKindTrying) @throw error;
        return 0;
    }
    step++;
    NSAssert(self.itemCount == 1, @"Cannot be applied to lings");
    id x = self.target;
    /// 数字，字符串
    if([x respondsToSelector:@selector(unsignedIntegerValue)]) {
        return [x unsignedIntegerValue];
    } else if([x isKindOfClass:NSString.class]) {
        return [[NSDecimalNumber decimalNumberWithString:x] unsignedIntegerValue];
    }
    return 0;
}

- (float)getFloat {
    NSAssert(status != AlingStatusFuture, @"Cannot be applied to dynamic ling.");
    if(error) {
        if(safe > AlingSafeKindTrying) @throw error;
        return 0.0;
    }
    step++;
    NSAssert(self.itemCount == 1, @"Cannot be applied to lings");
    id x = self.target;
    /// 数字，字符串
    if([x respondsToSelector:@selector(floatValue)]) {
        return [x floatValue];
    }
    return 0.0;
}

- (double)getDouble {
    NSAssert(status != AlingStatusFuture, @"Cannot be applied to dynamic ling.");
    if(error) {
        if(safe > AlingSafeKindTrying) @throw error;
        return 0.0;
    }
    step++;
    NSAssert(self.itemCount == 1, @"Cannot be applied to lings");
    id x = self.target;
    /// 数字，字符串
    if([x respondsToSelector:@selector(doubleValue)]) {
        return [x doubleValue];
    }
    return 0;
}

- (NSString *)getString {
    NSAssert(status != AlingStatusFuture, @"Cannot be applied to dynamic ling.");
    if(error) {
        if(safe > AlingSafeKindTrying) @throw error;
        return nil;
    }
    step++;
    NSAssert(self.itemCount == 1, @"Cannot be applied to lings");
    id x = self.target;
    /// 数字  字符串  类
    if([x isKindOfClass:NSString.class]) return x;
    if([x isKindOfClass:NSValue.class]) return [x stringValue];
    if(object_isClass(x)) return NSStringFromClass(x);
    return [x description];
}

- (NSArray *)getArray {
    NSAssert(status != AlingStatusFuture, @"Cannot be applied to dynamic ling.");
    if(error) {
        if(safe > AlingSafeKindTrying) @throw error;
        return nil;
    }
    step++;
    NSAssert(self.itemCount == 1, @"Cannot be applied to lings");
    id x = self.target;
    if([x isKindOfClass:NSArray.class]) return x;
    if([x respondsToSelector:@selector(allObjects)]) return [x allObjects];
    if([x respondsToSelector:@selector(array)]) return [x array];
    return nil;
}

- (NSDictionary *)getDictionary {
    NSAssert(status != AlingStatusFuture, @"Cannot be applied to dynamic ling.");
    if(error) {
        if(safe > AlingSafeKindTrying) @throw error;
        return nil;
    }
    step++;
    NSAssert(self.itemCount == 1, @"Cannot be applied to lings");
    id x = self.target;
    if([x isKindOfClass:NSDictionary.class]) return x;
    if([x respondsToSelector:@selector(dictionaryRepresentation)]) return [x dictionaryRepresentation];
    if([x isKindOfClass:NSArray.class]) return arrayToDictionary(x);
    return nil;
}

- (NSNumber *)getNumber {
    NSAssert(status != AlingStatusFuture, @"Cannot be applied to dynamic ling.");
    if(error) {
        if(safe > AlingSafeKindTrying) @throw error;
        return nil;
    }
    step++;
    NSAssert(self.itemCount == 1, @"Cannot be applied to lings");
    id x = self.target;
    /// 字符串， 数字
    if([x isKindOfClass:NSNumber.class]) return x;
    if([x isKindOfClass:NSString.class]) return [NSDecimalNumber decimalNumberWithString:x];
    return nil;
}

- (bool (^)(TlingConditionIN))issIN {
    return ^bool(TlingConditionIN block) {
        NSAssert(self->status != AlingStatusFuture, @"Cannot be applied to dynamic ling.");
        if(self->error) {
            if(self->safe > AlingSafeKindTrying) @throw self->error;
            return false;
        }
        return block ? block(DelingWith(self)) : false;
    };
}

- (bool (^)(NSPredicate * _Nonnull))predicated {
    return ^bool(NSPredicate *p) {
        NSAssert(self->status != AlingStatusFuture, @"Cannot be applied to dynamic ling.");
        if(self->error) {
            if(self->safe > AlingSafeKindTrying) @throw self->error;
            return false;
        }
        return [p evaluateWithObject:DelingWith(self)];
    };
}

- (Tling * _Nonnull (^)(NSNotificationName _Nonnull, TlingNotifiedIN))notifiedIN {
    return ^Tling *(NSNotificationName nam, TlingNotifiedIN block) {
        if(self->status == AlingStatusReturning) return self;
        if(self->error) {
            if(self->safe > AlingSafeKindTrying) @throw self->error;
            return self;
        }
        if(self->status == AlingStatusFuture) {
            TlingNotifiedINAction *act = [[TlingNotifiedINAction alloc] init];
            DynamilingInfo *info    = [[DynamilingInfo alloc] init];
            info.dependentClass     = self.dependentClass;
            info.sel                = _cmd;
            act.dynamilingInfo      = info;
            
            [self->dynamicActions addObject:act];
        }
        self->step++;
        TlingListener *lis = [[TlingListener alloc] initWithNotice:nam];
        __weak typeof(self) welf = self;
        [lis setWhenNotified:^(NSNotification * _Nonnull ntf) {
            if(!block) return;
            block(DelingWith(welf), ntf);
        }];
        [self->listeners addObject:lis];
        return self;
    };
}

- (void(^)(void))done {
    NSAssert(status != AlingStatusFuture, @"Cannot be applied to dynamic ling.");
    if(error && safe > AlingSafeKindTrying) {
        @throw error;
    }
    step++;
    return ^() {};
}

- (instancetype)trying {
    if(status == AlingStatusReturning) return self;
    if(error) {
        if(safe > AlingSafeKindTrying) @throw error;
        return nil;
    }
    if(status == AlingStatusFuture) {
        TlingTryingAction *act  = [[TlingTryingAction alloc] init];
        DynamilingInfo *info    = [[DynamilingInfo alloc] init];
        info.dependentClass     = self.dependentClass;
        info.sel                = _cmd;
        act.dynamilingInfo      = info;
        [dynamicActions addObject:act];
        return self;
    }
    step++;
    safe = AlingSafeKindTrying;
    return self;
}

- (instancetype)throwing {
    if(status == AlingStatusReturning) return self;
    if(error) {
        if(safe > AlingSafeKindTrying) @throw error;
        return nil;
    }
    if(status == AlingStatusFuture) {
        TlingThrowingAction *act  = [[TlingThrowingAction alloc] init];
        DynamilingInfo *info    = [[DynamilingInfo alloc] init];
        info.dependentClass     = self.dependentClass;
        info.sel                = _cmd;
        act.dynamilingInfo      = info;
        [dynamicActions addObject:act];
        return self;
    }
    step++;
    safe = AlingSafeKindThrowing;
    return self;
}

- (Tling * _Nonnull (^)(NSPredicate * _Nonnull))stopWhile {
    return ^ Tling *(NSPredicate *p) {
        if(self->status == AlingStatusReturning) return self;
        if(self->error) {
            if(self->safe > AlingSafeKindTrying) @throw self->error;
            return self;
        }
        if(self->status == AlingStatusFuture) {
            TlingStopWhileAction *act = [[TlingStopWhileAction alloc] init];
            DynamilingInfo *info = [[DynamilingInfo alloc] init];
            info.dependentClass  = self.dependentClass;
            info.sel             = @selector(asserttBy);
            act.dynamilingInfo   = info;
            act.predicate        = p;
            [self->dynamicActions addObject:act];
            return self;
        }
        self->step++;
        if([p evaluateWithObject:DelingWith(self)]) {
            self->status = AlingStatusReturning;
        }
        return self;
    };
}

- (Tling * _Nonnull (^)(TlingBranchIN block))branchIN {
    return ^ Tling *(TlingBranchIN block) {
        if(self->status == AlingStatusReturning) return self;
        if(self->error) {
            if(self->safe > AlingSafeKindTrying) @throw self->error;
            return self;
        }
        if(self->status == AlingStatusFuture) {
            TlingBranchINAction *act = [[TlingBranchINAction alloc] init];
            DynamilingInfo *info   = [[DynamilingInfo alloc] init];
            info.dependentClass    = self.dependentClass;
            info.sel               = @selector(branchIN);
            act.dynamilingInfo     = info;
            act.block              = [block copy];
            [self->dynamicActions addObject:act];
            return self;
        }
        self->step++;
        return block ? block(self) : self;
    };
}

- (Tling * _Nonnull (^)(NSPredicate * _Nonnull))asserttBy {
    return ^ Tling *(NSPredicate *p) {
        if(self->status == AlingStatusReturning) return self;
        if(self->error) {
            if(self->safe > AlingSafeKindTrying) @throw self->error;
            return self;
        }
        if(self->status == AlingStatusFuture) {
            TlingAsserttByAction *act = [[TlingAsserttByAction alloc] init];
            DynamilingInfo *info   = [[DynamilingInfo alloc] init];
            info.dependentClass    = self.dependentClass;
            info.sel               = @selector(asserttBy);
            act.dynamilingInfo     = info;
            act.predicate          = p;
            [self->dynamicActions addObject:act];
            return self;
        }
        self->step++;
        NSAssert([p evaluateWithObject:DelingWith(self)], @"Failure!");
        return self;
    };
}

- (Tling * _Nonnull (^)(TlingConditionIN))asserttIN {
    return ^ Tling *(TlingConditionIN block) {
        if(self->status == AlingStatusReturning) return self;
        if(self->error) {
            if(self->safe > AlingSafeKindTrying) @throw self->error;
            return self;
        }
        if(self->status == AlingStatusFuture) {
            TlingAsserttINAction *act = [[TlingAsserttINAction alloc] init];
            DynamilingInfo *info   = [[DynamilingInfo alloc] init];
            info.dependentClass    = self.dependentClass;
            info.sel               = @selector(asserttIN);
            act.dynamilingInfo     = info;
            act.block              = block;
            [self->dynamicActions addObject:act];
            return self;
        }
        self->step++;
        NSAssert(block ? block(DelingWith(self)) : true, @"Failure!");
        return self;
    };
}

#pragma mark - 动态化

- (instancetype)will {
    NSAssert(status != AlingStatusFuture, @"Cannot be dynamized multiple times.");
    if(self->status == AlingStatusReturning) return self;
    step++;
    status = AlingStatusFuture;
    return self;
}

- (Tling *)go {
    if(error) {
        if(safe > AlingSafeKindTrying) @throw error;
        return self;
    }
    if(status == AlingStatusFuture) {
        return [self dynamilingGo:nil s:nil];
    }
    step++;
    /// Nothing
    return self;
}

- (Tling * _Nonnull (^)(id _Nonnull))goBy {
    return ^Tling *(id target) {
        if(self->error) {
            if(self->safe > AlingSafeKindTrying) @throw self->error;
            return self;
        }
        if(self->status == AlingStatusFuture) {
            return [self dynamilingGo:target s:nil];
        }
        self->step++;
        /// Nothing
        return self;
    };
}

- (Tling * _Nonnull (^)(NSArray * _Nonnull))goBys {
    return ^Tling *(id targets) {
        if(self->error) {
            if(self->safe > AlingSafeKindTrying) @throw self->error;
            return self;
        }
        if(self->status == AlingStatusFuture) {
            return [self dynamilingGo:nil s:targets];
        }
        self->step++;
        /// Nothing
        return self;
    };
}

- (Tling *(^)(NSNotificationName _Nonnull))notifiedGo {
    return ^Tling *(NSNotificationName nam) {
        NSAssert(self->status == AlingStatusFuture, @"Cannot be applied to non-dynamic ling.");
        if(self->error) {
            if(self->safe > AlingSafeKindTrying) @throw self->error;
            return self;
        }
        __weak typeof(self) welf = self;
        TlingListener *lis = [[TlingListener alloc] initWithNotice:nam];
        [lis setWhenNotified:^(NSNotification * _Nonnull ntf) {
            [welf dynamilingGo:nil s:nil];
        }];
        [self->listeners addObject:lis];
        self->step++;
        return self;
    };
}

#pragma mark - dynamic
- (__kindof Aling *)dynamilingGo:(id)target s:(id)targets{
    TlingErr *err;
    NSUInteger index = 0;
    /// 使用模拟的链
    Tling *_self = [[Tling alloc] init];
    _self->status  = AlingStatusExecuting;
    _self->targets = target ?: targets ?: nil;
    for (AlingAction *act in dynamicActions) {
        act.dynamilingInfo.dynamiling = _self;
        for (id x in targets) {
            /// 控制
            if(_self->status == AlingStatusReturning) {
                goto CALL_END;
            }
            if(_self->error) {
                if(_self->safe > AlingSafeKindTrying) @throw _self->error;
                goto CALL_END;
            }
            if(act.dynamilingInfo.dependentClass) {
                if(![x isKindOfClass:act.dynamilingInfo.dependentClass]) {
                    [_self pushError:[[TlingErr allocWith:(_self.itemCount > 1) ? _self.targets : self.target] initForKind:act.dynamilingInfo.dependentClass sel:act.dynamilingInfo.sel]];
                    goto CALL_END;
                }
            }
            /// 调用
            [act setTarget:x];
            id newTag = [act sendMsg:&err];
            if(err) {
                /// 处理错误
                [_self pushError:err];
                goto CALL_END;
            }
            if(newTag) {
                /// 新的对象
                if(self.itemCount == 1) {
                    [_self switchTarget:newTag];
                } else {
                    [_self->targets replaceObjectAtIndex:index withObject:newTag];
                }
            }
        }
        index++;
        _self->step++;
    }
CALL_END: return _self;
}

@end


NSDictionary *arrayToDictionary(NSArray *a) {
    NSMutableDictionary *d = [NSMutableDictionary dictionary];
    for (NSInteger i = 0; i < a.count; i++) {
        d[@(i)] = a[i];
    }
    return [d copy];
}
