//
//  JSContext+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/6/21.
//  Copyright © 2016年 NOVO. All rights reserved.
//
#import "LinkBlockDefine.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface NSObject(JSContextLinkBlock)

#pragma mark - Foundation Speed/速度
LBDeclare JSValue*     (^jsContextValue)(id key);
LBDeclare JSContext*   (^jsContextSetValue)(NSObject <NSCopying> * key, id value);
LBDeclare JSValue*     (^jsContextEval)(NSString* script);
LBDeclare JSValue*     (^jsContextCallFunc)(NSString* func , NSArray* args);

#pragma mark - LinkBlock

LBDeclare JSValue*     (^jsContextGetElementById)(NSString* elementId, NSString* appendScript);
LBDeclare JSValue*     (^jsContextGetElementsByName)(NSString* name, NSString* appendScript);
LBDeclare JSValue*     (^jsContextGetElementsByTagName)(NSString* tagName, NSString* appendScript);
LBDeclare NSString*    (^jsContextTitle)(void);
LBDeclare NSString*    (^jsContextHTML)(void);
LBDeclare NSString*    (^jsContextLocationHref)(void);
LBDeclare JSContext*   (^jsContextLocationReload)(void);
LBDeclare JSContext*   (^jsContextWrite)(NSString* str);
LBDeclare JSContext*   (^jsContextAlert)(NSString* str);
LBDeclare JSContext*   (^jsContextHistoryBack)(void);
LBDeclare JSContext*   (^jsContextHistoryForward)(void);
/** page ∈ {-1,0,1,2...} */
LBDeclare JSContext*   (^jsContextHistoryGo)(NSString* page);
@end
