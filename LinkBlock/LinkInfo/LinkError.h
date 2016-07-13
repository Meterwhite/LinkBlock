//
//  LinkError.h
//
//  Created by NOVO on 15/8/20.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkError : LinkInfo
/** 需要类型 */
@property (nonatomic,copy) NSString* needClass;
/** 错误类型 */
@property (nonatomic,copy) NSString* errorClass;
/** 所在函数 */
@property (nonatomic,copy)NSString* inFunc;

- (NSString *)description;
- (NSString *)debugDescription;
@end
