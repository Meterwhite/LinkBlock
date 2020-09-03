//
//  Aling.m
//  Objcling
//
//  Created by meterwhite on 2020/8/15.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "AlingStopAction.h"
#import "DynamilingInfo.h"
#import "TlingErr.h"
#import "Aling.h"
#import "Tling.h"

@interface Aling ()

@end

@implementation Aling

- (instancetype)init
{
    self = [super init];
    if (self) {
        dynamicActions = [NSMutableArray arrayWithCapacity:0];
        listeners      = [NSMutableArray arrayWithCapacity:0];
        safe   = AlingSafeKindTriggering;
        status = AlingStatusExecuting;
    }
    return self;
}

- (instancetype)initWithTarget:(id)tag
{
    self = [self init];
    if (self) {
        targets = [NSMutableArray arrayWithObject:tag];
    }
    return self;
}

- (instancetype)initWithTargets:(NSArray *)tags
{
    self = [self init];
    if (self) {
        targets = [tags mutableCopy];
    }
    return self;
}

+ (instancetype)lingWith:(id)target {
    return [[self alloc] initWithTarget:target];
}

+ (instancetype)lingsWith:(NSMutableArray *)targets {
    return [[self alloc] initWithTargets:targets];
}

+ (instancetype)lingByLing:(Aling *)ling {
    Aling *newLing = [[self alloc] init];
    newLing->dynamicActions = ling->dynamicActions;
    newLing->listeners      = ling->listeners;
    newLing->targets        = ling->targets;
    newLing->status         = ling->status;
    newLing->error          = ling->error;
    newLing->safe           = ling->safe;
    newLing->step           = ling->step;
    return newLing;
}

- (id)target {
    return targets.firstObject;
}

- (NSMutableArray *)targets {
    return targets;
}

- (void)switchTarget:(id)target {
    [targets replaceObjectAtIndex:0 withObject:target];
}

- (NSUInteger)itemCount {
    return targets.count;
}

- (void)pushError:(TlingErr *)err {
    err.step = step;
    error    = err;
    if(safe == AlingSafeKindThrowing) {
        @throw error;
    }
}

- (instancetype)stop {
    if(status == AlingStatusReturning || error) {
        return self;
    }
    if(status == AlingStatusFuture) {
        AlingStopAction *act = [[AlingStopAction alloc] init];
        DynamilingInfo *dy = [[DynamilingInfo alloc] init];
        dy.dependentClass  = nil;
        dy.sel             = _cmd;
        act.dynamilingInfo = dy;
        [dynamicActions addObject:act];
    } else {
        status = AlingStatusReturning;        
    }
    return self;
}

- (Class)dependentClass {
    return nil;
}


- (instancetype)copy {
    Aling *newLing = [[self.class alloc] init];
    newLing->dynamicActions = dynamicActions;
    newLing->listeners      = listeners;
    newLing->targets        = targets;
    newLing->status         = status;
    newLing->error          = error;
    newLing->safe           = safe;
    newLing->step           = step;
    return newLing;
}


- (instancetype)mutableCopy {
    Aling *newLing = [[self.class alloc] init];
    newLing->dynamicActions = [dynamicActions mutableCopy];
    newLing->listeners      = [listeners mutableCopy];
    newLing->targets        = [targets mutableCopy];
    newLing->status         = status;
    newLing->error          = error;
    newLing->safe           = safe;
    newLing->step           = step;
    return newLing;
}

#pragma mark - Others

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(__unsafe_unretained id  _Nullable [])buffer count:(NSUInteger)len {
    return [targets countByEnumeratingWithState:state objects:buffer count:len];
}

#ifdef DEBUG
- (void)dealloc {
    NSLog(@"Objcling : dealoc -- ling ");
}
#endif
@end

id _Nonnull DelingWith(Aling * _Nonnull ling) {
    return ling.itemCount == 1 ? ling.target : ling.targets;
}
