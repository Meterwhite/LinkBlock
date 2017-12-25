//
//  LinkFunctionInvocation.m
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/26.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import "LinkFunctionInvocation.h"

@interface LinkFunctionInvocation()
@property (nonatomic,strong) NSInvocation* invocation;
@property (nonatomic,copy) NSString* functionName;
@end

@implementation LinkFunctionInvocation
+ (instancetype)invocationWithCode:(id)code
{
    return nil;
}
#pragma mark - override
- (NSMethodSignature *)methodSignature
{
    return self.invocation.methodSignature;
}
- (BOOL)argumentsRetained
{
    return self.argumentsRetained;
}
- (id)target
{
    return self.invocation.target;
}
- (void)setTarget:(id)target
{
    self.invocation.target = target;
}
- (SEL)selector
{
    return self.invocation.selector;
}
- (void)setSelector:(SEL)selector
{
    self.invocation.selector = selector;
}
- (void)retainArguments
{
    [self.invocation retainArguments];
}
- (void)getReturnValue:(void *)retLoc
{
    [self.invocation getReturnValue:retLoc];
}
- (void)setReturnValue:(void *)retLoc
{
    [self.invocation setReturnValue:retLoc];
}
- (void)getArgument:(void *)argumentLocation atIndex:(NSInteger)idx
{
    [self.invocation getArgument:argumentLocation atIndex:idx];
}
- (void)setArgument:(void *)argumentLocation atIndex:(NSInteger)idx
{
    [self.invocation setArgument:argumentLocation atIndex:idx];
}
- (void)invoke
{
    [self.invocation invoke];
}
- (void)invokeWithTarget:(id)target
{
    [self.invocation invokeWithTarget:target];
}
@end
