//
//  JSContext+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/6/21.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import <JavaScriptCore/JavaScriptCore.h>

@interface NSObject(JSContextLinkBlock)
@property (nonatomic,copy) JSValue*     (^jsContextValue)(id key);
@property (nonatomic,copy) JSContext*   (^jsContextSetValue)(NSObject <NSCopying> * key, id value);
@property (nonatomic,copy) JSValue*     (^jsContextEval)(NSString* script);
@property (nonatomic,copy) JSValue*     (^jsContextCallFunc)(NSString* func , NSArray* args);

#pragma mark - DOM节点操作
@property (nonatomic,copy) JSValue*     (^jsContextGetElementById)(NSString* elementId, NSString* appendScript);
@property (nonatomic,copy) JSValue*     (^jsContextGetElementsByName)(NSString* name, NSString* appendScript);
@property (nonatomic,copy) JSValue*     (^jsContextGetElementsByTagName)(NSString* tagName, NSString* appendScript);
@property (nonatomic,copy) NSString*    (^jsContextTitle)();
@property (nonatomic,copy) NSString*    (^jsContextHTML)();
@property (nonatomic,copy) NSString*    (^jsContextLocationHref)();
@property (nonatomic,copy) JSContext*   (^jsContextLocationReload)();
@property (nonatomic,copy) JSContext*   (^jsContextWrite)(NSString* str);
@property (nonatomic,copy) JSContext*   (^jsContextAlert)(NSString* str);
@property (nonatomic,copy) JSContext*   (^jsContextHistoryBack)();
@property (nonatomic,copy) JSContext*   (^jsContextHistoryForward)();
/** page = -1,0,1,2... */
@property (nonatomic,copy) JSContext*   (^jsContextHistoryGo)(NSString* page);
@end
