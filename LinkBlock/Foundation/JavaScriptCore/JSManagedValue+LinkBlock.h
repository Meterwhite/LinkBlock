//
//  JSManagedValue+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/6/21.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface NSObject(JSManagedValueLinkBlock)
/** <^(JSVirtualMachine* virtualMachine, id owner)> */
LBDeclare JSManagedValue* (^jsManagedValueAddToManagedRef)(JSVirtualMachine* virtualMachine, id owner);
@end
