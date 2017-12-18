//
//  DynamicLink.m
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/15.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import "DynamicLink.h"

@implementation DynamicLink

- (id)invokeLinkWith:(id)linkObj args:(va_list)args0
{
    //无对象返回空
    if(!linkObj) goto END;
    
    //无code返回对象本身
    if(!self.code) return linkObj;
    
    va_list args;
    va_copy(args0, args);
    
    //解析code，得到blocks和更多的信息
    /*
     信息体数组
     信息体 = (函数名,参数描述体数组)
     参数描述体 = (索引,字符串值,类型,值)
     
     for(信息体数组){
     函数名,参数描述体数组
     调用体 = (函数名)
     
     
     }
     
     
     
     for(va_list,i){
     
     函数参数和=(invocation)
     
     }
     
     */
    
    //执行每一个block
    /*
     args,
     */
    
    //返回结果
    
END:
    return [NSNull null];
}
@end
