//
//  UIWebView+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/6/22.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

#define UIWebViewNew ([UIWebView new])

@interface NSObject(UIWebViewLinkBlock)
@property (nonatomic,copy) JSContext*      (^webViewContext)();
@property (nonatomic,copy) NSString*       (^webViewEvalScript)(NSString* script);
@property (nonatomic,copy) NSString*       (^webViewTitle)();
@property (nonatomic,copy) NSString*       (^webViewLocationHref)();
@property (nonatomic,copy) NSString*       (^webViewHTML)();
@end
