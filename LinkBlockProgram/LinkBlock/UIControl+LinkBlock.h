//
//  UIControl+LinkBlock.h
//  ComProgram
//
//  Created by NOVO on 15/8/18.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl(LinkBlock)

- (void)blockAddTarget:(NSObject*)target
      forControlEvents:(UIControlEvents)controlEvents
             withBlock:(void (^)(UIControlEvents event))executeBlock;

/**
 *  仅仅移除通过方法 [blockAddTarget:forControlEvents:withBlock:]设置的事件绑定
 *  
 *  @param executeBlock  如果传入nil,所有事件将会被移除。
 */
-(void)blockRemoveTarget:(id)target
        forControlEvents:(UIControlEvents)controlEvents
               withBlock:(void (^)(UIControlEvents event))executeBlock;

/** 私有扩展方法，不应调用 */
- (NSMutableDictionary *)private__GetPrivateDict;
@end
