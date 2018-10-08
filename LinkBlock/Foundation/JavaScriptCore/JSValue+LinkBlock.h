//
//  JSValue+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/6/21.
//  Copyright © 2016年 NOVO. All rights reserved.
//
#import "LinkBlockDefine.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface NSObject(JSValueLinkBlock)
LBDeclare JSManagedValue*      (^jsValueToManagedValue)(id owner);
LBDeclare JSValue*             (^jsValueAddToSelfManagedRef)(id owner);
LBDeclare JSValue*             (^jsValueCallFunc)(NSArray* args);
@end
