//
//  JSContext+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/6/21.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import <JavaScriptCore/JavaScriptCore.h>

@interface NSObject(JSContextLinkBlock)
/** <^(id key)> */
@property (nonatomic,copy,readonly) JSValue*     (^jsContextValue)(id key);
/** <^(NSObject <NSCopying> * key, id value)> */
@property (nonatomic,copy,readonly) JSContext*   (^jsContextSetValue)(NSObject <NSCopying> * key, id value);
/** <^(NSString* script)> */
@property (nonatomic,copy,readonly) JSValue*     (^jsContextEval)(NSString* script);
/** <^(NSString* func , NSArray* args)> */
@property (nonatomic,copy,readonly) JSValue*     (^jsContextCallFunc)(NSString* func , NSArray* args);

#pragma mark - DOM节点操作
/** <^(NSString* elementId, NSString* appendScript)> */
@property (nonatomic,copy,readonly) JSValue*     (^jsContextGetElementById)(NSString* elementId, NSString* appendScript);
/** <^(NSString* name, NSString* appendScript)> */
@property (nonatomic,copy,readonly) JSValue*     (^jsContextGetElementsByName)(NSString* name, NSString* appendScript);
/** <^(NSString* tagName, NSString* appendScript)> */
@property (nonatomic,copy,readonly) JSValue*     (^jsContextGetElementsByTagName)(NSString* tagName, NSString* appendScript);
/** <^()> */
@property (nonatomic,copy,readonly) NSString*    (^jsContextTitle)();
/** <^()> */
@property (nonatomic,copy,readonly) NSString*    (^jsContextHTML)();
/** <^()> */
@property (nonatomic,copy,readonly) NSString*    (^jsContextLocationHref)();
/** <^()> */
@property (nonatomic,copy,readonly) JSContext*   (^jsContextLocationReload)();
/** <^(NSString* str)> */
@property (nonatomic,copy,readonly) JSContext*   (^jsContextWrite)(NSString* str);
/** <^(NSString* str)> */
@property (nonatomic,copy,readonly) JSContext*   (^jsContextAlert)(NSString* str);
/** <^()> */
@property (nonatomic,copy,readonly) JSContext*   (^jsContextHistoryBack)();
/** <^()> */
@property (nonatomic,copy,readonly) JSContext*   (^jsContextHistoryForward)();
/** <^(NSString* page)>page = -1,0,1,2... */
@property (nonatomic,copy,readonly) JSContext*   (^jsContextHistoryGo)(NSString* page);
@end
