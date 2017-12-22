//
//  DynamicLink.h
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/15.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DynamicLinkBlock;
@class DynamicLinkArgument;


/**
 动态链条的定义
 */
@interface DynamicLink : NSObject

/**
 创建可执行的动态链条代码对象

 @param code 可执行的动态链条代码
 
 "linkBlockFunction([空白|数字|],,,...)"
 参数
 */
+ (instancetype)dynamicLinkWithCode:(NSString*)code;

/**
 脚本代码
 */
@property (nonatomic,readonly) NSString* code;

/**
 block的数量
 */
@property (nonatomic,assign,readonly) NSUInteger countOfItems;

/**
 获取indexPath处的动态block对象

 @param indexPath 至少需要长度为1的路径
 */
- (DynamicLinkBlock*)blockAtIndexPath:(NSIndexPath*)indexPath;

/**
 获取indexPath处的动态链条上的参数

 @param indexPath 至少需要长度为2的路径
 */
- (DynamicLinkArgument*)argumentAtIndexPath:(NSIndexPath*)indexPath;

/**
 执行动态链条并返回执行结果

 @param origin 执行链条的对象
 @param list 输入参数的参数列表
 @return 返回值（装箱的），如果void返回类型才会返回nil否则是NSNull形式的装箱结果
 */
- (id)invoke:(id)origin args:(va_list)list;
@end
