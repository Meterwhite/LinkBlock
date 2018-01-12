//
//  DynamicLinkAction.h
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/15.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DynamicLinkArgument;


/**
 动态链条上的一次调用
 */
@interface DynamicLinkAction : NSObject

/**
 使用block脚本代码创建动态block
 @return 而错误的脚本代码会返回nil
 */
+ (instancetype)dynamicLinkBlockWithCode:(NSString*)code index:(NSUInteger)index;


/**
 block的每个参数类型在这个数组中
 */
@property (nonatomic,strong,readonly) NSArray<NSString*>* objcTypeOfArguments;

/**
 block的返回值类型
 */
@property (nonatomic,assign,readonly) const char* objcTypeOfActionReturn;

/**
 block的参数总数（区别于NSInvocation的计数方式）
 */
@property (nonatomic,assign,readonly) NSUInteger numberOfArguments;

/**
 block返回值的内存大小
 */
@property (nonatomic,assign,readonly) NSUInteger lengthOfActionReturn;


/**
 执行当前block并返回执行结果

 @param origin 执行链条的对象
 @param vlist 输入参数的参数列表
 @param end 参数列表遍历状态的指针
 @return 返回值（装箱的），如果void返回类型才会返回nil否则是NSNull形式的装箱结果
 */
- (id)invoke:(id)origin args:(va_list)vlist end:(BOOL*)end;


/**
 验证状态，未验证的block是不可调用的，会导致程序崩溃
 */
@property (nonatomic,assign,readonly) BOOL validate;

/**
 用户的脚本代码
 */
@property (nonatomic,copy,readonly) NSString* stringValue;

/**
 调用名
 */
@property (nonatomic,copy,readonly) NSString* actionName;

/**
 当前动态block在整个链条中的的路径，长度至少为1，索引是0
 */
@property (nonatomic,strong,readonly) NSIndexPath* indexPath;
/**
 当前动态block在整个链条中的的位置，等同于self.indexPath的索引0处
 例如："block0().block1()...blockN(0,1,x)"，blockN的路径为 NSIndexPath(N,...);
 */
@property (nonatomic,assign,readonly) NSUInteger index;

/**
 动态链条上参数的个数
 */
@property (nonatomic,assign,readonly) NSUInteger countOfItems;


/**
 block中是否有该路径的子节点
 */
- (BOOL)containsIndexPathOfItem:(NSIndexPath*)indexPath;

/**
 尝试获取一个路径下的子节点，没有匹配时返回nil
 */
- (DynamicLinkArgument*)argumentAtIndexPath:(NSIndexPath*)indexPath;
@end
