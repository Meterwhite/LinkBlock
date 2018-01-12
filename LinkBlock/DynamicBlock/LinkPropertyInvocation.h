//
//  LinkPropertyInvocation.h
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/26.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN


/**
 属性格式调用
 */
@interface LinkPropertyInvocation : NSObject

/**
 构造方法，运行时报错
 */
+ (instancetype)invocationWithCode:(NSString*)code;

#pragma mark - override NSInvocation
- (id)invokeWithTarget:(id)target;
@end
NS_ASSUME_NONNULL_END
