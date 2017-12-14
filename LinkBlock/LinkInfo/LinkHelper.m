//
//  LinkHelper.m
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/13.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import "LinkBlock.h"
#import "LinkHelper.h"
#import <objc/runtime.h>


/**
 block装箱
 */
static inline NSInvocation* invocationFromBlock(id block)
{
    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:[NSMethodSignature signatureWithObjCTypes:LB_BlockSignature(block)]];
    invocation.target = block;
    return invocation;
}


@implementation LinkHelper


/**
 执行装箱的block并返回装箱的返回值

 @param invocation 装箱的block
 @param args 参数列表
 @return 装箱的返回值SEL->NSString，char* -> NSString，……
 */
+ (id)invokeAndReturnBoxedWithBlockInvocation:(NSInvocation*)invocation args:(va_list)args
{
    const char* returnType = invocation.methodSignature.methodReturnType;
    
    if(strcmp(returnType, @encode(void)) == 0) goto END;
    //常量则位移到类型符
    if (returnType[0] == _C_CONST) returnType++;
    
    if (returnType[0] == '@') {                                //id and block
        
        id returnValue = NULL;
        invokeBlockInvocationWithArgs(invocation , args , &returnValue);
        return returnValue;
    }else if (strcmp(returnType, @encode(Class)) == 0 ){       //Class
        
        Class returnValue = NULL;
        invokeBlockInvocationWithArgs(invocation , args , &returnValue);
        return returnValue;
    }else if (strcmp(returnType, @encode(IMP)) == 0 ){         //IMP
        
        void* returnValue = NULL;
        invokeBlockInvocationWithArgs(invocation , args , &returnValue);
        return [NSValue value:returnValue withObjCType:@encode(IMP)];
    }else if (strcmp(returnType, @encode(SEL)) == 0) {         //SEL
        
        SEL returnValue = NULL;
        invokeBlockInvocationWithArgs(invocation , args , &returnValue);
        return NSStringFromSelector(returnValue);
    }else if (strcmp(returnType, @encode(double)) == 0){       //double
        
        double returnValue;
        invokeBlockInvocationWithArgs(invocation , args , &returnValue);
        return [NSNumber numberWithDouble:returnValue];
    }else if (strcmp(returnType, @encode(float)) == 0){       //float
        
        float returnValue;
        invokeBlockInvocationWithArgs(invocation , args , &returnValue);
        return [NSNumber numberWithFloat:returnValue];
    }else if (returnType[0] == '^'){                           //pointer ( and const pointer)
        
        void* returnValue;
        invokeBlockInvocationWithArgs(invocation , args , &returnValue);
        return [NSValue valueWithPointer:returnValue];
    }else if (strcmp(returnType, @encode(char *)) == 0) {      //char* (and const char*)
        
        char* returnValue;
        invokeBlockInvocationWithArgs(invocation , args , &returnValue);
        return [NSString stringWithUTF8String:returnValue];
    }else if (strcmp(returnType, @encode(unsigned long)) == 0) {
        
        unsigned long returnValue;
        invokeBlockInvocationWithArgs(invocation , args , &returnValue);
        return [NSNumber numberWithUnsignedLong:returnValue];
    }else if (strcmp(returnType, @encode(unsigned long long)) == 0) {
        
        unsigned long long returnValue;
        invokeBlockInvocationWithArgs(invocation , args , &returnValue);
        return [NSNumber numberWithUnsignedLongLong:returnValue];
    }else if (strcmp(returnType, @encode(long)) == 0) {
        
        long returnValue;
        invokeBlockInvocationWithArgs(invocation , args , &returnValue);
        return [NSNumber numberWithLong:returnValue];
    }else if (strcmp(returnType, @encode(long long)) == 0) {
        
        long long returnValue;
        invokeBlockInvocationWithArgs(invocation , args , &returnValue);
        return [NSNumber numberWithLongLong:returnValue];
    }else if (strcmp(returnType, @encode(int)) == 0) {
        
        int returnValue;
        invokeBlockInvocationWithArgs(invocation , args , &returnValue);
        return [NSNumber numberWithInt:returnValue];
    }else if (strcmp(returnType, @encode(unsigned int)) == 0) {
        
        unsigned int returnValue;
        invokeBlockInvocationWithArgs(invocation , args , &returnValue);
        return [NSNumber numberWithUnsignedInt:returnValue];
    }else if (strcmp(returnType, @encode(BOOL)) == 0 || strcmp(returnType, @encode(bool)) == 0
              || strcmp(returnType, @encode(char)) == 0 || strcmp(returnType, @encode(unsigned char)) == 0
              || strcmp(returnType, @encode(short)) == 0 || strcmp(returnType, @encode(unsigned short)) == 0) {
        
        int returnValue;
        invokeBlockInvocationWithArgs(invocation , args , &returnValue);
        return [NSNumber numberWithInt:returnValue];
    }else{                  //struct union and array
        
        if(strcmp(returnType, @encode(CGPoint)) == 0){
            
            CGPoint returnValue;
            invokeBlockInvocationWithArgs(invocation , args , &returnValue);
            return [NSValue valueWithCGPoint:returnValue];
        }else if (strcmp(returnType, @encode(CGRect)) == 0){
            
            CGRect returnValue;
            invokeBlockInvocationWithArgs(invocation , args , &returnValue);
            return [NSValue valueWithCGRect:returnValue];
        }else if (strcmp(returnType, @encode(CGSize)) == 0){
            
            CGSize returnValue;
            invokeBlockInvocationWithArgs(invocation , args , &returnValue);
            return [NSValue valueWithCGSize:returnValue];
        }else if (strcmp(returnType, @encode(CGVector)) == 0){
            
            CGVector returnValue;
            invokeBlockInvocationWithArgs(invocation , args , &returnValue);
            return [NSValue valueWithCGVector:returnValue];
        }else if (strcmp(returnType, @encode(NSRange)) == 0){
            
            NSRange returnValue;
            invokeBlockInvocationWithArgs(invocation , args , &returnValue);
            return [NSValue valueWithRange:returnValue];
        }else if (strcmp(returnType, @encode(UIEdgeInsets)) == 0){
            
            UIEdgeInsets returnValue;
            invokeBlockInvocationWithArgs(invocation , args , &returnValue);
            return [NSValue valueWithUIEdgeInsets:returnValue];
        }else if (strcmp(returnType, @encode(UIOffset)) == 0){
            
            UIOffset returnValue;
            invokeBlockInvocationWithArgs(invocation , args , &returnValue);
            return [NSValue valueWithUIOffset:returnValue];
        }else if(strcmp(returnType, @encode(CATransform3D)) == 0){
            CATransform3D returnValue;
            invokeBlockInvocationWithArgs(invocation , args , &returnValue);
            return [NSValue valueWithCATransform3D:returnValue];
        }else if(strcmp(returnType, @encode(CGAffineTransform)) == 0){
            CGAffineTransform returnValue;
            invokeBlockInvocationWithArgs(invocation , args , &returnValue);
            return [NSValue valueWithCGAffineTransform:returnValue];
        }else if (@available(iOS 11.0, *)){
            
            if(strcmp(returnType, @encode(NSDirectionalEdgeInsets)) == 0){
                NSDirectionalEdgeInsets returnValue;
                invokeBlockInvocationWithArgs(invocation , args , &returnValue);
                return [NSValue valueWithDirectionalEdgeInsets:returnValue];
            }
        }
//        else{
//            NSAssert(NO, @"Unsupported struct union or array!");
//        }
    }
END:
    return nil;
}

#define Macro_SetArgWithType(type) do { type val; val = va_arg(args,type); [invocation setArgument:&val atIndex:i + 1];} while (0)

/**
 执行block并返回结果

 @param invocation 装箱的block
 @param args 参数列表
 @param returnValue 返回值
 */
static void invokeBlockInvocationWithArgs(NSInvocation*  invocation       ,
                                          va_list        args             ,
                                          void*          returnValue)
{
    NSUInteger argsCount = invocation.methodSignature.numberOfArguments - 1;
    
    const char* argType = 0;
    for (NSUInteger i = 1; i < argsCount; i++) {
        argType = [invocation.methodSignature getArgumentTypeAtIndex:i + 1];
        
        if (argType[0] == _C_CONST) argType++;
        
        if (argType[0] == '@') {                                //id and block
            
            id arg = va_arg(args, id);
            if(arg != [NSNull null]){
                [invocation setArgument:&arg atIndex:i + 1];
            }
        }else if (strcmp(argType, @encode(Class)) == 0 ){       //Class
            
            Macro_SetArgWithType(Class);
        }else if (strcmp(argType, @encode(IMP)) == 0 ){         //IMP
            
            Macro_SetArgWithType(IMP);
        }else if (strcmp(argType, @encode(SEL)) == 0) {         //SEL
            
            Macro_SetArgWithType(SEL);
        }else if (strcmp(argType, @encode(double)) == 0){       //double
            
            Macro_SetArgWithType(double);
        }else if (strcmp(argType, @encode(float)) == 0){       //float
            
            float val = 0;
            val = (float)va_arg(args,double);
            [invocation setArgument:&val atIndex:i + 1];
        }else if (argType[0] == '^'){                           //pointer ( and const pointer)
            
            Macro_SetArgWithType(void*);
        }else if (strcmp(argType, @encode(char *)) == 0) {      //char* (and const char*)
            
            Macro_SetArgWithType(char *);
        }else if (strcmp(argType, @encode(unsigned long)) == 0) {
            
            Macro_SetArgWithType(unsigned long);
        }else if (strcmp(argType, @encode(unsigned long long)) == 0) {
            
            Macro_SetArgWithType(unsigned long long);
        }else if (strcmp(argType, @encode(long)) == 0) {
            
            Macro_SetArgWithType(long);
        }else if (strcmp(argType, @encode(long long)) == 0) {
            
            Macro_SetArgWithType(long long);
        }else if (strcmp(argType, @encode(int)) == 0) {
            
            Macro_SetArgWithType(int);
        }else if (strcmp(argType, @encode(unsigned int)) == 0) {
            
            Macro_SetArgWithType(unsigned int);
        }else if (strcmp(argType, @encode(BOOL)) == 0 || strcmp(argType, @encode(bool)) == 0
                  || strcmp(argType, @encode(char)) == 0 || strcmp(argType, @encode(unsigned char)) == 0
                  || strcmp(argType, @encode(short)) == 0 || strcmp(argType, @encode(unsigned short)) == 0) {
            
            Macro_SetArgWithType(int);
        }else{                  //struct union and array
            
            if(strcmp(argType, @encode(CGPoint)) == 0){
                Macro_SetArgWithType(CGPoint);
            }else if (strcmp(argType, @encode(CGRect)) == 0){
                Macro_SetArgWithType(CGRect);
            }else if (strcmp(argType, @encode(CGSize)) == 0){
                Macro_SetArgWithType(CGSize);
            }else if (strcmp(argType, @encode(CGVector)) == 0){
                Macro_SetArgWithType(CGVector);
            }else if (strcmp(argType, @encode(NSRange)) == 0){
                Macro_SetArgWithType(NSRange);
            }else if (strcmp(argType, @encode(UIEdgeInsets)) == 0){
                Macro_SetArgWithType(UIEdgeInsets);
            }else if (strcmp(argType, @encode(UIOffset)) == 0){
                Macro_SetArgWithType(UIOffset);
            }else if(strcmp(argType, @encode(CATransform3D)) == 0){
                Macro_SetArgWithType(CATransform3D);
            }else if(strcmp(argType, @encode(CGAffineTransform)) == 0){
                Macro_SetArgWithType(CGAffineTransform);
            }else if (@available(iOS 11.0, *)){
                if(strcmp(argType , @encode(NSDirectionalEdgeInsets)) == 0){
                    Macro_SetArgWithType(NSDirectionalEdgeInsets);
                }
            }
//            else{
//                assert(false && @"Unsupported struct union or array! Use");
//            }
        }
    }
    
    //调用block
    [invocation invoke];
    
    //返回值
    if(strcmp(invocation.methodSignature.methodReturnType, @encode(void)) !=0){
        [invocation setReturnValue:&returnValue];
    }
}

@end
