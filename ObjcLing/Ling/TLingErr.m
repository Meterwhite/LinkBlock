//
//  TLingErr.m
//  ObjcLing
//
//  Created by MeterWhite on 2020/8/15.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "TLingErr.h"

@implementation TLingErr
@synthesize sender  = _sender;
@synthesize step    = _step;

+ (instancetype)allocWith:(id)sender{
    TLingErr *err = [self alloc];
    err.sender    = sender;
    err.info      = [NSMutableDictionary dictionary];
    return err;
}

- (void)setSender:(id)sender {
    _sender = sender;
    self.info[@"sender"] = sender;
}

- (void)setStep:(NSUInteger)step {
    _step = step;
    self.info[@"step"] = @(step);
}

- (instancetype)initForKind:(Class)clz sel:(SEL)sel {
    NSString *need = NSStringFromClass(clz);
    NSString *but  = NSStringFromClass([self.sender class]);
    NSString *s    = NSStringFromSelector(sel);
    NSString *reason = [NSString stringWithFormat:@"ObjcLing Error: %@(%@) cannot respond to the selector %@. It is not %@.",self.sender, but, s, need];
    return [self initWithName:NSObjectInaccessibleException reason:reason userInfo:self.info];
}

- (instancetype)initForMissingAct:(SEL)sel {
    NSString *s    = NSStringFromSelector(sel);
    NSString *reason = [NSString stringWithFormat:@"ObjcLing Error: Could not find Action object for selector %@.", s];
    return [self initWithName:NSObjectInaccessibleException reason:reason userInfo:self.info];
}

- (instancetype)initForUserDescription:(NSString *)udes {
    return [self initWithName:NSObjectInaccessibleException reason:udes userInfo:self.info];
}
@end
