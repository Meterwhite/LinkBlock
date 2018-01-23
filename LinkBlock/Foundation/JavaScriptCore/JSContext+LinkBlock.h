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
/** <^(id key)> */
LBDeclare JSValue*     (^jsContextValue)(id key);
/** <^(NSObject <NSCopying> * key, id value)> */
LBDeclare JSContext*   (^jsContextSetValue)(NSObject <NSCopying> * key, id value);
/** <^(NSString* script)> */
LBDeclare JSValue*     (^jsContextEval)(NSString* script);
/** <^(NSString* func , NSArray* args)> */
LBDeclare JSValue*     (^jsContextCallFunc)(NSString* func , NSArray* args);

#pragma mark - DOM节点操作
/** <^(NSString* elementId, NSString* appendScript)> */
LBDeclare JSValue*     (^jsContextGetElementById)(NSString* elementId, NSString* appendScript);
/** <^(NSString* name, NSString* appendScript)> */
LBDeclare JSValue*     (^jsContextGetElementsByName)(NSString* name, NSString* appendScript);
/** <^(NSString* tagName, NSString* appendScript)> */
LBDeclare JSValue*     (^jsContextGetElementsByTagName)(NSString* tagName, NSString* appendScript);
/** <^()> */
LBDeclare NSString*    (^jsContextTitle)(void);
/** <^()> */
LBDeclare NSString*    (^jsContextHTML)(void);
/** <^()> */
LBDeclare NSString*    (^jsContextLocationHref)(void);
/** <^()> */
LBDeclare JSContext*   (^jsContextLocationReload)(void);
/** <^(NSString* str)> */
LBDeclare JSContext*   (^jsContextWrite)(NSString* str);
/** <^(NSString* str)> */
LBDeclare JSContext*   (^jsContextAlert)(NSString* str);
/** <^()> */
LBDeclare JSContext*   (^jsContextHistoryBack)(void);
/** <^()> */
LBDeclare JSContext*   (^jsContextHistoryForward)(void);
/** <^(NSString* page)>page = -1,0,1,2... */
LBDeclare JSContext*   (^jsContextHistoryGo)(NSString* page);
@end
