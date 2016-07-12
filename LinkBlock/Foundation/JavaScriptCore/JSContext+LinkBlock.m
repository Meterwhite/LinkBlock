//
//  JSContext+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 16/6/21.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(JSContextLinkBlock)
- (JSValue *(^)(id))jsContextValue
{
    return ^id(id key){
        LinkHandle_REF(JSValue, JSContext)
        return [_self objectForKeyedSubscript:key];
    };
}
- (void)setJsContextValue:(JSValue *(^)(id))jsContextValue{};

- (JSContext *(^)(NSObject <NSCopying> *, id))jsContextSetValue
{
    return ^id(NSObject <NSCopying> * key , id value){
        LinkHandle_REF(JSContext, JSContext)
        [_self setObject:value forKeyedSubscript:key];
        return _self;
    };
}
- (void)setJsContextSetValue:(JSContext *(^)(NSObject<NSCopying> *, id))jsContextSetValue{};

- (JSValue *(^)(NSString *))jsContextEval
{
    return ^id(NSString* script){
        LinkHandle_REF(JSValue, JSContext)
        return [_self evaluateScript:script];
    };
}
- (void)setJsContextEval:(JSValue *(^)(NSString *))jsContextEval{};

- (JSValue *(^)(NSString *, NSArray *))jsContextCallFunc
{
    return ^id(NSString* func , NSArray* args){
        LinkHandle_REF(JSValue, JSContext)
        return [[_self objectForKeyedSubscript:func] callWithArguments:args];
    };
}
- (void)setJsContextCallFunc:(JSValue *(^)(NSString *, NSArray *))jsContextCallFunc{};

- (JSValue *(^)(NSString *,NSString* ))jsContextGetElementById
{
    return ^id(NSString* elementId,NSString* appendScript){
        LinkHandle_REF(JSValue, JSContext)
        if([appendScript isKindOfClass:[NSString class]]){
            return [_self evaluateScript:[NSString stringWithFormat:@"document.getElementById(%@)%@",elementId,appendScript]];
        }else{
            return [_self evaluateScript:[NSString stringWithFormat:@"document.getElementById(%@)",elementId]];
        }
    };
}
- (void)setJsContextGetElementById:(JSValue *(^)(NSString *,NSString*))jsContextGetElementById{};

- (JSValue *(^)(NSString *, NSString *))jsContextGetElementsByName
{
    return ^id(NSString* elementId,NSString* appendScript){
        LinkHandle_REF(JSValue, JSContext)
        if([appendScript isKindOfClass:[NSString class]]){
            return [_self evaluateScript:[NSString stringWithFormat:@"document.getElementsByName(%@)%@",elementId,appendScript]];
        }else{
            return [_self evaluateScript:[NSString stringWithFormat:@"document.getElementsByName(%@)",elementId]];
        }
    };
}
- (void)setJsContextGetElementsByName:(JSValue *(^)(NSString *, NSString *))jsContextGetElementByName{};

- (JSValue *(^)(NSString *, NSString *))jsContextGetElementsByTagName
{
    return ^id(NSString* elementId,NSString* appendScript){
        LinkHandle_REF(JSValue, JSContext)
        if([appendScript isKindOfClass:[NSString class]]){
            return [_self evaluateScript:[NSString stringWithFormat:@"document.getElementsByTagName(%@)%@",elementId,appendScript]];
        }else{
            return [_self evaluateScript:[NSString stringWithFormat:@"document.getElementsByTagName(%@)",elementId]];
        }
    };
}
- (void)setJsContextGetElementsByTagName:(JSValue *(^)(NSString *, NSString *))jsContextGetElementByTagName{};

- (JSContext *(^)(NSString *))jsContextWrite
{
    return ^id(NSString* str){
        LinkHandle_REF(JSContext, JSContext)
        [_self evaluateScript:[NSString stringWithFormat:@"document.write(%@)",str]];
        return _self;
    };
}
- (void)setJsContextWrite:(JSContext *(^)(NSString *))jsContextWrite{};

- (JSContext *(^)(NSString *))jsContextAlert
{
    return ^id(NSString* str){
        LinkHandle_REF(JSContext, JSContext)
        [_self evaluateScript:[NSString stringWithFormat:@"document.alert(%@)",str]];
        return _self;
    };
}
- (void)setJsContextAlert:(JSContext *(^)(NSString *))jsContextAlert{};

- (JSContext *(^)())jsContextHistoryBack
{
    return ^id(NSString* str){
        LinkHandle_REF(JSContext, JSContext)
        [_self evaluateScript:@"document.history.back()"];
        return _self;
    };
}
- (void)setJsContextHistoryBack:(JSContext *(^)())jsContextHistoryBack{};

- (JSContext *(^)())jsContextHistoryForward
{
    return ^id(NSString* str){
        LinkHandle_REF(JSContext, JSContext)
        [_self evaluateScript:@"document.history.forward()"];
        return _self;
    };
}
- (void)setJsContextHistoryForward:(JSContext *(^)())jsContextHistoryForward{};

- (JSContext *(^)(NSString* page))jsContextHistoryGo
{
    return ^id(NSString* page){
        LinkHandle_REF(JSContext, JSContext)
        if(![page isKindOfClass:[NSString class]])  return _self;
        [_self evaluateScript:[NSString stringWithFormat:@"document.history.go(%@)",page]];
        return _self;
    };
}
- (void)setJsContextHistoryGo:(JSContext *(^)(NSString*))jsContextHistoryGo{};

- (NSString *(^)())jsContextTitle
{
    return ^id(){
        LinkHandle_REF(NSString, JSContext)
        return [[_self evaluateScript:@"document.title"] toString];
    };
}
- (void)setJsContextTitle:(NSString *(^)())jsContextTitle{};

- (NSString *(^)())jsContextHTML
{
    return ^id(){
        LinkHandle_REF(NSString, JSContext)
        return [[_self evaluateScript:@"document.documentElement.innerHTML"] toString];
    };
}
- (void)setJsContextHTML:(NSString *(^)())jsContextHTML{};

- (NSString *(^)())jsContextLocationHref
{
    return ^id(){
        LinkHandle_REF(NSString, JSContext)
        return [[_self evaluateScript:@"window.location.href"] toString];
    };
}
- (void)setJsContextLocationHref:(NSString *(^)())jsContextLocationHref{};

- (JSContext *(^)())jsContextLocationReload
{
    return ^id(){
        LinkHandle_REF(JSContext, JSContext)
        [_self evaluateScript:@"window.location.reload()"];
        return _self;
    };
}
- (void)setJsContextLocationReload:(JSContext *(^)())jsContextLocationReload{};
@end
