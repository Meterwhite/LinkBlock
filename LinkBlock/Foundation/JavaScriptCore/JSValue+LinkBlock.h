//
//  JSValue+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/6/21.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import <JavaScriptCore/JavaScriptCore.h>

@interface NSObject(JSValueLinkBlock)
@property (nonatomic,copy) JSManagedValue*      (^jsValueToManagedValue)(id owner);
@property (nonatomic,copy) JSValue*             (^jsValueAddToSelfManagedRef)(id owner);
@property (nonatomic,copy) JSValue*             (^jsValueCallFunc)(NSArray* args);
@end
