//
//  DynamicLinkArgument.h
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/15.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DynamicLinkArgument;

/**
 DynamicLink上的字面量
 "actionName(,,字面量,,)".linkCodeEval(target , arg1 , arg2 ,...)
 不通过字面量传值的参数位置则留下对应的逗号！上方样例中'字面量'作为第3个参数被block使用而不是使用第1个传入的参数arg1作为第一个入参的值。
 
 直接量参数的形式
 ********************************
 数字，十六进制的数字：       -123.456"，0xdcdcdc；
 整数识别为long，浮点数识别double
 支持形如 1+Math.sin(-1) 这样的复杂算术表达式，数学函数支持javascript的Math库函数
 ********************************
 字符串：                    @\"短空长多\"
 ********************************
 布尔值：                    YES,true
 ********************************
 c字符串：                   "短空长多"
 ********************************
 字符：                      'A'
 ********************************
 NSNumber：                  @(123.456),@123.456,@YES,@true
 ********************************
 SEL：                       @selector(viewDidLoad)
 ********************************
 struct：                    使用结构体的Make函数例如：CGRectMake(0,0,0,0);
 目前只支持NSValue可装箱的结构体类型；CGSizeMake,CGPointMake,NSMakeRange,
 UIEdgeInsetsMake,CGVectorMake,UIOffsetMake,CGAffineTransformMake,
 NSDirectionalEdgeInsetsMake
 ********************************
 Class：                     NSString
 ********************************
 DynamicLinkCode:           参数可以再次是代码的形式，但是不能接受传参
 */
@interface DynamicLinkArgument : NSObject

/**
 根据用户脚本代码返回DynamicLinkArgument；错误的脚本代码会生成未验证的参数对象，在这里会返回nil
 */
+ (instancetype)dynamicLinkArgumentFromVlueCode:(NSString*)code;
/**
 验证状态，未验证的参数是不能识别的
 */
@property (nonatomic,assign,readonly) BOOL validate;
/**
 当前参数在整个链条中的的路径，长度至少为2，索引是1处
 例如："block0().block1()...blockN(0,1,x)"，参数 x = NSIndexPath*(N,2);
 */
@property (nonatomic,strong,readonly) NSIndexPath* indexPath;
/**
 当前动态block在整个链条中的的位置，等同于self.indexPath的索引1处
 */
@property (nonatomic,assign,readonly) NSUInteger index;
/**
 用户在block指定的参数的脚本代码
 */
@property (nonatomic,copy,readonly) NSString* stringValue;

/**
 值类型
 */
@property (nonatomic,assign,readonly) const char* objcType;

/**
 装箱值
 */
@property (nonatomic,strong,readonly) NSValue* objcValue;
@end
