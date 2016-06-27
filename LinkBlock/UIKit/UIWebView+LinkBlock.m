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
    return ^(){
        LinkError_REF_AUTO(JSContext, UIWebView);
        return (JSContext*)[_self valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    };
}
- (void)setWebViewContext:(JSContext *(^)())webViewContext{};

- (NSString *(^)())webViewTitle
{
    return ^(){
        LinkError_REF_AUTO(NSString, UIWebView);
        return [_self stringByEvaluatingJavaScriptFromString:@"document.title"];
    };
}
- (void)setWebViewTitle:(NSString *(^)())webViewTitle{};

- (NSString *(^)())webViewLocationHref
{
    return ^(){
        LinkError_REF_AUTO(NSString, UIWebView);
        return [_self stringByEvaluatingJavaScriptFromString:@"window.location.href"];
    };
}
- (void)setWebViewLocationHref:(NSString *(^)())webViewLocationHref{};

- (NSString *(^)(NSString* ))webViewEvalScript
{
    return ^(NSString* script){
        LinkError_REF_AUTO(NSString, UIWebView);
        return [_self stringByEvaluatingJavaScriptFromString:script];
    };
}
- (void)setWebViewEvalScript:(NSString *(^)(NSString *))webViewEvalScript{};

- (NSString *(^)())webViewHTML
{
    return ^(){
        LinkError_REF_AUTO(NSString, UIWebView);
        return [_self stringByEvaluatingJavaScriptFromString:@"document.documentElement.innerHTML"];
    };
}
- (void)setWebViewHTML:(NSString *(^)())webViewHTML{};
@end
