//
//  UIWebView+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/6/22.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

#ifndef UIWebViewNew
#define UIWebViewNew ([UIWebView new])
#endif
@class JSContext;
@interface NSObject(UIWebViewLinkBlock)

#pragma mark - Foundation Speed/速度
LBDeclare JSContext*      (^webViewContext)(void);
LBDeclare NSString*       (^webViewEvalScript)(NSString* script);
LBDeclare NSString*       (^webViewTitle)(void);
LBDeclare NSString*       (^webViewLocationHref)(void);
LBDeclare NSString*       (^webViewHTML)(void);

@end
