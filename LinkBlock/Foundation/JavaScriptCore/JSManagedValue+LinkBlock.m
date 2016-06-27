//
//  JSManagedValue+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 16/6/21.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation JSManagedValue(JSManagedValueLinkBlock)
- (JSManagedValue *(^)(JSVirtualMachine *,id))jsManagedValueAddToManagedRef
{
    return ^(JSVirtualMachine* virtualMachine,id owner){
        LinkError_REF_AUTO(JSManagedValue, JSManagedValue);
        [virtualMachine addManagedReference:_self withOwner:owner];
        return _self;
    };
}
- (void)setJsManagedValueAddToManagedRef:(JSManagedValue *(^)(JSVirtualMachine *, id))jsManagedValueAddToManagedRef{};
@end
