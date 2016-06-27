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
    return ^(id key){
        LinkError_REF_AUTO(JSValue, JSContext);
        return [_self objectForKeyedSubscript:key];
    };
}
- (void)setJsContextValue:(JSValue *(^)(id))jsContextValue{};

- (JSContext *(^)(NSObject <NSCopying> *, id))jsContextSetValue
{
    return ^(NSObject <NSCopying> * key , id value){
        LinkError_REF_AUTO(JSContext, JSContext);
        [_self setObject:value forKeyedSubscript:key];
        return _self;
    };
}
- (void)setJsContextSetValue:(JSContext *(^)(NSObject<NSCopying> *, id))jsContextSetValue{};

- (JSValue *(^)(NSString *))jsContextEval
{
    return ^(NSString* script){
        LinkError_REF_AUTO(JSValue, JSContext);
        return [_self evaluateScript:script];
    };
}
- (void)setJsContextEval:(JSValue *(^)(NSString *))jsContextEval{};

- (JSValue *(^)(NSString *, NSArray *))jsContextCallFunc
{
    return ^(NSString* func , NSArray* args){
        LinkError_REF_AUTO(JSValue, JSContext);
        return [[_self objectForKeyedSubscript:func] callWithArguments:args];
    };
}
- (void)setJsContextCallFunc:(JSValue *(^)(NSString *, NSArray *))jsContextCallFunc{};

- (JSValue *(^)(NSString *,NSString* ))jsContextGetElementById
{
    return ^(NSString* elementId,NSString* appendScript){
        LinkError_REF_AUTO(JSValue, JSContext);
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
    return ^(NSString* elementId,NSString* appendScript){
        LinkError_REF_AUTO(JSValue, JSContext);
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
    return ^(NSString* elementId,NSString* appendScript){
        LinkError_REF_AUTO(JSValue, JSContext);
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
    return ^(NSString* str){
        LinkError_REF_AUTO(JSContext, JSContext);
        [_self evaluateScript:[NSString stringWithFormat:@"document.write(%@)",str]];
        return _self;
    };
}
- (void)setJsContextWrite:(JSContext *(^)(NSString *))jsContextWrite{};

- (JSContext *(^)(NSString *))jsContextAlert
{
    return ^(NSString* str){
        LinkError_REF_AUTO(JSContext, JSContext);
        [_self evaluateScript:[NSString stringWithFormat:@"document.alert(%@)",str]];
        return _self;
    };
}
- (void)setJsContextAlert:(JSContext *(^)(NSString *))jsContextAlert{};

- (JSContext *(^)())jsContextHistoryBack
{
    return ^(NSString* str){
        LinkError_REF_AUTO(JSContext, JSContext);
        [_self evaluateScript:@"document.history.back()"];
        return _self;
    };
}
- (void)setJsContextHistoryBack:(JSContext *(^)())jsContextHistoryBack{};

- (JSContext *(^)())jsContextHistoryForward
{
    return ^(NSString* str){
        LinkError_REF_AUTO(JSContext, JSContext);
        [_self evaluateScript:@"document.history.forward()"];
        return _self;
    };
}
- (void)setJsContextHistoryForward:(JSContext *(^)())jsContextHistoryForward{};

- (JSContext *(^)(NSString* page))jsContextHistoryGo
{
    return ^(NSString* page){
        LinkError_REF_AUTO(JSContext, JSContext);
        if(![page isKindOfClass:[NSString class]])  return _self;
        [_self evaluateScript:[NSString stringWithFormat:@"document.history.go(%@)",page]];
        return _self;
    };
}
- (void)setJsContextHistoryGo:(JSContext *(^)(NSString*))jsContextHistoryGo{};

- (NSString *(^)())jsContextTitle
{
    return ^(){
        LinkError_REF_AUTO(NSString, JSContext);
        return [[_self evaluateScript:@"document.title"] toString];
    };
}
- (void)setJsContextTitle:(NSString *(^)())jsContextTitle{};

- (NSString *(^)())jsContextHTML
{
    return ^(){
        LinkError_REF_AUTO(NSString, JSContext);
        return [[_self evaluateScript:@"document.documentElement.innerHTML"] toString];
    };
}
- (void)setJsContextHTML:(NSString *(^)())jsContextHTML{};

- (NSString *(^)())jsContextLocationHref
{
    return ^(){
        LinkError_REF_AUTO(NSString, JSContext);
        return [[_self evaluateScript:@"window.location.href"] toString];
    };
}
- (void)setJsContextLocationHref:(NSString *(^)())jsContextLocationHref{};

- (JSContext *(^)())jsContextLocationReload
{
    return ^(){
        LinkError_REF_AUTO(JSContext, JSContext);
        [_self evaluateScript:@"window.location.reload()"];
        return _self;
    };
}
- (void)setJsContextLocationReload:(JSContext *(^)())jsContextLocationReload{};
@end
