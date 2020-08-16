//
//  ALing.m
//  LinkAnyObjectDemo
//
//  Created by MeterWhite on 2020/8/15.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "ALing.h"

@interface ALing ()

@end

@implementation ALing

- (instancetype)initWithTarget:(id)tag
{
    self = [super init];
    if (self) {
        targets= [NSMutableArray arrayWithObject:tag];
        safe = ALingSafeStateTriggering;
    }
    return self;
}

- (instancetype)initWithTargets:(NSMutableArray *)tags
{
    self = [super init];
    if (self) {
        targets = tags;
        safe  = ALingSafeStateTriggering;
    }
    return self;
}

+ (instancetype)lingWith:(id)target {
    return [[self alloc] initWithTarget:target];
}

+ (instancetype)lingsWith:(NSMutableArray *)targets {
    return [[self alloc] initWithTargets:targets];
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

- (NSUInteger)count {
    return targets.count;
}

- (TLingErr *)error {
    return error;
}

- (NSUInteger)step {
    return step;
}

- (void)pushError:(TLingErr *)err {
    error = err;
    if(safe == ALingSafeStateThrowing) {
        @throw error;
    }
}

- (Class)dependentClass {
    return nil;
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(__unsafe_unretained id  _Nullable [])buffer count:(NSUInteger)len {
    return [targets countByEnumeratingWithState:state objects:buffer count:len];
}
@end
