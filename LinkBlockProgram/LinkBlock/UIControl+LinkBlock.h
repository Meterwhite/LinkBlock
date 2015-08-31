//
//  UIControl+LinkBlock.h
//
//  Created by NOVO on 15/8/18.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject(UIControlLinkBlock)

- (void)controlAddTarget:(NSObject*)target
      forControlEvents:(UIControlEvents)controlEvents
             withBlock:(void (^)(UIControlEvents event))executeBlock;

/** 如果传入nil,所有事件将会被移除 */
/** If executeBlock is nil, all events will be removed  */
-(void)controlRemoveTarget:(id)target
        forControlEvents:(UIControlEvents)controlEvents
               withBlock:(void (^)(UIControlEvents event))executeBlock;




- (NSMutableDictionary *)private__GetPrivateDict;
@end
