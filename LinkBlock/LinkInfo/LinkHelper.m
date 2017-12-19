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

@interface LinkHelper<__covariant ObjectType>()
@property (nonatomic,weak) id target;
@end

@implementation LinkHelper

#pragma mark - 功能
- (BOOL)checkTargetType:(Class)type
{
    return [self.target isKindOfClass:type];
}

- (NSArray<NSString *> *)linkCodeSplite
{
    if(![self checkTargetType:[NSString class]]) return nil;
    
    NSString* code = [self.target copy];
    NSMutableArray<NSString*>* blocksString = [[code componentsSeparatedByString:@"."] mutableCopy];
    //排除@".a.b.c"，@"a.b.c."
    [blocksString removeObject:@""];
    return blocksString;
}


/**
 所有数字包括十六进制数字定为double类型

 @return objcType
 */
- (const char *)objcTypeFromValueCodeOfNSString
{
    if(![self checkTargetType:[NSString class]]) return nil;
    if(!self.target) return nil;
    
    NSString* code = [self.target copy];
    NSScanner* scanner = [[NSScanner alloc] initWithString:code];
    //整型
    if([scanner scanInt:NULL] && [scanner isAtEnd]){
        return @encode(int);
    }
    //double
    scanner.scanLocation = 0;
    if([scanner scanDouble:NULL] && [scanner isAtEnd]){
        return @encode(double);
    }
    //十六进制整型
    scanner.scanLocation = 0;
    if([scanner scanHexInt:NULL] && [scanner isAtEnd]){
        return @encode(unsigned);
    }
    //十六进制浮点
    scanner.scanLocation = 0;
    if([scanner scanHexDouble:NULL] && [scanner isAtEnd]){
        return @encode(double);
    }
    
    if([self.target isEqualToString:@"YES"]     ||
       [self.target isEqualToString:@"NO"]      ||
       [self.target isEqualToString:@"true"]    ||
       [self.target isEqualToString:@"false"]){
        return @encode(BOOL);
    }
    
    //NSString
    if([self.target rangeOfString:@"^@\"[\\s\\S]*\"$" options:NSRegularExpressionSearch].length){
        return @encode(id);
    }
    
    //char*
    if([self.target rangeOfString:@"^\"[\\s\\S]*\"$" options:NSRegularExpressionSearch].length){
        return @encode(char*);
    }
    
    //char
    if([self.target rangeOfString:@"^'\\w'$" options:NSRegularExpressionSearch].length){
        return @encode(char);
    }
    
    //NSNumber
    if([self.target rangeOfString:@"^@\\([\\s\\S]*\\)$" options:NSRegularExpressionSearch].length){
        return @encode(id);
    }
    
    //SEL
    if([self.target rangeOfString:@"^@selector\\(.+\\)$" options:NSRegularExpressionSearch].length){
        return @encode(SEL);
    }
    
    
    /*********************
      NSValue支持的结构体
     *********************/
    if([self.target rangeOfString:@"^CGRectMake\\(.+\\)$" options:NSRegularExpressionSearch].length){
        return @encode(CGRect);
    }
    
    if([self.target rangeOfString:@"^CGSizeMake\\(.+\\)$" options:NSRegularExpressionSearch].length){
        return @encode(CGSize);
    }
    
    if([self.target rangeOfString:@"^CGPoint\\(.+\\)$" options:NSRegularExpressionSearch].length){
        return @encode(CGPoint);
    }
    
    if([self.target rangeOfString:@"^NSMakeRange\\(.+\\)$" options:NSRegularExpressionSearch].length){
        return @encode(NSRange);
    }
    
    if([self.target rangeOfString:@"^UIEdgeInsetsMake\\(.+\\)$" options:NSRegularExpressionSearch].length){
        return @encode(UIEdgeInsets);
    }
    
    if([self.target rangeOfString:@"^CGVectorMake\\(.+\\)$" options:NSRegularExpressionSearch].length){
        return @encode(CGVector);
    }
    
    if([self.target rangeOfString:@"^UIOffsetMake\\(.+\\)$" options:NSRegularExpressionSearch].length){
        return @encode(UIOffset);
    }
    
    //CATransform3D无构造器和NSString形式所以都不支持识别
    
    if([self.target rangeOfString:@"^CGAffineTransformMake\\(.+\\)$" options:NSRegularExpressionSearch].length){
        return @encode(CGAffineTransform);
    }
    
    if (@available(iOS 11.0, *)){
        if([self.target rangeOfString:@"^NSDirectionalEdgeInsetsMake\\(.+\\)$" options:NSRegularExpressionSearch].length){
            return @encode(NSDirectionalEdgeInsets);
        }
    }
    
    if(NSClassFromString(self.target)){
        return @encode(Class);
    }
    
    return NULL;
}

- (void)valueCodeObjcValue:(void **)value objcType:(const char**)objcType
{
    if(![self checkTargetType:[NSString class]]){
        value = NULL;
        *objcType = NULL;
        return;
    }
    if(!self.target){
        value = NULL;
        *objcType = NULL;
        return;
    };
    
    NSString* code = [self.target copy];
    NSScanner* scanner = [[NSScanner alloc] initWithString:code];
    //整型
    int intV;
    if([scanner scanInt:&intV] && [scanner isAtEnd]){
        *objcType = @encode(int);
        *value = &intV;
        return;
    }
    //double
    double doubleV;
    scanner.scanLocation = 0;
    if([scanner scanDouble:&doubleV] && [scanner isAtEnd]){
        *objcType = @encode(double);
        value = &doubleV;
        return;
    }
    //十六进制整型
    unsigned unsignedV;
    scanner.scanLocation = 0;
    if([scanner scanHexInt:&unsignedV] && [scanner isAtEnd]){
        *objcType = @encode(unsigned);
        value = &unsignedV;
        return;
    }
    //十六进制浮点
    doubleV = 0.0;
    scanner.scanLocation = 0;
    if([scanner scanHexDouble:&doubleV] && [scanner isAtEnd]){
        *objcType = @encode(double);
        value = &doubleV;
        return;
    }
    
    //布尔值
    BOOL boolV;
    if([self.target isEqualToString:@"YES"]     ||
       [self.target isEqualToString:@"NO"]      ||
       [self.target isEqualToString:@"true"]    ||
       [self.target isEqualToString:@"false"]) {
        *objcType = @encode(BOOL);
        boolV = [self.target isEqualToString:@"YES"]||[self.target isEqualToString:@"true"];
        value = &boolV;
        return;
    }
    
    //NSString @"..."
    if([self.target rangeOfString:@"^@\"[\\s\\S]*\"$" options:NSRegularExpressionSearch].length){
        *objcType = @encode(id);
        NSString* stringV = [self.target substringWithRange:NSMakeRange(2, [self.target length]-3)];
//        value = &stringV;
        return;
    }
    
    //char* "..."
    if([self.target rangeOfString:@"^\"[\\s\\S]*\"$" options:NSRegularExpressionSearch].length){
        const char* charV = [[self.target substringWithRange:NSMakeRange(1, [self.target length]-2)] UTF8String];
        *objcType = @encode(char*);
//        value = &charV;
        return;
    }
    
    //char 'A'
    if([self.target rangeOfString:@"^'\\w'$" options:NSRegularExpressionSearch].length){
        *objcType = @encode(char);
        char charV = [self.target characterAtIndex:1];
//        value = &charV;
        return;
    }
    
    //NSNumber @(number)
    if([self.target rangeOfString:@"^@\\([\\s\\S]*\\)$" options:NSRegularExpressionSearch].length){
        *objcType = @encode(id);
        NSNumber* numberV = [NSNumber numberWithDouble:
                         [[self.target substringWithRange:NSMakeRange(2, [self.target length]-3)]
                          doubleValue]];
//        value = &numberV;
        return;
    }
    //NSNumber @number
    if([self.target rangeOfString:@"^@\\d+$" options:NSRegularExpressionSearch].length){
        *objcType = @encode(id);
        NSNumber* numberV = [NSNumber numberWithDouble:
                             [[self.target substringWithRange:NSMakeRange(1, [self.target length]-1)]
                              doubleValue]];
//        value = &numberV;
        return;
    }
    //NSNumber @YES
    if([self.target isEqualToString:@"@YES"] || [self.target isEqualToString:@"@NO"] ||
       [self.target isEqualToString:@"@true"] || [self.target isEqualToString:@"@false"]){
        *objcType = @encode(id);
        NSNumber* numberV = [NSNumber numberWithBool:
                             [self.target isEqualToString:@"@YES"]||[self.target isEqualToString:@"@true"]];
//        value = &numberV;
        return;
    }
    
    //SEL
    if([self.target rangeOfString:@"^@selector\\(.+\\)$" options:NSRegularExpressionSearch].length){
        *objcType = @encode(SEL);
        //@selector(xxxx)
        NSString* selectorString = [self.target substringWithRange:NSMakeRange(10, [self.target length]-11)];
        selectorString = [selectorString stringByReplacingOccurrencesOfString:@" " withString:@""];
        SEL selectorV = NSSelectorFromString(selectorString);
        value = &selectorV;
        return;
    }
    
    
    /*********************
     NSValue支持的结构体
     *********************/
    if([self.target rangeOfString:@"^CGRectMake\\(.+\\)$" options:NSRegularExpressionSearch].length){
        *objcType = @encode(CGRect);
        return;
    }
    
    if([self.target rangeOfString:@"^CGSizeMake\\(.+\\)$" options:NSRegularExpressionSearch].length){
        *objcType = @encode(CGSize);
        return;
    }
    
    if([self.target rangeOfString:@"^CGPoint\\(.+\\)$" options:NSRegularExpressionSearch].length){
        *objcType = @encode(CGPoint);
        return;
    }
    
    if([self.target rangeOfString:@"^NSMakeRange\\(.+\\)$" options:NSRegularExpressionSearch].length){
        *objcType = @encode(NSRange);
        return;
    }
    
    if([self.target rangeOfString:@"^UIEdgeInsetsMake\\(.+\\)$" options:NSRegularExpressionSearch].length){
        *objcType = @encode(UIEdgeInsets);
        return;
    }
    
    if([self.target rangeOfString:@"^CGVectorMake\\(.+\\)$" options:NSRegularExpressionSearch].length){
        *objcType = @encode(CGVector);
        return;
    }
    
    if([self.target rangeOfString:@"^UIOffsetMake\\(.+\\)$" options:NSRegularExpressionSearch].length){
        *objcType = @encode(UIOffset);
        return;
    }
    
    //CATransform3D无构造器和NSString形式所以都不支持识别
    
    if([self.target rangeOfString:@"^CGAffineTransformMake\\(.+\\)$" options:NSRegularExpressionSearch].length){
        *objcType = @encode(CGAffineTransform);
        return;
    }
    
    if (@available(iOS 11.0, *)){
        if([self.target rangeOfString:@"^NSDirectionalEdgeInsetsMake\\(.+\\)$" options:NSRegularExpressionSearch].length){
            *objcType = @encode(NSDirectionalEdgeInsets);
            return;
        }
    }
    
    if(NSClassFromString(self.target)){
        *objcType = @encode(Class);
        return;
    }
    
}

+ (void) helpSwitchObjcType:(const char*)objcType
                   caseVoid:(void(^)())caseVoid
                     caseId:(void(^)())caseId
                  caseClass:(void(^)())caseClass
                    caseIMP:(void(^)())caseIMP
                    caseSEL:(void(^)())caseSEL
                 caseDouble:(void(^)())caseDouble
                  caseFloat:(void(^)())caseFloat
                casePointer:(void(^)())casePointer
            caseCharPointer:(void(^)())caseCharPointer
           caseUnsignedLong:(void(^)())caseUnsignedLong
       caseUnsignedLongLong:(void(^)())caseUnsignedLongLong
                   caseLong:(void(^)())caseLong
               caseLongLong:(void(^)())caseLongLong
                    caseInt:(void(^)())caseInt
            caseUnsignedInt:(void(^)())caseUnsignedInt
      caseBOOL_Char_xyShort:(void(^)())casecaseBOOL_Char_xyShort
                 caseCGRect:(void(^)())caseCGRect
                caseNSRange:(void(^)())caseNSRange
                 caseCGSize:(void(^)())caseCGSize
                caseCGPoint:(void(^)())caseCGPoint
               caseCGVector:(void(^)())caseCGVector
           caseUIEdgeInsets:(void(^)())caseUIEdgeInsets
               caseUIOffset:(void(^)())caseUIOffset
          caseCATransform3D:(void(^)())caseCATransform3D
      caseCGAffineTransform:(void(^)())caseCGAffineTransform
caseNSDirectionalEdgeInsets:(void(^)())caseNSDirectionalEdgeInsets
                    defaule:(void(^)())defaule
{
    if(!objcType) return;
    
    do{
        if(caseVoid && strcmp(objcType, @encode(void)) == 0){
            caseVoid();
            break;
        };
        //常量则位移到类型符
        if (objcType[0] == _C_CONST) objcType++;
        
        if (objcType[0] == '@') {                                //id and block
            caseId();
            break;
        }else if (caseClass && strcmp(objcType, @encode(Class)) == 0){       //Class
            caseClass();
            break;
        }else if (caseIMP && strcmp(objcType, @encode(IMP)) == 0 ){         //IMP
            caseIMP();
            break;
        }else if (caseSEL && strcmp(objcType, @encode(SEL)) == 0) {         //SEL
            caseSEL();
            break;
        }else if (caseDouble && strcmp(objcType, @encode(double)) == 0){       //double
            caseDouble();
            break;
        }else if (caseFloat && strcmp(objcType, @encode(float)) == 0){       //float
            caseFloat();
            break;
        }else if (casePointer && objcType[0] == '^'){                           //pointer ( and const pointer)
            casePointer();
            break;
        }else if (caseCharPointer && strcmp(objcType, @encode(char *)) == 0) {      //char* (and const char*)
            caseCharPointer();
            break;
        }else if (caseUnsignedLong && strcmp(objcType, @encode(unsigned long)) == 0) {
            caseUnsignedLong();
            break;
        }else if (caseUnsignedLongLong && strcmp(objcType, @encode(unsigned long long)) == 0) {
            caseUnsignedLongLong();
            break;
        }else if (caseLong && strcmp(objcType, @encode(long)) == 0) {
            caseLong();
            break;
        }else if (caseLongLong && strcmp(objcType, @encode(long long)) == 0) {
            caseLongLong();
            break;
        }else if (caseInt && strcmp(objcType, @encode(int)) == 0) {
            caseInt();
            break;
        }else if (caseUnsignedInt && strcmp(objcType, @encode(unsigned int)) == 0) {
            caseUnsignedInt();
            break;
        }else if (casecaseBOOL_Char_xyShort &&
                  (strcmp(objcType, @encode(BOOL)) == 0           ||
                   strcmp(objcType, @encode(bool)) == 0           ||
                   strcmp(objcType, @encode(char)) == 0           ||
                   strcmp(objcType, @encode(short)) == 0          ||
                   strcmp(objcType, @encode(unsigned char)) == 0  ||
                   strcmp(objcType, @encode(unsigned short)) == 0) ){
                      casecaseBOOL_Char_xyShort();
                      break;
                  }else{                  //struct union and array
                      
                      if (caseCGRect && strcmp(objcType, @encode(CGRect)) == 0){
                          caseCGRect();
                          break;
                      }else if(caseCGPoint && strcmp(objcType, @encode(CGPoint)) == 0){
                          caseCGPoint();
                          break;
                      }else if (caseCGSize && strcmp(objcType, @encode(CGSize)) == 0){
                          caseCGSize();
                          break;
                      }else if (caseNSRange && strcmp(objcType, @encode(NSRange)) == 0){
                          caseNSRange();
                          break;
                      }else if (caseUIEdgeInsets && strcmp(objcType, @encode(UIEdgeInsets)) == 0){
                          caseUIEdgeInsets();
                          break;
                      }else if (caseCGVector && strcmp(objcType, @encode(CGVector)) == 0){
                          caseCGVector();
                          break;
                      }else if (caseUIOffset && strcmp(objcType, @encode(UIOffset)) == 0){
                          caseUIOffset();
                          break;
                      }else if(caseCATransform3D && strcmp(objcType, @encode(CATransform3D)) == 0){
                          caseCATransform3D();
                          break;
                      }else if(caseCGAffineTransform && strcmp(objcType, @encode(CGAffineTransform)) == 0){
                          caseCGAffineTransform();
                          break;
                      }
                      
                      if (@available(iOS 11.0, *)){
                          if(strcmp(objcType, @encode(NSDirectionalEdgeInsets)) == 0){
                              caseNSDirectionalEdgeInsets();
                              break;
                          }
                      }
                      
                      if(defaule){
                          defaule();
                          break;
                      }
                  }
    }while(0);
}


#pragma mark - 构造
- (instancetype)initWithTarget:(id)target
{
    _target = target;
    return self;
}
+ (id)help:(id)target
{
    return [[self alloc] initWithTarget:target];
}
//+ (BOOL)resolveInstanceMethod:(SEL)sel
//+ (BOOL)resolveClassMethod:(SEL)sel

#pragma mark - 消息转发
//快速转发
- (id)forwardingTargetForSelector:(SEL)aSelector
{
    return self.target;
}

//普通转发
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    return [self.target methodSignatureForSelector:aSelector];
}
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    //...
}

#pragma mark - NSObject
- (BOOL)respondsToSelector:(SEL)aSelector {
    return [_target respondsToSelector:aSelector];
}

- (BOOL)isEqual:(id)object {
    return [_target isEqual:object];
}

- (NSUInteger)hash {
    return [_target hash];
}

- (Class)superclass {
    return [_target superclass];
}

- (Class)class {
    return [_target class];
}

- (BOOL)isKindOfClass:(Class)aClass {
    return [_target isKindOfClass:aClass];
}

- (BOOL)isMemberOfClass:(Class)aClass {
    return [_target isMemberOfClass:aClass];
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol {
    return [_target conformsToProtocol:aProtocol];
}

- (BOOL)isProxy {
    return YES;
}

- (NSString *)description {
    return [_target description];
}

- (NSString *)debugDescription {
    return [_target debugDescription];
}

#pragma mark - 临时
/**
 执行装箱的block并返回装箱的返回值

 @param invocation 装箱的block
 @param args 参数列表
 @return 装箱的返回值SEL->NSString，char*->NSString，……
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
