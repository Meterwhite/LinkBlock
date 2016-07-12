//
//  UIWebView+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 16/6/22.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(UIWebViewLinkBlock)
- (JSContext *(^)())webViewContext
{
    return ^id(){
        LinkHandle_REF(JSContext, UIWebView)
        return (JSContext*)[_self valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    };
}
- (void)setWebViewContext:(JSContext *(^)())webViewContext{};

- (NSString *(^)())webViewTitle
{
    return ^id(){
        LinkHandle_REF(NSString, UIWebView)
        return [_self stringByEvaluatingJavaScriptFromString:@"document.title"];
    };
}
- (void)setWebViewTitle:(NSString *(^)())webViewTitle{};

- (NSString *(^)())webViewLocationHref
{
    return ^id(){
        LinkHandle_REF(NSString, UIWebView)
        return [_self stringByEvaluatingJavaScriptFromString:@"window.location.href"];
    };
}
- (void)setWebViewLocationHref:(NSString *(^)())webViewLocationHref{};

- (NSString *(^)(NSString* ))webViewEvalScript
{
    return ^id(NSString* script){
        LinkHandle_REF(NSString, UIWebView)
        return [_self stringByEvaluatingJavaScriptFromString:script];
    };
}
- (void)setWebViewEvalScript:(NSString *(^)(NSString *))webViewEvalScript{};

- (NSString *(^)())webViewHTML
{
    return ^id(){
        LinkHandle_REF(NSString, UIWebView)
        return [_self stringByEvaluatingJavaScriptFromString:@"document.documentElement.innerHTML"];
    };
}
- (void)setWebViewHTML:(NSString *(^)())webViewHTML{};
@end
