//
//  LinkCommandInvocation.m
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/26.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import "LinkCommandInvocation.h"
#import "LinkHelper.h"

@interface LinkCommandInvocation()
@property (nonatomic,strong) NSInvocation* invocation;

@end

@implementation LinkCommandInvocation
+ (instancetype)invocationWithCommand:(NSString*)command
{
    return [[self alloc] initWithCommand:command];
}

- (instancetype)initWithCommand:(NSString*)command
{
    self = [super init];
    if (self) {
        [NSObject instanceMethodSignatureForSelector:nil];
        NSMethodSignature* sig = [LinkHelper helpSignatureForSelector:@selector(commandInvoke:)];
        self.invocation = [NSInvocation invocationWithMethodSignature:sig];
        self.invocation.target = command;
    }
    return self;
}

#pragma mark - override
- (id)invokeWithTarget:(id)target
{
    if(target){
        [self.invocation setArgument:&target atIndex:2];
    }
    [self.invocation invoke];
    
    id reV;
    [self.invocation getReturnValue:&reV];
    CFBridgingRetain(reV);
    return reV;
}
@end
