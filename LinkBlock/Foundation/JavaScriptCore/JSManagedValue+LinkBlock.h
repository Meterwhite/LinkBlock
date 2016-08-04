//
//  JSManagedValue+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/6/21.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import <JavaScriptCore/JavaScriptCore.h>

@interface NSObject(JSManagedValueLinkBlock)
@property (nonatomic,copy,readonly) JSManagedValue* (^jsManagedValueAddToManagedRef)(JSVirtualMachine* virtualMachine, id owner);
@end
