//
//  JSManagedValue+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/6/21.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import <JavaScriptCore/JavaScriptCore.h>

@interface JSManagedValue(JSManagedValueLinkBlock)
@property (nonatomic,copy) JSManagedValue* (^jsManagedValueAddToManagedRef)(JSVirtualMachine* virtualMachine, id owner);
@end
